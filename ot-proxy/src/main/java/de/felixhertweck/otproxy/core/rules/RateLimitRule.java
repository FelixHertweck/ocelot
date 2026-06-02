package de.felixhertweck.otproxy.core.rules;

import java.time.Instant;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.concurrent.ConcurrentHashMap;

import de.felixhertweck.otproxy.config.RateLimitConfig;
import de.felixhertweck.otproxy.config.RegisterRuleConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.WriteRequest;

public class RateLimitRule implements Rule {

    private final ConcurrentHashMap<Integer, Deque<Instant>> windows = new ConcurrentHashMap<>();

    @Override
    public RuleResult evaluate(WriteRequest request, RegisterRuleConfig config) {
        RateLimitConfig rlConfig = config.getRateLimit();
        if (rlConfig == null) return RuleResult.allow();

        int address = request.registerAddress();
        Instant now = request.timestamp();
        Instant cutoff = now.minusSeconds(rlConfig.getPerSeconds());

        Deque<Instant> window = windows.computeIfAbsent(address, k -> new ArrayDeque<>());

        synchronized (window) {
            while (!window.isEmpty() && window.peekFirst().isBefore(cutoff)) {
                window.pollFirst();
            }
            if (window.size() >= rlConfig.getMaxWrites()) {
                return RuleResult.deny(
                        WhitelistRule.parseAction(config.getOnViolation()),
                        "Rate limit exceeded for register "
                                + address
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
