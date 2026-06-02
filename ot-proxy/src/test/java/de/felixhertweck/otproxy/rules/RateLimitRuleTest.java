package de.felixhertweck.otproxy.rules;

import java.time.Instant;

import static org.assertj.core.api.Assertions.assertThat;

import de.felixhertweck.otproxy.config.RateLimitConfig;
import de.felixhertweck.otproxy.config.RegisterRuleConfig;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.WriteRequest;
import de.felixhertweck.otproxy.core.rules.RateLimitRule;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class RateLimitRuleTest {

    private RateLimitRule rule;

    @BeforeEach
    void setUp() {
        rule = new RateLimitRule();
    }

    @Test
    void allowsWritesUpToLimit() {
        RegisterRuleConfig config = config(3, 60);
        Instant base = Instant.parse("2024-01-01T00:00:00Z");

        for (int i = 0; i < 3; i++) {
            RuleResult result = rule.evaluate(request(100, i, base.plusSeconds(i)), config);
            assertThat(result.allowed()).as("write #" + i + " should be allowed").isTrue();
        }
    }

    @Test
    void blocksWriteExceedingLimit() {
        RegisterRuleConfig config = config(3, 60);
        Instant base = Instant.parse("2024-01-01T00:00:00Z");

        for (int i = 0; i < 3; i++) {
            rule.evaluate(request(100, i, base.plusSeconds(i)), config);
        }
        RuleResult fourth = rule.evaluate(request(100, 99, base.plusSeconds(3)), config);
        assertThat(fourth.allowed()).isFalse();
        assertThat(fourth.reason()).contains("Rate limit");
    }

    @Test
    void allowsWriteAfterWindowExpires() {
        RegisterRuleConfig config = config(2, 10);
        Instant base = Instant.parse("2024-01-01T00:00:00Z");

        rule.evaluate(request(100, 1, base), config);
        rule.evaluate(request(100, 2, base.plusSeconds(1)), config);

        // Both writes now outside the 10s window
        RuleResult result = rule.evaluate(request(100, 3, base.plusSeconds(11)), config);
        assertThat(result.allowed()).isTrue();
    }

    @Test
    void rateLimitsArePerRegister() {
        RegisterRuleConfig config = config(1, 60);
        Instant now = Instant.now();

        // Fill register 100
        rule.evaluate(request(100, 1, now), config);
        assertThat(rule.evaluate(request(100, 2, now), config).allowed()).isFalse();

        // Register 101 should be independent and still allowed
        assertThat(rule.evaluate(request(101, 1, now), config).allowed()).isTrue();
    }

    @Test
    void allowsWhenNoRateLimitConfigured() {
        RegisterRuleConfig c = new RegisterRuleConfig();
        // no rateLimit set
        for (int i = 0; i < 100; i++) {
            assertThat(rule.evaluate(request(100, i, Instant.now()), c).allowed()).isTrue();
        }
    }

    private WriteRequest request(int address, int value, Instant timestamp) {
        return new WriteRequest("modbus", address, value, "127.0.0.1", timestamp);
    }

    private RegisterRuleConfig config(int maxWrites, int perSeconds) {
        RateLimitConfig rl = new RateLimitConfig();
        rl.setMaxWrites(maxWrites);
        rl.setPerSeconds(perSeconds);
        RegisterRuleConfig c = new RegisterRuleConfig();
        c.setRateLimit(rl);
        c.setOnViolation("MODBUS_EXCEPTION");
        return c;
    }
}
