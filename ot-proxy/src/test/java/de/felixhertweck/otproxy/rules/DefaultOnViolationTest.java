package de.felixhertweck.otproxy.rules;

import java.time.Instant;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

import de.felixhertweck.otproxy.config.DirectionalRateLimitConfig;
import de.felixhertweck.otproxy.config.ProxyConfig;
import de.felixhertweck.otproxy.config.RateLimitConfig;
import de.felixhertweck.otproxy.config.RegisterRuleConfig;
import de.felixhertweck.otproxy.config.RulesConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.ViolationAction;
import de.felixhertweck.otproxy.core.model.WriteRequest;
import de.felixhertweck.otproxy.core.rules.RuleEngine;
import org.junit.jupiter.api.Test;

class DefaultOnViolationTest {

    @Test
    void registerWithoutActionInheritsDefaultOnViolation() {
        RegisterRuleConfig reg = readOnly(200, null); // no on_violation of its own
        RuleEngine engine = engine("DISCONNECT", null, reg);

        RuleResult result = engine.evaluate(write(200));
        assertThat(result.allowed()).isFalse();
        assertThat(result.action()).isEqualTo(ViolationAction.DISCONNECT);
    }

    @Test
    void registerActionOverridesDefault() {
        RegisterRuleConfig reg = readOnly(200, "SILENT_DROP");
        RuleEngine engine = engine("DISCONNECT", null, reg);

        assertThat(engine.evaluate(write(200)).action()).isEqualTo(ViolationAction.SILENT_DROP);
    }

    @Test
    void unlistedRegisterDenyUsesDefaultOnViolation() {
        RuleEngine engine = engine("DISCONNECT", null); // no registers -> default_action DENY

        RuleResult result = engine.evaluate(write(999));
        assertThat(result.allowed()).isFalse();
        assertThat(result.action()).isEqualTo(ViolationAction.DISCONNECT);
    }

    @Test
    void readLimitWithoutActionUsesDefaultOnViolation() {
        RateLimitConfig readLimit = new RateLimitConfig();
        readLimit.setMaxRequests(1);
        readLimit.setPerMillis(1000); // no on_violation -> falls back to default
        RuleEngine engine = engine("DISCONNECT", readLimit);
        Instant now = Instant.parse("2024-01-01T00:00:00Z");

        assertThat(engine.evaluateRead(999, now).allowed()).isTrue();
        RuleResult blocked = engine.evaluateRead(999, now);
        assertThat(blocked.allowed()).isFalse();
        assertThat(blocked.action()).isEqualTo(ViolationAction.DISCONNECT);
    }

    @Test
    void registerOnViolationOverridesGlobalWriteLimitOnViolation() {
        // Global write limit says SILENT_DROP; register says DISCONNECT — register must win.
        RateLimitConfig globalWrite = new RateLimitConfig();
        globalWrite.setMaxRequests(1);
        globalWrite.setPerMillis(1000);
        globalWrite.setOnViolation("SILENT_DROP");

        DirectionalRateLimitConfig defaults = new DirectionalRateLimitConfig();
        defaults.setWrite(globalWrite);

        RegisterRuleConfig reg = new RegisterRuleConfig();
        reg.setAddress(100);
        reg.setAllowWrite(true);
        reg.setOnViolation("DISCONNECT");

        RulesConfig rules = new RulesConfig();
        rules.setDefaultRateLimit(defaults);
        rules.setRegisters(List.of(reg));

        ProxyConfig config = new ProxyConfig();
        config.setRules(rules);
        RuleEngine engine = new RuleEngine(config);

        Instant base = Instant.parse("2024-01-01T00:00:00Z");
        assertThat(engine.evaluate(new WriteRequest("modbus", 100, 1, "127.0.0.1", base)).allowed())
                .isTrue();
        RuleResult blocked =
                engine.evaluate(
                        new WriteRequest("modbus", 100, 1, "127.0.0.1", base.plusMillis(10)));
        assertThat(blocked.allowed()).isFalse();
        assertThat(blocked.action()).isEqualTo(ViolationAction.DISCONNECT);
    }

    @Test
    void registerOnViolationOverridesGlobalReadLimitOnViolation() {
        // Global rate limit says SILENT_DROP; register says DISCONNECT — register must win.
        RateLimitConfig globalRead = new RateLimitConfig();
        globalRead.setMaxRequests(1);
        globalRead.setPerMillis(1000);
        globalRead.setOnViolation("SILENT_DROP");

        RegisterRuleConfig reg = new RegisterRuleConfig();
        reg.setAddress(200);
        reg.setAllowWrite(false);
        reg.setOnViolation("DISCONNECT");

        RuleEngine engine = engine(null, globalRead, reg);
        Instant now = Instant.parse("2024-01-01T00:00:00Z");

        assertThat(engine.evaluateRead(200, now).allowed()).isTrue();
        RuleResult blocked = engine.evaluateRead(200, now);
        assertThat(blocked.allowed()).isFalse();
        assertThat(blocked.action()).isEqualTo(ViolationAction.DISCONNECT);
    }

    @Test
    void fallsBackToModbusExceptionWhenNoDefault() {
        RuleEngine engine = engine(null, null, readOnly(200, null));
        assertThat(engine.evaluate(write(200)).action())
                .isEqualTo(ViolationAction.MODBUS_EXCEPTION);
    }

    private RegisterRuleConfig readOnly(int address, String onViolation) {
        RegisterRuleConfig c = new RegisterRuleConfig();
        c.setAddress(address);
        c.setAllowWrite(false);
        c.setOnViolation(onViolation);
        return c;
    }

    private WriteRequest write(int address) {
        return new WriteRequest("modbus", address, 1, "127.0.0.1", Instant.now());
    }

    private RuleEngine engine(
            String defaultOnViolation,
            RateLimitConfig defaultRead,
            RegisterRuleConfig... registers) {
        DirectionalRateLimitConfig defaults = new DirectionalRateLimitConfig();
        defaults.setRead(defaultRead);

        RulesConfig rules = new RulesConfig();
        rules.setDefaultAction("DENY");
        rules.setDefaultOnViolation(defaultOnViolation);
        rules.setDefaultRateLimit(defaults);
        rules.setRegisters(List.of(registers));

        ProxyConfig config = new ProxyConfig();
        config.setRules(rules);
        return new RuleEngine(config);
    }
}
