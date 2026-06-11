package de.felixhertweck.otproxy.config;

import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

class ConfigLoaderTest {

    private static final String YAML =
            """
            proxy:
              listen:
                host: 0.0.0.0
                port: 5020
              upstream:
                host: 192.168.1.10
                port: 502
            rules:
              default_action: DENY
              default_on_violation: DISCONNECT
              default_rate_limit:
                write:
                  max_requests: 1
                  per_millis: 100
                read:
                  max_requests: 25
                  per_millis: 1000
                  on_violation: SILENT_DROP
              registers:
                - address: 100
                  description: "Pump speed"
                  allow_write: true
                  value_range:
                    min: 0
                    max: 1500
                  write:
                    max_requests: 10
                    per_millis: 60000
                  read:
                    max_requests: 50
                    per_millis: 2000
                  on_violation: MODBUS_EXCEPTION
                - address: 200
                  description: "Emergency stop"
                  allow_write: false
                  on_violation: DISCONNECT
            """;

    @Test
    void parsesProxySection() {
        ProxyConfig config = load(YAML);
        assertThat(config.getProxy().getListen().getHost()).isEqualTo("0.0.0.0");
        assertThat(config.getProxy().getListen().getPort()).isEqualTo(5020);
        assertThat(config.getProxy().getUpstream().getHost()).isEqualTo("192.168.1.10");
        assertThat(config.getProxy().getUpstream().getPort()).isEqualTo(502);
    }

    @Test
    void parsesDefaultAction() {
        ProxyConfig config = load(YAML);
        assertThat(config.getRules().getDefaultAction()).isEqualTo("DENY");
    }

    @Test
    void parsesDefaultOnViolation() {
        ProxyConfig config = load(YAML);
        assertThat(config.getRules().getDefaultOnViolation()).isEqualTo("DISCONNECT");
    }

    @Test
    void parsesRegisterList() {
        ProxyConfig config = load(YAML);
        assertThat(config.getRules().getRegisters()).hasSize(2);
    }

    @Test
    void parsesAllowWriteAndViolationAction() {
        ProxyConfig config = load(YAML);
        RegisterRuleConfig pump = config.getRules().getRegisters().get(0);
        assertThat(pump.getAddress()).isEqualTo(100);
        assertThat(pump.isAllowWrite()).isTrue();
        assertThat(pump.getOnViolation()).isEqualTo("MODBUS_EXCEPTION");

        RegisterRuleConfig eStop = config.getRules().getRegisters().get(1);
        assertThat(eStop.getAddress()).isEqualTo(200);
        assertThat(eStop.isAllowWrite()).isFalse();
        assertThat(eStop.getOnViolation()).isEqualTo("DISCONNECT");
    }

    @Test
    void parsesValueRange() {
        ProxyConfig config = load(YAML);
        ValueRangeConfig range = config.getRules().getRegisters().get(0).getValueRange();
        assertThat(range).isNotNull();
        assertThat(range.getMin()).isEqualTo(0);
        assertThat(range.getMax()).isEqualTo(1500);
    }

    @Test
    void parsesRegisterReadWriteLimits() {
        ProxyConfig config = load(YAML);
        RegisterRuleConfig pump = config.getRules().getRegisters().get(0);

        RateLimitConfig write = pump.getWrite();
        assertThat(write).isNotNull();
        assertThat(write.getMaxRequests()).isEqualTo(10);
        assertThat(write.getPerMillis()).isEqualTo(60000);

        RateLimitConfig read = pump.getRead();
        assertThat(read).isNotNull();
        assertThat(read.getMaxRequests()).isEqualTo(50);
        assertThat(read.getPerMillis()).isEqualTo(2000);
    }

    @Test
    void parsesDefaultRateLimit() {
        ProxyConfig config = load(YAML);
        DirectionalRateLimitConfig defaults = config.getRules().getDefaultRateLimit();
        assertThat(defaults).isNotNull();

        assertThat(defaults.getWrite()).isNotNull();
        assertThat(defaults.getWrite().getMaxRequests()).isEqualTo(1);
        assertThat(defaults.getWrite().getPerMillis()).isEqualTo(100);

        assertThat(defaults.getRead()).isNotNull();
        assertThat(defaults.getRead().getMaxRequests()).isEqualTo(25);
        assertThat(defaults.getRead().getPerMillis()).isEqualTo(1000);
        assertThat(defaults.getRead().getOnViolation()).isEqualTo("SILENT_DROP");
    }

    private ProxyConfig load(String yaml) {
        return ConfigLoader.load(new ByteArrayInputStream(yaml.getBytes(StandardCharsets.UTF_8)));
    }
}
