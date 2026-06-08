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
              nodes:
                - target: "100"
                  description: "Pump speed"
                  allow_write: true
                  value_range:
                    min: 0
                    max: 1500
                  rate_limit:
                    max_writes: 10
                    per_seconds: 60
                  on_violation: MODBUS_EXCEPTION
                - target: "200"
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
        assertThat(config.getRules().getNodes()).hasSize(2);
    }

    @Test
    void parsesAllowWriteAndViolationAction() {
        ProxyConfig config = load(YAML);
        NodeRuleConfig pump = config.getRules().getNodes().get(0);
        assertThat(pump.getTarget()).isEqualTo("100");
        assertThat(pump.isAllowWrite()).isTrue();
        assertThat(pump.getOnViolation()).isEqualTo("MODBUS_EXCEPTION");

        NodeRuleConfig eStop = config.getRules().getNodes().get(1);
        assertThat(eStop.getTarget()).isEqualTo("200");
        assertThat(eStop.isAllowWrite()).isFalse();
        assertThat(eStop.getOnViolation()).isEqualTo("DISCONNECT");
    }

    @Test
    void parsesValueRange() {
        ProxyConfig config = load(YAML);
        ValueRangeConfig range = config.getRules().getNodes().get(0).getValueRange();
        assertThat(range).isNotNull();
        assertThat(range.getMin()).isEqualTo(0);
        assertThat(range.getMax()).isEqualTo(1500);
    }

    @Test
    void parsesRateLimit() {
        ProxyConfig config = load(YAML);
        RateLimitConfig rl = config.getRules().getNodes().get(0).getRateLimit();
        assertThat(rl).isNotNull();
        assertThat(rl.getMaxWrites()).isEqualTo(10);
        assertThat(rl.getPerSeconds()).isEqualTo(60);
    }

    private ProxyConfig load(String yaml) {
        return ConfigLoader.load(new ByteArrayInputStream(yaml.getBytes(StandardCharsets.UTF_8)));
    }
}
