package de.felixhertweck.otproxy;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.util.List;

import de.felixhertweck.otproxy.config.ConfigLoader;
import de.felixhertweck.otproxy.config.ProxyConfig;
import de.felixhertweck.otproxy.core.pipeline.RequestHandler;
import de.felixhertweck.otproxy.core.pipeline.RequestPipeline;
import de.felixhertweck.otproxy.core.rules.RuleEngine;
import de.felixhertweck.otproxy.protocol.modbus.ModbusTcpListener;
import de.felixhertweck.otproxy.protocol.modbus.ModbusTcpUpstream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Main {

    private static final Logger log = LoggerFactory.getLogger(Main.class);

    public static void main(String[] args) throws IOException {
        ProxyConfig config = loadConfig(args);

        RuleEngine ruleEngine = new RuleEngine(config);

        RequestHandler violationLogger =
                (req, result) -> {
                    if (!result.allowed()) {
                        log.warn(
                                "VIOLATION protocol={} register={} value={} ip={} reason={}",
                                req.protocol(),
                                req.registerAddress(),
                                req.value(),
                                req.sourceIp(),
                                result.reason());
                    }
                };

        RequestPipeline pipeline = new RequestPipeline(ruleEngine, List.of(violationLogger));

        ModbusTcpUpstream upstream =
                new ModbusTcpUpstream(
                        config.getProxy().getUpstream().getHost(),
                        config.getProxy().getUpstream().getPort());

        ModbusTcpListener listener =
                new ModbusTcpListener(
                        config.getProxy().getListen().getHost(),
                        config.getProxy().getListen().getPort(),
                        pipeline,
                        upstream);

        Runtime.getRuntime().addShutdownHook(new Thread(listener::stop));
        listener.start();
    }

    private static ProxyConfig loadConfig(String[] args) throws IOException {
        if (args.length > 0) {
            Path configPath = Path.of(args[0]);
            log.info("Loading config from {}", configPath.toAbsolutePath());
            return ConfigLoader.load(configPath);
        }

        // Fall back to bundled default config
        try (InputStream in = Main.class.getClassLoader().getResourceAsStream("proxy-config.yml")) {
            if (in == null)
                throw new IllegalStateException("No proxy-config.yml found on classpath");
            log.info("Loading bundled default config");
            return ConfigLoader.load(in);
        }
    }
}
