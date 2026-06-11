package de.felixhertweck.otproxy.rules;

import java.time.Instant;

import static org.assertj.core.api.Assertions.assertThat;

import de.felixhertweck.otproxy.config.ProxyConfig;
import de.felixhertweck.otproxy.config.ReadRateLimitConfig;
import de.felixhertweck.otproxy.config.RulesConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.ViolationAction;
import de.felixhertweck.otproxy.core.rules.RuleEngine;
import org.junit.jupiter.api.Test;

class ReadRateLimitTest {

    @Test
    void allowsReadsWhenNoReadLimitConfigured() {
        RuleEngine engine = engine(null);
        for (int i = 0; i < 100; i++) {
            assertThat(engine.evaluateRead(Instant.now()).allowed()).isTrue();
        }
    }

    @Test
    void allowsReadsUpToLimitThenBlocks() {
        RuleEngine engine = engine(readLimit(3, 1000, "MODBUS_EXCEPTION"));
        Instant base = Instant.parse("2024-01-01T00:00:00Z");

        for (int i = 0; i < 3; i++) {
            assertThat(engine.evaluateRead(base.plusMillis(i)).allowed()).as("read #" + i).isTrue();
        }
        RuleResult fourth = engine.evaluateRead(base.plusMillis(3));
        assertThat(fourth.allowed()).isFalse();
        assertThat(fourth.reason()).contains("Read rate limit");
        assertThat(fourth.action()).isEqualTo(ViolationAction.MODBUS_EXCEPTION);
    }

    @Test
    void allowsReadAfterWindowExpires() {
        RuleEngine engine = engine(readLimit(1, 100, "MODBUS_EXCEPTION"));
        Instant base = Instant.parse("2024-01-01T00:00:00Z");

        assertThat(engine.evaluateRead(base).allowed()).isTrue();
        // 50ms later -> still inside the 100ms window -> blocked
        assertThat(engine.evaluateRead(base.plusMillis(50)).allowed()).isFalse();
        // 150ms later -> window expired -> allowed again
        assertThat(engine.evaluateRead(base.plusMillis(150)).allowed()).isTrue();
    }

    @Test
    void usesConfiguredViolationAction() {
        RuleEngine engine = engine(readLimit(1, 1000, "DISCONNECT"));
        Instant base = Instant.parse("2024-01-01T00:00:00Z");

        engine.evaluateRead(base);
        RuleResult blocked = engine.evaluateRead(base.plusMillis(1));
        assertThat(blocked.allowed()).isFalse();
        assertThat(blocked.action()).isEqualTo(ViolationAction.DISCONNECT);
    }

    private ReadRateLimitConfig readLimit(int maxRequests, int perMillis, String onViolation) {
        ReadRateLimitConfig rl = new ReadRateLimitConfig();
        rl.setMaxRequests(maxRequests);
        rl.setPerMillis(perMillis);
        rl.setOnViolation(onViolation);
        return rl;
    }

    private RuleEngine engine(ReadRateLimitConfig readLimit) {
        RulesConfig rules = new RulesConfig();
        rules.setReadRateLimit(readLimit);
        ProxyConfig config = new ProxyConfig();
        config.setRules(rules);
        return new RuleEngine(config);
    }
}
