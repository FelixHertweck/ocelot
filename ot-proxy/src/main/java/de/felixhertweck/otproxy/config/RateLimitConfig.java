package de.felixhertweck.otproxy.config;

/**
 * Sliding-window rate limit. Used for the per-register write limit, the rules-level write/read
 * defaults — same shape everywhere.
 */
public class RateLimitConfig {
    private int maxRequests = 0;
    private int perMillis = 60_000;

    /**
     * Action when the limit is exceeded. {@code null} means "inherit the surrounding default" — the
     * register's {@code on_violation} for write limits, {@code MODBUS_EXCEPTION} for the read
     * limit.
     */
    private String onViolation;

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
