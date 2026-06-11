package de.felixhertweck.otproxy.core.rules;

import java.time.Instant;

import de.felixhertweck.otproxy.config.RateLimitConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.ViolationAction;

/**
 * Applies a single {@link RateLimitConfig} against a sliding window. One instance owns one set of
 * windows, so reads and writes each get their own evaluator (independent windows) while sharing
 * this exact logic.
 */
public class RateLimitEvaluator {

    private final SlidingWindowRateLimiter limiter = new SlidingWindowRateLimiter();

    /**
     * @param limit the limit to enforce, or {@code null} for "no limit"
     * @param key window key (e.g. the register address) so each register is tracked independently
     * @param now request timestamp
     * @param fallbackOnViolation action to use when {@code limit} sets no {@code on_violation}
     *     (e.g. the register's own action)
     * @param subject human-readable subject for the violation message, e.g. {@code "write register
     *     40018"}
     */
    public RuleResult evaluate(
            RateLimitConfig limit,
            long key,
            Instant now,
            String fallbackOnViolation,
            String subject) {
        if (limit == null) return RuleResult.allow();

        // A block with a missing/non-positive max_requests or per_millis is treated as "no limit"
        // rather than silently blocking everything (max_requests defaults to 0 on partial configs).
        if (limit.getMaxRequests() <= 0 || limit.getPerMillis() <= 0) {
            return RuleResult.allow();
        }

        if (limiter.tryAcquire(key, limit.getMaxRequests(), limit.getPerMillis(), now)) {
            return RuleResult.allow();
        }

        String action =
                limit.getOnViolation() != null ? limit.getOnViolation() : fallbackOnViolation;
        return RuleResult.deny(
                ViolationAction.parse(action),
                "Rate limit exceeded for "
                        + subject
                        + " (max "
                        + limit.getMaxRequests()
                        + " per "
                        + limit.getPerMillis()
                        + "ms)");
    }
}
