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
     * @param key window key (protocol-neutral target string) so each target is tracked
     *     independently
     * @param now request timestamp
     * @param onViolation fully pre-resolved action string — callers are responsible for applying
     *     the correct precedence (point-level overrides global defaults)
     * @param subject human-readable subject for the violation message, e.g. {@code "write target
     *     RelayIEDPROT/XCBR1.Pos"}
     */
    public RuleResult evaluate(
            RateLimitConfig limit, String key, Instant now, String onViolation, String subject) {
        if (limit == null) return RuleResult.allow();

        // A block with a missing/non-positive max_requests or per_millis is treated as "no limit"
        // rather than silently blocking everything (max_requests defaults to 0 on partial configs).
        if (limit.getMaxRequests() <= 0 || limit.getPerMillis() <= 0) {
            return RuleResult.allow();
        }

        if (limiter.tryAcquire(key, limit.getMaxRequests(), limit.getPerMillis(), now)) {
            return RuleResult.allow();
        }

        return RuleResult.deny(
                ViolationAction.parse(onViolation),
                "Rate limit exceeded for "
                        + subject
                        + " (max "
                        + limit.getMaxRequests()
                        + " per "
                        + limit.getPerMillis()
                        + "ms)");
    }
}
