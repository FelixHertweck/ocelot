package de.felixhertweck.otproxy.core.rules;

import de.felixhertweck.otproxy.config.NodeRuleConfig;
import de.felixhertweck.otproxy.config.ValueRangeConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.WriteRequest;

public class ValueRangeRule implements Rule {

    @Override
    public RuleResult evaluate(WriteRequest request, NodeRuleConfig config) {
        ValueRangeConfig range = config.getValueRange();
        if (range == null) return RuleResult.allow();

        if (!(request.value() instanceof Number)) {
            return RuleResult.allow();
        }

        double value = ((Number) request.value()).doubleValue();
        if (value < range.getMin() || value > range.getMax()) {
            return RuleResult.deny(
                    WhitelistRule.parseAction(config.getOnViolation()),
                    "Value "
                            + request.value().toString()
                            + " out of allowed range ["
                            + range.getMin()
                            + ", "
                            + range.getMax()
                            + "]"
                            + " for target "
                            + request.target());
        }
        return RuleResult.allow();
    }
}
