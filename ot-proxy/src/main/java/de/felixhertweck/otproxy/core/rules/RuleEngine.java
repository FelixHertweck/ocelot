package de.felixhertweck.otproxy.core.rules;

import java.time.Instant;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import de.felixhertweck.otproxy.config.DirectionalRateLimitConfig;
import de.felixhertweck.otproxy.config.ProxyConfig;
import de.felixhertweck.otproxy.config.RateLimitConfig;
import de.felixhertweck.otproxy.config.RegisterRuleConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.ViolationAction;
import de.felixhertweck.otproxy.core.model.WriteRequest;

public class RuleEngine {

    private final ProxyConfig config;
    private final List<Rule> rules;

    // Built once so per-request lookups are O(1) instead of scanning the register list.
    private final Map<Integer, RegisterRuleConfig> registersByAddress;

    private final RateLimitConfig defaultReadLimit;
    private final String defaultOnViolation;
    private final RateLimitEvaluator readEvaluator = new RateLimitEvaluator();

    public RuleEngine(ProxyConfig config) {
        this.config = config;
        DirectionalRateLimitConfig defaults =
                config.getRules() != null ? config.getRules().getDefaultRateLimit() : null;
        RateLimitConfig defaultWriteLimit = defaults != null ? defaults.getWrite() : null;
        this.defaultReadLimit = defaults != null ? defaults.getRead() : null;
        this.defaultOnViolation =
                config.getRules() != null ? config.getRules().getDefaultOnViolation() : null;
        this.registersByAddress = indexRegisters(config, defaultOnViolation);
        this.rules =
                List.of(
                        new WhitelistRule(),
                        new ValueRangeRule(),
                        new RateLimitRule(defaultWriteLimit));
    }

    private static Map<Integer, RegisterRuleConfig> indexRegisters(
            ProxyConfig config, String defaultOnViolation) {
        Map<Integer, RegisterRuleConfig> index = new HashMap<>();
        if (config.getRules() != null && config.getRules().getRegisters() != null) {
            for (RegisterRuleConfig register : config.getRules().getRegisters()) {
                // Resolve the rules-level default into registers that don't set their own action.
                if (register.getOnViolation() == null) {
                    register.setOnViolation(defaultOnViolation);
                }
                // First entry wins on duplicate addresses, matching the previous findFirst scan.
                index.putIfAbsent(register.getAddress(), register);
            }
        }
        return index;
    }

    public RuleResult evaluate(WriteRequest request) {
        RegisterRuleConfig registerConfig = findRegisterConfig(request.registerAddress());

        if (registerConfig == null) {
            // Register not explicitly configured — apply default action
            String defaultAction =
                    config.getRules() != null ? config.getRules().getDefaultAction() : "DENY";
            if ("DENY".equalsIgnoreCase(defaultAction)) {
                return RuleResult.deny(
                        ViolationAction.parse(defaultOnViolation),
                        "Register " + request.registerAddress() + " is not in the whitelist");
            }
            return RuleResult.allow();
        }

        for (Rule rule : rules) {
            RuleResult result = rule.evaluate(request, registerConfig);
            if (!result.allowed()) {
                return result;
            }
        }
        return RuleResult.allow();
    }

    /**
     * Applies the read rate limit for a read of {@code address}: the register's own {@code read}
     * limit, else the rules default. Returns {@link RuleResult#allow()} when neither is configured.
     */
    public RuleResult evaluateRead(int address, Instant now) {
        RegisterRuleConfig registerConfig = findRegisterConfig(address);
        boolean hasOwnLimit = registerConfig != null && registerConfig.getRead() != null;
        RateLimitConfig limit = hasOwnLimit ? registerConfig.getRead() : defaultReadLimit;
        String onViolation;
        if (hasOwnLimit) {
            // register's own read limit: read.on_violation → register.on_violation
            onViolation =
                    registerConfig.getRead().getOnViolation() != null
                            ? registerConfig.getRead().getOnViolation()
                            : registerConfig.getOnViolation();
        } else if (registerConfig != null) {
            // global default for a known register: register.on_violation overrides global limit's
            String globalAction =
                    defaultReadLimit != null ? defaultReadLimit.getOnViolation() : null;
            onViolation =
                    registerConfig.getOnViolation() != null
                            ? registerConfig.getOnViolation()
                            : globalAction;
        } else {
            // no register config (unlisted address): global limit's on_violation →
            // defaultOnViolation
            String globalAction =
                    defaultReadLimit != null ? defaultReadLimit.getOnViolation() : null;
            onViolation = globalAction != null ? globalAction : defaultOnViolation;
        }
        return readEvaluator.evaluate(limit, address, now, onViolation, "read register " + address);
    }

    private RegisterRuleConfig findRegisterConfig(int address) {
        return registersByAddress.get(address);
    }
}
