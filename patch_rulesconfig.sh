cat << 'INNER_EOF' > ot-proxy/src/main/java/de/felixhertweck/otproxy/config/RulesConfig.java
package de.felixhertweck.otproxy.config;

import java.util.ArrayList;
import java.util.List;

public class RulesConfig {
    private String defaultAction = "DENY";
    private RateLimitConfig defaultRateLimit;
    private ReadRateLimitConfig readRateLimit;
    private List<NodeRuleConfig> nodes = new ArrayList<>();

    public String getDefaultAction() {
        return defaultAction;
    }

    public void setDefaultAction(String defaultAction) {
        this.defaultAction = defaultAction;
    }

    /**
     * Rate limit applied to every writable register that does not define its own {@code
     * rate_limit}. A register-level {@code rate_limit} always takes precedence. {@code null} means
     * no global default — registers without their own limit are then unthrottled.
     */
    public RateLimitConfig getDefaultRateLimit() {
        return defaultRateLimit;
    }

    public void setDefaultRateLimit(RateLimitConfig defaultRateLimit) {
        this.defaultRateLimit = defaultRateLimit;
    }

    /**
     * Global rate limit for all read (non-write) requests. {@code null} means reads are not
     * throttled.
     */
    public ReadRateLimitConfig getReadRateLimit() {
        return readRateLimit;
    }

    public void setReadRateLimit(ReadRateLimitConfig readRateLimit) {
        this.readRateLimit = readRateLimit;
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
INNER_EOF
