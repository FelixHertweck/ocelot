package de.felixhertweck.emulator.server;

import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.nio.charset.StandardCharsets;
import java.util.function.Supplier;

import com.sun.net.httpserver.HttpServer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ManagementHttpServer {

    private static final Logger logger = LoggerFactory.getLogger(ManagementHttpServer.class);
    private final HttpServer server;

    public ManagementHttpServer(int port, Runnable resetCallback, Supplier<String> statusSupplier)
            throws IOException {
        server = HttpServer.create(new InetSocketAddress(port), 0);
        server.createContext(
                "/reset",
                exchange -> {
                    try (exchange) {
                        exchange.getRequestBody().close();
                        if (!"POST".equals(exchange.getRequestMethod())) {
                            exchange.sendResponseHeaders(405, -1);
                            return;
                        }
                        resetCallback.run();
                        byte[] body = "{\"status\":\"ok\"}".getBytes(StandardCharsets.UTF_8);
                        exchange.getResponseHeaders()
                                .set("Content-Type", "application/json; charset=utf-8");
                        exchange.sendResponseHeaders(200, body.length);
                        try (OutputStream os = exchange.getResponseBody()) {
                            os.write(body);
                        }
                        logger.info("Emulator state reset via REST endpoint.");
                    }
                });
        server.createContext(
                "/status",
                exchange -> {
                    try (exchange) {
                        if (!"GET".equals(exchange.getRequestMethod())) {
                            exchange.sendResponseHeaders(405, -1);
                            return;
                        }
                        byte[] body = statusSupplier.get().getBytes(StandardCharsets.UTF_8);
                        exchange.getResponseHeaders()
                                .set("Content-Type", "application/json; charset=utf-8");
                        exchange.sendResponseHeaders(200, body.length);
                        try (OutputStream os = exchange.getResponseBody()) {
                            os.write(body);
                        }
                    } catch (IOException | RuntimeException e) {
                        logger.error("Error handling /status request", e);
                        exchange.sendResponseHeaders(500, -1);
                    }
                });
    }

    public void start() {
        server.start();
        logger.info("Management HTTP server listening on port {}", server.getAddress().getPort());
    }

    public void stop() {
        server.stop(0);
    }
}
