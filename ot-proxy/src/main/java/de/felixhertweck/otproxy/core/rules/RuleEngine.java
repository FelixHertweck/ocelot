package de.felixhertweck.otproxy.core.rules;

import java.time.Instant;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import de.felixhertweck.otproxy.config.DirectionalRateLimitConfig;
import de.felixhertweck.otproxy.config.PointRuleConfig;
import de.felixhertweck.otproxy.config.ProxyConfig;
import de.felixhertweck.otproxy.config.RateLimitConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.ViolationAction;
import de.felixhertweck.otproxy.core.model.WriteRequest;

public class RuleEngine {

    private final ProxyConfig config;
    private final List<Rule> rules;

    // Built once so per-request lookups are O(1) instead of scanning the rule list.
    private final Map<String, PointRuleConfig> pointsByKey;

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
        this.pointsByKey = indexPoints(config, defaultOnViolation);
        this.rules =
                List.of(
                        new WhitelistRule(),
                        new ValueRangeRule(),
                        new RateLimitRule(defaultWriteLimit));
    }

    private static Map<String, PointRuleConfig> indexPoints(
            ProxyConfig config, String defaultOnViolation) {
        Map<String, PointRuleConfig> index = new HashMap<>();
        if (config.getRules() == null) {
            return index;
        }
        // Modbus register rules and IEC 61850 object rules live in separate typed lists but share
        // the same string-keyed index; their key spaces (numeric vs object reference) never
        // collide.
        List<PointRuleConfig> points = new java.util.ArrayList<>();
        if (config.getRules().getRegisters() != null) {
            points.addAll(config.getRules().getRegisters());
        }
        if (config.getRules().getObjects() != null) {
            points.addAll(config.getRules().getObjects());
        }
        for (PointRuleConfig point : points) {
            // Resolve the rules-level default into points that don't set their own action.
            if (point.getOnViolation() == null) {
                point.setOnViolation(defaultOnViolation);
            }
            // First entry wins on duplicate keys, matching the previous findFirst scan.
            index.putIfAbsent(point.key(), point);
        }
        return index;
    }

    public RuleResult evaluate(WriteRequest request) {
        PointRuleConfig registerConfig = findRegisterConfig(request.target());

        if (registerConfig == null) {
            // Target not explicitly configured — apply default action
            String defaultAction =
                    config.getRules() != null ? config.getRules().getDefaultAction() : "DENY";
            if ("DENY".equalsIgnoreCase(defaultAction)) {
                return RuleResult.deny(
                        ViolationAction.parse(defaultOnViolation),
                        request.target() + " is not in the whitelist");
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
     * Applies the read rate limit for a read of {@code target}: the point's own {@code read} limit,
     * else the rules default. Returns {@link RuleResult#allow()} when neither is configured.
     */
    public RuleResult evaluateRead(String target, Instant now) {
        PointRuleConfig registerConfig = findRegisterConfig(target);
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
        return readEvaluator.evaluate(limit, target, now, onViolation, "read " + target);
    }

    private PointRuleConfig findRegisterConfig(String target) {
        return pointsByKey.get(target);
    }
}
