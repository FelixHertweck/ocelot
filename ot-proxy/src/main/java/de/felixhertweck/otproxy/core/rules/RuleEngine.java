package de.felixhertweck.otproxy.core.rules;

import java.time.Instant;
import java.util.List;

import de.felixhertweck.otproxy.config.ProxyConfig;
import de.felixhertweck.otproxy.config.RateLimitConfig;
import de.felixhertweck.otproxy.config.ReadRateLimitConfig;
import de.felixhertweck.otproxy.config.RegisterRuleConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.ViolationAction;
import de.felixhertweck.otproxy.core.model.WriteRequest;

public class RuleEngine {

    // Reads share a single global window, so any constant key works here.
    private static final long READ_WINDOW_KEY = 0L;

    private final ProxyConfig config;
    private final List<Rule> rules;
    private final ReadRateLimitConfig readRateLimit;
    private final SlidingWindowRateLimiter readLimiter = new SlidingWindowRateLimiter();

    public RuleEngine(ProxyConfig config) {
        this.config = config;
        RateLimitConfig defaultRateLimit =
                config.getRules() != null ? config.getRules().getDefaultRateLimit() : null;
        this.readRateLimit =
                config.getRules() != null ? config.getRules().getReadRateLimit() : null;
        this.rules =
                List.of(
                        new WhitelistRule(),
                        new ValueRangeRule(),
                        new RateLimitRule(defaultRateLimit));
    }

    public RuleResult evaluate(WriteRequest request) {
        RegisterRuleConfig registerConfig = findRegisterConfig(request.registerAddress());

        if (registerConfig == null) {
            // Register not explicitly configured — apply default action
            String defaultAction =
                    config.getRules() != null ? config.getRules().getDefaultAction() : "DENY";
            if ("DENY".equalsIgnoreCase(defaultAction)) {
                return RuleResult.deny(
                        ViolationAction.MODBUS_EXCEPTION,
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
     * Applies the global read rate limit to a read (non-write) request. Returns {@link
     * RuleResult#allow()} when no read limit is configured.
     */
    public RuleResult evaluateRead(Instant now) {
        if (readRateLimit == null) return RuleResult.allow();

        boolean allowed =
                readLimiter.tryAcquire(
                        READ_WINDOW_KEY,
                        readRateLimit.getMaxRequests(),
                        readRateLimit.getPerMillis(),
                        now);

        if (!allowed) {
            return RuleResult.deny(
                    WhitelistRule.parseAction(readRateLimit.getOnViolation()),
                    "Read rate limit exceeded (max "
                            + readRateLimit.getMaxRequests()
                            + " reads per "
                            + readRateLimit.getPerMillis()
                            + "ms)");
        }
        return RuleResult.allow();
    }

    private RegisterRuleConfig findRegisterConfig(int address) {
        if (config.getRules() == null || config.getRules().getRegisters() == null) return null;
        return config.getRules().getRegisters().stream()
                .filter(r -> r.getAddress() == address)
                .findFirst()
                .orElse(null);
    }
}
