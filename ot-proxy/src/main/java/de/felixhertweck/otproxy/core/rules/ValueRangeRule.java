package de.felixhertweck.otproxy.core.rules;

import de.felixhertweck.otproxy.config.PointRuleConfig;
import de.felixhertweck.otproxy.config.ValueRangeConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.ViolationAction;
import de.felixhertweck.otproxy.core.model.WriteRequest;

public class ValueRangeRule implements Rule {

    @Override
    public RuleResult evaluate(WriteRequest request, PointRuleConfig config) {
        ValueRangeConfig range = config.getValueRange();
        if (range == null) return RuleResult.allow();

        int value = request.value();
        if (value < range.getMin() || value > range.getMax()) {
            return RuleResult.deny(
                    ViolationAction.parse(config.getOnViolation()),
                    "Value "
                            + value
                            + " out of allowed range ["
                            + range.getMin()
                            + ", "
                            + range.getMax()
                            + "]"
                            + " for "
                            + request.target());
        }
        return RuleResult.allow();
    }
}
