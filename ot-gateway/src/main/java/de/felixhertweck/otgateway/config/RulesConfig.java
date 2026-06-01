package de.felixhertweck.otgateway.config;

import java.util.ArrayList;
import java.util.List;

public class RulesConfig {
    private String defaultAction = "DENY";
    private List<RegisterRuleConfig> registers = new ArrayList<>();

    public String getDefaultAction() {
        return defaultAction;
    }

    public void setDefaultAction(String defaultAction) {
        this.defaultAction = defaultAction;
    }

    public List<RegisterRuleConfig> getRegisters() {
        return registers;
    }

    public void setRegisters(List<RegisterRuleConfig> registers) {
        this.registers = registers;
    }
}
