package de.felixhertweck.otproxy.rules;

import java.time.Instant;

import static org.assertj.core.api.Assertions.assertThat;

import de.felixhertweck.otproxy.config.NodeRuleConfig;
import de.felixhertweck.otproxy.config.ValueRangeConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.WriteRequest;
import de.felixhertweck.otproxy.core.rules.ValueRangeRule;
import org.junit.jupiter.api.Test;

class ValueRangeRuleTest {

    private final ValueRangeRule rule = new ValueRangeRule();

    @Test
    void allowsValueWithinRange() {
        RuleResult result = rule.evaluate(request(100, 750), config(0, 1500));
        assertThat(result.allowed()).isTrue();
    }

    @Test
    void allowsBoundaryValues() {
        assertThat(rule.evaluate(request(100, 0), config(0, 1500)).allowed()).isTrue();
        assertThat(rule.evaluate(request(100, 1500), config(0, 1500)).allowed()).isTrue();
    }

    @Test
    void deniesValueBelowMin() {
        RuleResult result = rule.evaluate(request(100, -1), config(0, 1500));
        assertThat(result.allowed()).isFalse();
        assertThat(result.reason()).contains("-1");
    }

    @Test
    void deniesValueAboveMax() {
        RuleResult result = rule.evaluate(request(100, 1501), config(0, 1500));
        assertThat(result.allowed()).isFalse();
        assertThat(result.reason()).contains("1501");
    }

    @Test
    void allowsWhenNoRangeConfigured() {
        NodeRuleConfig c = new NodeRuleConfig();
        // no valueRange set
        RuleResult result = rule.evaluate(request(100, 99999), c);
        assertThat(result.allowed()).isTrue();
    }

    private WriteRequest request(int address, int value) {
        return new WriteRequest(
                "modbus", String.valueOf(address), value, "127.0.0.1", Instant.now());
    }

    private NodeRuleConfig config(int min, int max) {
        ValueRangeConfig range = new ValueRangeConfig();
        range.setMin(min);
        range.setMax(max);
        NodeRuleConfig c = new NodeRuleConfig();
        c.setValueRange(range);
        c.setOnViolation("MODBUS_EXCEPTION");
        return c;
    }
}
