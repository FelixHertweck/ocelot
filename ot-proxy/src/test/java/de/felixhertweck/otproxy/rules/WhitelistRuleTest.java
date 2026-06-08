package de.felixhertweck.otproxy.rules;

import java.time.Instant;

import static org.assertj.core.api.Assertions.assertThat;

import de.felixhertweck.otproxy.config.NodeRuleConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.ViolationAction;
import de.felixhertweck.otproxy.core.model.WriteRequest;
import de.felixhertweck.otproxy.core.rules.WhitelistRule;
import org.junit.jupiter.api.Test;

class WhitelistRuleTest {

    private final WhitelistRule rule = new WhitelistRule();

    @Test
    void allowsWriteWhenExplicitlyEnabled() {
        NodeRuleConfig config = config(true, "MODBUS_EXCEPTION");
        RuleResult result = rule.evaluate(request(100, 42), config);
        assertThat(result.allowed()).isTrue();
    }

    @Test
    void deniesWriteWhenDisabled() {
        NodeRuleConfig config = config(false, "MODBUS_EXCEPTION");
        RuleResult result = rule.evaluate(request(200, 0), config);
        assertThat(result.allowed()).isFalse();
        assertThat(result.action()).isEqualTo(ViolationAction.MODBUS_EXCEPTION);
    }

    @Test
    void usesDisconnectActionFromConfig() {
        NodeRuleConfig config = config(false, "DISCONNECT");
        RuleResult result = rule.evaluate(request(200, 0), config);
        assertThat(result.action()).isEqualTo(ViolationAction.DISCONNECT);
    }

    @Test
    void usesSilentDropActionFromConfig() {
        NodeRuleConfig config = config(false, "SILENT_DROP");
        RuleResult result = rule.evaluate(request(200, 0), config);
        assertThat(result.action()).isEqualTo(ViolationAction.SILENT_DROP);
    }

    @Test
    void defaultsToModbusExceptionForUnknownAction() {
        NodeRuleConfig config = config(false, "UNKNOWN_ACTION");
        RuleResult result = rule.evaluate(request(200, 0), config);
        assertThat(result.action()).isEqualTo(ViolationAction.MODBUS_EXCEPTION);
    }

    private WriteRequest request(int address, int value) {
        return new WriteRequest(
                "modbus", String.valueOf(address), value, "127.0.0.1", Instant.now());
    }

    private NodeRuleConfig config(boolean allowWrite, String onViolation) {
        NodeRuleConfig c = new NodeRuleConfig();
        c.setAllowWrite(allowWrite);
        c.setOnViolation(onViolation);
        return c;
    }
}
