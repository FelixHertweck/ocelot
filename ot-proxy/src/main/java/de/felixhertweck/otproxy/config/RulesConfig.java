package de.felixhertweck.otproxy.config;

import java.util.ArrayList;
import java.util.List;

public class RulesConfig {
    private String defaultAction = "DENY";
    private String defaultOnViolation;
    private DirectionalRateLimitConfig defaultRateLimit;
    private List<RegisterRuleConfig> registers = new ArrayList<>();
    private List<Iec61850PointRuleConfig> objects = new ArrayList<>();

    public String getDefaultAction() {
        return defaultAction;
    }

    public void setDefaultAction(String defaultAction) {
        this.defaultAction = defaultAction;
    }

    /**
     * Fallback {@code on_violation} for registers (and rate limits) that do not specify their own.
     * {@code null} falls back to {@code MODBUS_EXCEPTION}.
     */
    public String getDefaultOnViolation() {
        return defaultOnViolation;
    }

    public void setDefaultOnViolation(String defaultOnViolation) {
        this.defaultOnViolation = defaultOnViolation;
    }

    /**
     * Read/write rate limits applied to a register that does not define its own. A register-level
     * {@code read}/{@code write} always takes precedence. {@code null} (or a null direction) means
     * that direction is unthrottled unless the register specifies it.
     */
    public DirectionalRateLimitConfig getDefaultRateLimit() {
        return defaultRateLimit;
    }

    public void setDefaultRateLimit(DirectionalRateLimitConfig defaultRateLimit) {
        this.defaultRateLimit = defaultRateLimit;
    }

    public List<RegisterRuleConfig> getRegisters() {
        return registers;
    }

    public void setRegisters(List<RegisterRuleConfig> registers) {
        this.registers = registers;
    }

    /** IEC 61850 object rules, keyed by object reference. */
    public List<Iec61850PointRuleConfig> getObjects() {
        return objects;
    }

    public void setObjects(List<Iec61850PointRuleConfig> objects) {
        this.objects = objects;
    }
}
