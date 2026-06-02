package de.felixhertweck.otproxy.config;

public class RateLimitConfig {
    private int maxWrites = 0;
    private int perSeconds = 60;

    public int getMaxWrites() {
        return maxWrites;
    }

    public void setMaxWrites(int maxWrites) {
        this.maxWrites = maxWrites;
    }

    public int getPerSeconds() {
        return perSeconds;
    }

    public void setPerSeconds(int perSeconds) {
        this.perSeconds = perSeconds;
    }
}
