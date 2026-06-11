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
              default_rate_limit:
                max_writes: 1
                per_millis: 100
              read_rate_limit:
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
                  rate_limit:
                    max_writes: 10
                    per_millis: 60000
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
    void parsesRateLimit() {
        ProxyConfig config = load(YAML);
        RateLimitConfig rl = config.getRules().getRegisters().get(0).getRateLimit();
        assertThat(rl).isNotNull();
        assertThat(rl.getMaxWrites()).isEqualTo(10);
        assertThat(rl.getPerMillis()).isEqualTo(60000);
    }

    @Test
    void parsesDefaultRateLimit() {
        ProxyConfig config = load(YAML);
        RateLimitConfig rl = config.getRules().getDefaultRateLimit();
        assertThat(rl).isNotNull();
        assertThat(rl.getMaxWrites()).isEqualTo(1);
        assertThat(rl.getPerMillis()).isEqualTo(100);
    }

    @Test
    void parsesReadRateLimit() {
        ProxyConfig config = load(YAML);
        ReadRateLimitConfig rl = config.getRules().getReadRateLimit();
        assertThat(rl).isNotNull();
        assertThat(rl.getMaxRequests()).isEqualTo(25);
        assertThat(rl.getPerMillis()).isEqualTo(1000);
        assertThat(rl.getOnViolation()).isEqualTo("SILENT_DROP");
    }

    private ProxyConfig load(String yaml) {
        return ConfigLoader.load(new ByteArrayInputStream(yaml.getBytes(StandardCharsets.UTF_8)));
    }
}
