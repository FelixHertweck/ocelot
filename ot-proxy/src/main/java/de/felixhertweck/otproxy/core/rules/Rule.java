package de.felixhertweck.otproxy.core.rules;

import de.felixhertweck.otproxy.config.PointRuleConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.WriteRequest;

public interface Rule {
    RuleResult evaluate(WriteRequest request, PointRuleConfig config);
}
