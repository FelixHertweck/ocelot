package de.felixhertweck.otproxy.core.rules;

import java.util.List;

import de.felixhertweck.otproxy.config.NodeRuleConfig;
import de.felixhertweck.otproxy.config.ProxyConfig;
import de.felixhertweck.otproxy.core.model.ReadRequest;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.ViolationAction;
import de.felixhertweck.otproxy.core.model.WriteRequest;

public class RuleEngine {

    private final ProxyConfig config;
    private final List<Rule> writeRules;
    private final ReadWhitelistRule readWhitelistRule;

    public RuleEngine(ProxyConfig config) {
        this.config = config;
        this.writeRules = List.of(new WhitelistRule(), new ValueRangeRule(), new RateLimitRule());
        this.readWhitelistRule = new ReadWhitelistRule();
    }

    public RuleResult evaluateRead(ReadRequest request) {
        NodeRuleConfig nodeConfig = findNodeConfig(request.target());

        if (nodeConfig == null) {
            String defaultReadAction =
                    config.getRules() != null ? config.getRules().getDefaultReadAction() : "ALLOW";
            if ("DENY".equalsIgnoreCase(defaultReadAction)) {
                return RuleResult.deny(
                        defaultViolationAction(),
                        "Target " + request.target() + " is not in the whitelist for reading");
            }
            return RuleResult.allow();
        }

        return readWhitelistRule.evaluate(request, nodeConfig);
    }

    public RuleResult evaluate(WriteRequest request) {
        NodeRuleConfig nodeConfig = findNodeConfig(request.target());

        if (nodeConfig == null) {
            // Node not explicitly configured — apply default action
            String defaultAction =
                    config.getRules() != null ? config.getRules().getDefaultAction() : "DENY";
            if ("DENY".equalsIgnoreCase(defaultAction)) {
                return RuleResult.deny(
                        defaultViolationAction(),
                        "Target " + request.target() + " is not in the whitelist");
            }
            return RuleResult.allow();
        }

        for (Rule rule : writeRules) {
            RuleResult result = rule.evaluate(request, nodeConfig);
            if (!result.allowed()) {
                return result;
            }
        }
        return RuleResult.allow();
    }

    private NodeRuleConfig findNodeConfig(String target) {
        if (config.getRules() == null || config.getRules().getNodes() == null) return null;
        return config.getRules().getNodes().stream()
                .filter(r -> target.equals(r.getTarget()))
                .findFirst()
                .orElse(null);
    }

    private ViolationAction defaultViolationAction() {
        String action =
                config.getRules() != null
                        ? config.getRules().getDefaultViolationAction()
                        : "MODBUS_EXCEPTION";
        return WhitelistRule.parseAction(action);
    }
}
