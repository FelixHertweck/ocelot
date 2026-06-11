package de.felixhertweck.otproxy.config;

public class RateLimitConfig {
    private int maxWrites = 0;
    private int perMillis = 60_000;

    public int getMaxWrites() {
        return maxWrites;
    }

    public void setMaxWrites(int maxWrites) {
        this.maxWrites = maxWrites;
    }

    public int getPerMillis() {
        return perMillis;
    }

    public void setPerMillis(int perMillis) {
        this.perMillis = perMillis;
    }
}
