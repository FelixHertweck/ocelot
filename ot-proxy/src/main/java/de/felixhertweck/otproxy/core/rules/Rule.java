package de.felixhertweck.otproxy.core.rules;

import de.felixhertweck.otproxy.config.RegisterRuleConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.WriteRequest;

public interface Rule {
    RuleResult evaluate(WriteRequest request, RegisterRuleConfig config);
}
