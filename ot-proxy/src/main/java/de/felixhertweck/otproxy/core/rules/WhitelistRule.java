package de.felixhertweck.otproxy.core.rules;

import de.felixhertweck.otproxy.config.RegisterRuleConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.ViolationAction;
import de.felixhertweck.otproxy.core.model.WriteRequest;

public class WhitelistRule implements Rule {

    @Override
    public RuleResult evaluate(WriteRequest request, RegisterRuleConfig config) {
        if (!config.isAllowWrite()) {
            return RuleResult.deny(
                    parseAction(config.getOnViolation()),
                    "Write to register " + request.registerAddress() + " is explicitly denied");
        }
        return RuleResult.allow();
    }

    static ViolationAction parseAction(String action) {
        if (action == null) return ViolationAction.MODBUS_EXCEPTION;
        return switch (action.toUpperCase()) {
            case "SILENT_DROP" -> ViolationAction.SILENT_DROP;
            case "DISCONNECT" -> ViolationAction.DISCONNECT;
            default -> ViolationAction.MODBUS_EXCEPTION;
        };
    }
}
