package de.felixhertweck.otproxy.core.rules;

import de.felixhertweck.otproxy.config.RateLimitConfig;
import de.felixhertweck.otproxy.config.RegisterRuleConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.WriteRequest;

/**
 * Enforces the write rate limit: the register's own {@code write} limit, else the rules default.
 */
public class RateLimitRule implements Rule {

    private final RateLimitEvaluator evaluator = new RateLimitEvaluator();

    /** Rules-level fallback for registers without their own {@code write} limit; may be null. */
    private final RateLimitConfig defaultWriteLimit;

    public RateLimitRule() {
        this(null);
    }

    public RateLimitRule(RateLimitConfig defaultWriteLimit) {
        this.defaultWriteLimit = defaultWriteLimit;
    }

    @Override
    public RuleResult evaluate(WriteRequest request, RegisterRuleConfig config) {
        RateLimitConfig limit = config.getWrite() != null ? config.getWrite() : defaultWriteLimit;
        return evaluator.evaluate(
                limit,
                request.registerAddress(),
                request.timestamp(),
                config.getOnViolation(),
                "write register " + request.registerAddress());
    }
}
