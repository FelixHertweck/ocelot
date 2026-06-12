package de.felixhertweck.otproxy.rules;

import java.time.Instant;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

import de.felixhertweck.otproxy.config.Iec61850PointRuleConfig;
import de.felixhertweck.otproxy.config.ProxyConfig;
import de.felixhertweck.otproxy.config.RulesConfig;
import de.felixhertweck.otproxy.config.ValueRangeConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.WriteRequest;
import de.felixhertweck.otproxy.core.rules.RuleEngine;
import org.junit.jupiter.api.Test;

/** The shared rule engine keyed on IEC 61850 object references instead of Modbus addresses. */
class Iec61850RuleEngineTest {

    private static final String XCBR = "RelayIEDPROT/XCBR1.Pos";

    @Test
    void allowsConfiguredControlObject() {
        RuleEngine engine = engine(object(XCBR, true, null));
        assertThat(engine.evaluate(control(XCBR, 0)).allowed()).isTrue();
    }

    @Test
    void deniesControlObjectThatDisallowsWrite() {
        RuleEngine engine = engine(object(XCBR, false, null));
        RuleResult result = engine.evaluate(control(XCBR, 0));
        assertThat(result.allowed()).isFalse();
        assertThat(result.reason()).contains(XCBR);
    }

    @Test
    void deniesUnlistedObjectUnderDefaultDeny() {
        RuleEngine engine = engine(object(XCBR, true, null));
        RuleResult result = engine.evaluate(control("RelayIEDPROT/XCBR9.Pos", 1));
        assertThat(result.allowed()).isFalse();
        assertThat(result.reason()).contains("not in the whitelist");
    }

    @Test
    void enforcesValueRangeOnControlValue() {
        // Reject "close" (ctlVal=1 -> value 1) by restricting the allowed range to {0}.
        RuleEngine engine = engine(object(XCBR, true, range(0, 0)));
        assertThat(engine.evaluate(control(XCBR, 0)).allowed()).isTrue();
        assertThat(engine.evaluate(control(XCBR, 1)).allowed()).isFalse();
    }

    private WriteRequest control(String reference, int value) {
        return new WriteRequest("iec61850", reference, value, "mms", Instant.now());
    }

    private Iec61850PointRuleConfig object(
            String reference, boolean allowWrite, ValueRangeConfig r) {
        Iec61850PointRuleConfig c = new Iec61850PointRuleConfig();
        c.setReference(reference);
        c.setAllowWrite(allowWrite);
        c.setValueRange(r);
        return c;
    }

    private ValueRangeConfig range(int min, int max) {
        ValueRangeConfig r = new ValueRangeConfig();
        r.setMin(min);
        r.setMax(max);
        return r;
    }

    private RuleEngine engine(Iec61850PointRuleConfig... objects) {
        RulesConfig rules = new RulesConfig();
        rules.setDefaultAction("DENY");
        rules.setObjects(List.of(objects));

        ProxyConfig config = new ProxyConfig();
        config.setProtocol("iec61850");
        config.setRules(rules);
        return new RuleEngine(config);
    }
}
