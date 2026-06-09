package de.felixhertweck.otproxy.rules;

import java.time.Instant;

import static org.assertj.core.api.Assertions.assertThat;

import de.felixhertweck.otproxy.config.NodeRuleConfig;
import de.felixhertweck.otproxy.core.model.ReadRequest;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.ViolationAction;
import de.felixhertweck.otproxy.core.rules.ReadWhitelistRule;
import org.junit.jupiter.api.Test;

class ReadWhitelistRuleTest {

    private final ReadWhitelistRule rule = new ReadWhitelistRule();

    @Test
    void allowsReadWhenConfigured() {
        NodeRuleConfig config = config(true, "MODBUS_EXCEPTION");
        RuleResult result = rule.evaluate(request("100", 1), config);
        assertThat(result.allowed()).isTrue();
    }

    @Test
    void deniesReadWhenNotAllowed() {
        NodeRuleConfig config = config(false, "MODBUS_EXCEPTION");
        RuleResult result = rule.evaluate(request("100", 1), config);

        assertThat(result.allowed()).isFalse();
        assertThat(result.action()).isEqualTo(ViolationAction.MODBUS_EXCEPTION);
        assertThat(result.reason()).contains("100");
    }

    private ReadRequest request(String address, int count) {
        return new ReadRequest("modbus", address, count, "127.0.0.1", Instant.now());
    }

    private NodeRuleConfig config(boolean allowRead, String onViolation) {
        NodeRuleConfig c = new NodeRuleConfig();
        c.setTarget("999");
        c.setAllowRead(allowRead);
        c.setOnViolation(onViolation);
        return c;
    }
}
