package de.felixhertweck.otproxy.config;

/**
 * Global rate limit applied to every read (non-write) request. Unlike the write {@link
 * RateLimitConfig}, this is not tied to a single register — all reads share one window.
 */
public class ReadRateLimitConfig {
    private int maxRequests = 0;
    private int perMillis = 60_000;
    private String onViolation = "MODBUS_EXCEPTION";

    public int getMaxRequests() {
        return maxRequests;
    }

    public void setMaxRequests(int maxRequests) {
        this.maxRequests = maxRequests;
    }

    public int getPerMillis() {
        return perMillis;
    }

    public void setPerMillis(int perMillis) {
        this.perMillis = perMillis;
    }

    public String getOnViolation() {
        return onViolation;
    }

    public void setOnViolation(String onViolation) {
        this.onViolation = onViolation;
    }
}
