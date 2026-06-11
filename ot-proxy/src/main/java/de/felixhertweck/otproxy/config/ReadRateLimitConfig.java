package de.felixhertweck.otproxy.config;

public class ReadRateLimitConfig {
    private int maxReads = 100;
    private int perSeconds = 1;

    public int getMaxReads() {
        return maxReads;
    }

    public void setMaxReads(int maxReads) {
        this.maxReads = maxReads;
    }

    public int getPerSeconds() {
        return perSeconds;
    }

    public void setPerSeconds(int perSeconds) {
        this.perSeconds = perSeconds;
    }
}
