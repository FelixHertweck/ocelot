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
        RegisterRuleConfig config = config(3, 60_000);
        Instant base = Instant.parse("2024-01-01T00:00:00Z");

        for (int i = 0; i < 3; i++) {
            RuleResult result = rule.evaluate(request(100, i, base.plusSeconds(i)), config);
            assertThat(result.allowed()).as("write #" + i + " should be allowed").isTrue();
        }
    }

    @Test
    void blocksWriteExceedingLimit() {
        RegisterRuleConfig config = config(3, 60_000);
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
        RegisterRuleConfig config = config(2, 10_000);
        Instant base = Instant.parse("2024-01-01T00:00:00Z");

        rule.evaluate(request(100, 1, base), config);
        rule.evaluate(request(100, 2, base.plusSeconds(1)), config);

        // Both writes now outside the 10s window
        RuleResult result = rule.evaluate(request(100, 3, base.plusSeconds(11)), config);
        assertThat(result.allowed()).isTrue();
    }

    @Test
    void rateLimitsArePerRegister() {
        RegisterRuleConfig config = config(1, 60_000);
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

    @Test
    void enforcesSubSecondWindow() {
        // 1 write per 100ms
        RegisterRuleConfig config = config(1, 100);
        Instant base = Instant.parse("2024-01-01T00:00:00Z");

        assertThat(rule.evaluate(request(100, 1, base), config).allowed()).isTrue();
        // 50ms later -> still inside window -> blocked
        assertThat(rule.evaluate(request(100, 2, base.plusMillis(50)), config).allowed()).isFalse();
        // 150ms after the first -> window expired -> allowed again
        assertThat(rule.evaluate(request(100, 3, base.plusMillis(150)), config).allowed()).isTrue();
    }

    @Test
    void usesDefaultRateLimitWhenRegisterHasNone() {
        RateLimitRule ruleWithDefault = new RateLimitRule(rateLimit(1, 100));

        RegisterRuleConfig c = new RegisterRuleConfig();
        c.setOnViolation("MODBUS_EXCEPTION");
        // register defines no rate_limit of its own -> falls back to the default
        Instant base = Instant.parse("2024-01-01T00:00:00Z");

        assertThat(ruleWithDefault.evaluate(request(100, 1, base), c).allowed()).isTrue();
        assertThat(ruleWithDefault.evaluate(request(100, 2, base.plusMillis(10)), c).allowed())
                .isFalse();
    }

    @Test
    void registerRateLimitOverridesDefault() {
        // Strict global default, but the register allows many more writes
        RateLimitRule ruleWithDefault = new RateLimitRule(rateLimit(1, 100));
        RegisterRuleConfig c = config(5, 100);
        Instant base = Instant.parse("2024-01-01T00:00:00Z");

        for (int i = 0; i < 5; i++) {
            assertThat(ruleWithDefault.evaluate(request(100, i, base.plusMillis(i)), c).allowed())
                    .as("write #" + i)
                    .isTrue();
        }
        // 6th within the same window exceeds the register's own limit of 5
        assertThat(ruleWithDefault.evaluate(request(100, 99, base.plusMillis(6)), c).allowed())
                .isFalse();
    }

    private WriteRequest request(int address, int value, Instant timestamp) {
        return new WriteRequest("modbus", address, value, "127.0.0.1", timestamp);
    }

    private RateLimitConfig rateLimit(int maxWrites, int perMillis) {
        RateLimitConfig rl = new RateLimitConfig();
        rl.setMaxWrites(maxWrites);
        rl.setPerMillis(perMillis);
        return rl;
    }

    private RegisterRuleConfig config(int maxWrites, int perMillis) {
        RegisterRuleConfig c = new RegisterRuleConfig();
        c.setRateLimit(rateLimit(maxWrites, perMillis));
        c.setOnViolation("MODBUS_EXCEPTION");
        return c;
    }
}
