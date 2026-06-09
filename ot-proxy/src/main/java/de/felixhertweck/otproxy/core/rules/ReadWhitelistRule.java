package de.felixhertweck.otproxy.core.rules;

import de.felixhertweck.otproxy.config.NodeRuleConfig;
import de.felixhertweck.otproxy.core.model.ReadRequest;
import de.felixhertweck.otproxy.core.model.RuleResult;

public class ReadWhitelistRule {

    public RuleResult evaluate(ReadRequest request, NodeRuleConfig config) {
        if (!config.isAllowRead()) {
            return RuleResult.deny(
                    WhitelistRule.parseAction(config.getOnViolation()),
                    "Read from target " + request.target() + " is explicitly denied");
        }
        return RuleResult.allow();
    }
}
