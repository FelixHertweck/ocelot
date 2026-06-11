package de.felixhertweck.otproxy.core.rules;

import de.felixhertweck.otproxy.config.RateLimitConfig;
import de.felixhertweck.otproxy.config.RegisterRuleConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.WriteRequest;

public class RateLimitRule implements Rule {

    private final SlidingWindowRateLimiter limiter = new SlidingWindowRateLimiter();

    /** Fallback limit for registers without their own {@code rate_limit}; may be {@code null}. */
    private final RateLimitConfig defaultRateLimit;

    public RateLimitRule() {
        this(null);
    }

    public RateLimitRule(RateLimitConfig defaultRateLimit) {
        this.defaultRateLimit = defaultRateLimit;
    }

    @Override
    public RuleResult evaluate(WriteRequest request, RegisterRuleConfig config) {
        RateLimitConfig rlConfig =
                config.getRateLimit() != null ? config.getRateLimit() : defaultRateLimit;
        if (rlConfig == null) return RuleResult.allow();

        int address = request.registerAddress();
        boolean allowed =
                limiter.tryAcquire(
                        address,
                        rlConfig.getMaxWrites(),
                        rlConfig.getPerMillis(),
                        request.timestamp());

        if (!allowed) {
            return RuleResult.deny(
                    WhitelistRule.parseAction(config.getOnViolation()),
                    "Rate limit exceeded for register "
                            + address
                            + " (max "
                            + rlConfig.getMaxWrites()
                            + " writes per "
                            + rlConfig.getPerMillis()
                            + "ms)");
        }
        return RuleResult.allow();
    }
}
