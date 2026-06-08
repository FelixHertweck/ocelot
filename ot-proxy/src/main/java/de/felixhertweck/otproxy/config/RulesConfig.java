package de.felixhertweck.otproxy.config;

import java.util.ArrayList;
import java.util.List;

public class RulesConfig {
    private String defaultAction = "DENY";
    private List<NodeRuleConfig> nodes = new ArrayList<>();

    public String getDefaultAction() {
        return defaultAction;
    }

    public void setDefaultAction(String defaultAction) {
        this.defaultAction = defaultAction;
    }

    public List<NodeRuleConfig> getNodes() {
        return nodes;
    }

    public void setNodes(List<NodeRuleConfig> nodes) {
        this.nodes = nodes;
    }

    // For backwards compatibility with old Modbus configs
    public void setRegisters(List<NodeRuleConfig> registers) {
        this.nodes = registers;
    }
}
