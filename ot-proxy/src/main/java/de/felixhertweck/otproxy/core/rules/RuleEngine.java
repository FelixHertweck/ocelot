package de.felixhertweck.otproxy.core.rules;

import java.util.List;

import de.felixhertweck.otproxy.config.ProxyConfig;
import de.felixhertweck.otproxy.config.RegisterRuleConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.ViolationAction;
import de.felixhertweck.otproxy.core.model.WriteRequest;

public class RuleEngine {

    private final ProxyConfig config;
    private final List<Rule> rules;

    public RuleEngine(ProxyConfig config) {
        this.config = config;
        this.rules = List.of(new WhitelistRule(), new ValueRangeRule(), new RateLimitRule());
    }

    public RuleResult evaluate(WriteRequest request) {
        RegisterRuleConfig registerConfig = findRegisterConfig(request.registerAddress());

        if (registerConfig == null) {
            // Register not explicitly configured — apply default action
            String defaultAction =
                    config.getRules() != null ? config.getRules().getDefaultAction() : "DENY";
            if ("DENY".equalsIgnoreCase(defaultAction)) {
                return RuleResult.deny(
                        ViolationAction.MODBUS_EXCEPTION,
                        "Register " + request.registerAddress() + " is not in the whitelist");
            }
            return RuleResult.allow();
        }

        for (Rule rule : rules) {
            RuleResult result = rule.evaluate(request, registerConfig);
            if (!result.allowed()) {
                return result;
            }
        }
        return RuleResult.allow();
    }

    private RegisterRuleConfig findRegisterConfig(int address) {
        if (config.getRules() == null || config.getRules().getRegisters() == null) return null;
        return config.getRules().getRegisters().stream()
                .filter(r -> r.getAddress() == address)
                .findFirst()
                .orElse(null);
    }
}
