package de.felixhertweck.otproxy.config;

/**
 * Groups a read and a write {@link RateLimitConfig}. Used both for the rules-level {@code
 * default_rate_limit} and (via the {@code read}/{@code write} keys) on individual registers.
 */
public class DirectionalRateLimitConfig {
    private RateLimitConfig read;
    private RateLimitConfig write;

    public RateLimitConfig getRead() {
        return read;
    }

    public void setRead(RateLimitConfig read) {
        this.read = read;
    }

    public RateLimitConfig getWrite() {
        return write;
    }

    public void setWrite(RateLimitConfig write) {
        this.write = write;
    }
}
