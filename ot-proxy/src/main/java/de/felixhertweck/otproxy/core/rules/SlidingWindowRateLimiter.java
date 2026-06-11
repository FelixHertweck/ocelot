package de.felixhertweck.otproxy.core.rules;

import java.time.Duration;
import java.time.Instant;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Thread-safe sliding-window rate limiter, keyed so the same instance can track several independent
 * windows (e.g. one per register address, or a single global key). Shared by the write rule and the
 * read path so both use identical windowing semantics.
 */
public class SlidingWindowRateLimiter {

    private final ConcurrentHashMap<Long, Deque<Instant>> windows = new ConcurrentHashMap<>();

    /**
     * Records a request against {@code key} and reports whether it stays within the limit.
     *
     * @return {@code true} if the request is allowed (and has been recorded), {@code false} if it
     *     would exceed {@code maxRequests} within the trailing {@code windowMillis} window.
     */
    public boolean tryAcquire(long key, int maxRequests, long windowMillis, Instant now) {
        Instant cutoff = now.minus(Duration.ofMillis(windowMillis));
        Deque<Instant> window = windows.computeIfAbsent(key, k -> new ArrayDeque<>());

        synchronized (window) {
            while (!window.isEmpty() && window.peekFirst().isBefore(cutoff)) {
                window.pollFirst();
            }
            if (window.size() >= maxRequests) {
                return false;
            }
            window.addLast(now);
            return true;
        }
    }
}
