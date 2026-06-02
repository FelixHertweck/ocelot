package de.felixhertweck.otproxy.rules;

import java.time.Instant;

import static org.assertj.core.api.Assertions.assertThat;

import de.felixhertweck.otproxy.config.RegisterRuleConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.ViolationAction;
import de.felixhertweck.otproxy.core.model.WriteRequest;
import de.felixhertweck.otproxy.core.rules.WhitelistRule;
import org.junit.jupiter.api.Test;

class WhitelistRuleTest {

    private final WhitelistRule rule = new WhitelistRule();

    @Test
    void allowsWriteWhenExplicitlyEnabled() {
        RegisterRuleConfig config = config(true, "MODBUS_EXCEPTION");
        RuleResult result = rule.evaluate(request(100, 42), config);
        assertThat(result.allowed()).isTrue();
    }

    @Test
    void deniesWriteWhenDisabled() {
        RegisterRuleConfig config = config(false, "MODBUS_EXCEPTION");
        RuleResult result = rule.evaluate(request(200, 0), config);
        assertThat(result.allowed()).isFalse();
        assertThat(result.action()).isEqualTo(ViolationAction.MODBUS_EXCEPTION);
    }

    @Test
    void usesDisconnectActionFromConfig() {
        RegisterRuleConfig config = config(false, "DISCONNECT");
        RuleResult result = rule.evaluate(request(200, 0), config);
        assertThat(result.action()).isEqualTo(ViolationAction.DISCONNECT);
    }

    @Test
    void usesSilentDropActionFromConfig() {
        RegisterRuleConfig config = config(false, "SILENT_DROP");
        RuleResult result = rule.evaluate(request(200, 0), config);
        assertThat(result.action()).isEqualTo(ViolationAction.SILENT_DROP);
    }

    @Test
    void defaultsToModbusExceptionForUnknownAction() {
        RegisterRuleConfig config = config(false, "UNKNOWN_ACTION");
        RuleResult result = rule.evaluate(request(200, 0), config);
        assertThat(result.action()).isEqualTo(ViolationAction.MODBUS_EXCEPTION);
    }

    private WriteRequest request(int address, int value) {
        return new WriteRequest("modbus", address, value, "127.0.0.1", Instant.now());
    }

    private RegisterRuleConfig config(boolean allowWrite, String onViolation) {
        RegisterRuleConfig c = new RegisterRuleConfig();
        c.setAllowWrite(allowWrite);
        c.setOnViolation(onViolation);
        return c;
    }
}
