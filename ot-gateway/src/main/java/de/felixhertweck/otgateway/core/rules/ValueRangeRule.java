package de.felixhertweck.otgateway.core.rules;

import de.felixhertweck.otgateway.config.RegisterRuleConfig;
import de.felixhertweck.otgateway.config.ValueRangeConfig;
import de.felixhertweck.otgateway.core.model.RuleResult;
import de.felixhertweck.otgateway.core.model.WriteRequest;

public class ValueRangeRule implements Rule {

    @Override
    public RuleResult evaluate(WriteRequest request, RegisterRuleConfig config) {
        ValueRangeConfig range = config.getValueRange();
        if (range == null) return RuleResult.allow();

        int value = request.value();
        if (value < range.getMin() || value > range.getMax()) {
            return RuleResult.deny(
                    WhitelistRule.parseAction(config.getOnViolation()),
                    "Value "
                            + value
                            + " out of allowed range ["
                            + range.getMin()
                            + ", "
                            + range.getMax()
                            + "]"
                            + " for register "
                            + request.registerAddress());
        }
        return RuleResult.allow();
    }
}
