package de.felixhertweck.otproxy.config;

import java.util.ArrayList;
import java.util.List;

public class RulesConfig {
    private String defaultAction = "DENY";
    private DirectionalRateLimitConfig defaultRateLimit;
    private List<RegisterRuleConfig> registers = new ArrayList<>();

    public String getDefaultAction() {
        return defaultAction;
    }

    public void setDefaultAction(String defaultAction) {
        this.defaultAction = defaultAction;
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
}
