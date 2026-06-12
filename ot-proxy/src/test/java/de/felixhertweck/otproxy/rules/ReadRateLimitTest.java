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
import de.felixhertweck.otproxy.core.rules.RuleEngine;
import org.junit.jupiter.api.Test;

class ReadRateLimitTest {

    private static final int ADDR = 100;

    @Test
    void allowsReadsWhenNoReadLimitConfigured() {
        RuleEngine engine = engineWithDefaultRead(null);
        for (int i = 0; i < 100; i++) {
            assertThat(engine.evaluateRead(String.valueOf(ADDR), Instant.now()).allowed()).isTrue();
        }
    }

    @Test
    void allowsReadsUpToLimitThenBlocks() {
        RuleEngine engine = engineWithDefaultRead(limit(3, 1000, "MODBUS_EXCEPTION"));
        Instant base = Instant.parse("2024-01-01T00:00:00Z");

        for (int i = 0; i < 3; i++) {
            assertThat(engine.evaluateRead(String.valueOf(ADDR), base.plusMillis(i)).allowed())
                    .as("read #" + i)
                    .isTrue();
        }
        RuleResult fourth = engine.evaluateRead(String.valueOf(ADDR), base.plusMillis(3));
        assertThat(fourth.allowed()).isFalse();
        assertThat(fourth.reason()).contains("read " + ADDR);
        assertThat(fourth.action()).isEqualTo(ViolationAction.MODBUS_EXCEPTION);
    }

    @Test
    void allowsReadAfterWindowExpires() {
        RuleEngine engine = engineWithDefaultRead(limit(1, 100, "MODBUS_EXCEPTION"));
        Instant base = Instant.parse("2024-01-01T00:00:00Z");

        assertThat(engine.evaluateRead(String.valueOf(ADDR), base).allowed()).isTrue();
        // 50ms later -> still inside the 100ms window -> blocked
        assertThat(engine.evaluateRead(String.valueOf(ADDR), base.plusMillis(50)).allowed())
                .isFalse();
        // 150ms later -> window expired -> allowed again
        assertThat(engine.evaluateRead(String.valueOf(ADDR), base.plusMillis(150)).allowed())
                .isTrue();
    }

    @Test
    void readLimitsArePerRegister() {
        RuleEngine engine = engineWithDefaultRead(limit(1, 1000, "MODBUS_EXCEPTION"));
        Instant now = Instant.parse("2024-01-01T00:00:00Z");

        assertThat(engine.evaluateRead(String.valueOf(ADDR), now).allowed()).isTrue();
        assertThat(engine.evaluateRead(String.valueOf(ADDR), now).allowed()).isFalse();
        // a different register has its own independent window
        assertThat(engine.evaluateRead(String.valueOf(ADDR + 1), now).allowed()).isTrue();
    }

    @Test
    void registerReadLimitOverridesDefaultAndInheritsRegisterAction() {
        // strict default, but the register allows more and uses DISCONNECT on violation
        RegisterRuleConfig reg = new RegisterRuleConfig();
        reg.setAddress(ADDR);
        reg.setOnViolation("DISCONNECT");
        reg.setRead(limit(2, 1000, null)); // no on_violation -> inherit register's

        RuleEngine engine = engine(limit(1, 1000, "MODBUS_EXCEPTION"), reg);
        Instant base = Instant.parse("2024-01-01T00:00:00Z");

        assertThat(engine.evaluateRead(String.valueOf(ADDR), base).allowed()).isTrue();
        assertThat(engine.evaluateRead(String.valueOf(ADDR), base.plusMillis(1)).allowed())
                .isTrue();
        RuleResult blocked = engine.evaluateRead(String.valueOf(ADDR), base.plusMillis(2));
        assertThat(blocked.allowed()).isFalse();
        assertThat(blocked.action()).isEqualTo(ViolationAction.DISCONNECT);
    }

    private RateLimitConfig limit(int maxRequests, int perMillis, String onViolation) {
        RateLimitConfig rl = new RateLimitConfig();
        rl.setMaxRequests(maxRequests);
        rl.setPerMillis(perMillis);
        rl.setOnViolation(onViolation);
        return rl;
    }

    private RuleEngine engineWithDefaultRead(RateLimitConfig defaultRead) {
        return engine(defaultRead);
    }

    private RuleEngine engine(RateLimitConfig defaultRead, RegisterRuleConfig... registers) {
        DirectionalRateLimitConfig defaults = new DirectionalRateLimitConfig();
        defaults.setRead(defaultRead);

        RulesConfig rules = new RulesConfig();
        rules.setDefaultRateLimit(defaults);
        rules.setRegisters(List.of(registers));

        ProxyConfig config = new ProxyConfig();
        config.setRules(rules);
        return new RuleEngine(config);
    }
}
