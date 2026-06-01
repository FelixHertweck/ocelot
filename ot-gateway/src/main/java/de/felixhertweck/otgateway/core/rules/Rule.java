package de.felixhertweck.otgateway.core.rules;

import de.felixhertweck.otgateway.config.RegisterRuleConfig;
import de.felixhertweck.otgateway.core.model.RuleResult;
import de.felixhertweck.otgateway.core.model.WriteRequest;

public interface Rule {
    RuleResult evaluate(WriteRequest request, RegisterRuleConfig config);
}
