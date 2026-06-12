package de.felixhertweck.otproxy.config;

/**
 * Protocol-agnostic safety rule for a single addressable point. Modbus points are keyed by a
 * numeric register {@code address} ({@link RegisterRuleConfig}); IEC 61850 points are keyed by an
 * object {@code reference} ({@link Iec61850PointRuleConfig}). The shared safety fields (write
 * whitelist, read allow-list, value range, rate limits, violation action) live here so the rule
 * engine can treat every protocol uniformly via {@link #key()}.
 */
public abstract class PointRuleConfig {

    private String description = "";
    private boolean allowWrite = false;
    private boolean allowRead = true;
    private ValueRangeConfig valueRange;
    private RateLimitConfig read;
    private RateLimitConfig write;
    private String onViolation;

    /**
     * Canonical key used to index this rule (register address or object reference, as a String).
     */
    public abstract String key();

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isAllowWrite() {
        return allowWrite;
    }

    public void setAllowWrite(boolean allowWrite) {
        this.allowWrite = allowWrite;
    }

    public boolean isAllowRead() {
        return allowRead;
    }

    public void setAllowRead(boolean allowRead) {
        this.allowRead = allowRead;
    }

    public ValueRangeConfig getValueRange() {
        return valueRange;
    }

    public void setValueRange(ValueRangeConfig valueRange) {
        this.valueRange = valueRange;
    }

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

    public String getOnViolation() {
        return onViolation;
    }

    public void setOnViolation(String onViolation) {
        this.onViolation = onViolation;
    }
}
