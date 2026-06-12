package de.felixhertweck.otproxy.core.rules;

import de.felixhertweck.otproxy.config.PointRuleConfig;
import de.felixhertweck.otproxy.config.RateLimitConfig;
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
    public RuleResult evaluate(WriteRequest request, PointRuleConfig config) {
        boolean hasOwnLimit = config.getWrite() != null;
        RateLimitConfig limit = hasOwnLimit ? config.getWrite() : defaultWriteLimit;
        String onViolation;
        if (hasOwnLimit) {
            // register's own write limit: write.on_violation → register.on_violation
            onViolation =
                    config.getWrite().getOnViolation() != null
                            ? config.getWrite().getOnViolation()
                            : config.getOnViolation();
        } else {
            // global default: register.on_violation overrides the global limit's on_violation
            onViolation =
                    config.getOnViolation() != null
                            ? config.getOnViolation()
                            : (defaultWriteLimit != null
                                    ? defaultWriteLimit.getOnViolation()
                                    : null);
        }
        return evaluator.evaluate(
                limit,
                request.target(),
                request.timestamp(),
                onViolation,
                "write " + request.target());
    }
}
