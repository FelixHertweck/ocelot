package de.felixhertweck.otproxy.config;

public class NodeRuleConfig {
    private String target;
    private String description = "";
    private boolean allowRead = true;
    private boolean allowWrite = false;
    private ValueRangeConfig valueRange;
    private RateLimitConfig rateLimit;
    private String onViolation = "MODBUS_EXCEPTION";

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isAllowRead() {
        return allowRead;
    }

    public void setAllowRead(boolean allowRead) {
        this.allowRead = allowRead;
    }

    public boolean isAllowWrite() {
        return allowWrite;
    }

    public void setAllowWrite(boolean allowWrite) {
        this.allowWrite = allowWrite;
    }

    public ValueRangeConfig getValueRange() {
        return valueRange;
    }

    public void setValueRange(ValueRangeConfig valueRange) {
        this.valueRange = valueRange;
    }

    public RateLimitConfig getRateLimit() {
        return rateLimit;
    }

    public void setRateLimit(RateLimitConfig rateLimit) {
        this.rateLimit = rateLimit;
    }

    public String getOnViolation() {
        return onViolation;
    }

    public void setOnViolation(String onViolation) {
        this.onViolation = onViolation;
    }
}
