package de.felixhertweck.otproxy.core.rules;

import java.time.Instant;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.concurrent.ConcurrentHashMap;

import de.felixhertweck.otproxy.config.NodeRuleConfig;
import de.felixhertweck.otproxy.config.RateLimitConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.WriteRequest;

public class RateLimitRule implements Rule {

    private final ConcurrentHashMap<String, Deque<Instant>> windows = new ConcurrentHashMap<>();

    @Override
    public RuleResult evaluate(WriteRequest request, NodeRuleConfig config) {
        RateLimitConfig rlConfig = config.getRateLimit();
        if (rlConfig == null) return RuleResult.allow();

        String target = request.target();
        Instant now = request.timestamp();
        Instant cutoff = now.minusSeconds(rlConfig.getPerSeconds());

        Deque<Instant> window = windows.computeIfAbsent(target, k -> new ArrayDeque<>());

        synchronized (window) {
            while (!window.isEmpty() && window.peekFirst().isBefore(cutoff)) {
                window.pollFirst();
            }
            if (window.size() >= rlConfig.getMaxWrites()) {
                return RuleResult.deny(
                        WhitelistRule.parseAction(config.getOnViolation()),
                        "Rate limit exceeded for target "
                                + target
                                + " (max "
                                + rlConfig.getMaxWrites()
                                + " writes per "
                                + rlConfig.getPerSeconds()
                                + "s)");
            }
            window.addLast(now);
        }
        return RuleResult.allow();
    }
}
