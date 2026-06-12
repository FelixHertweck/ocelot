package de.felixhertweck.otproxy.core.rules;

import de.felixhertweck.otproxy.config.PointRuleConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.ViolationAction;
import de.felixhertweck.otproxy.core.model.WriteRequest;

public class WhitelistRule implements Rule {

    @Override
    public RuleResult evaluate(WriteRequest request, PointRuleConfig config) {
        if (!config.isAllowWrite()) {
            return RuleResult.deny(
                    ViolationAction.parse(config.getOnViolation()),
                    "Write to " + request.target() + " is explicitly denied");
        }
        return RuleResult.allow();
    }
}
