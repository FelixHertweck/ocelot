package de.felixhertweck.emulator.server;

import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.util.function.Supplier;

import com.sun.net.httpserver.HttpServer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ResetHttpServer {

    private static final Logger logger = LoggerFactory.getLogger(ResetHttpServer.class);
    private final HttpServer server;

    public ResetHttpServer(int port, Runnable resetCallback, Supplier<String> statusSupplier)
            throws IOException {
        server = HttpServer.create(new InetSocketAddress(port), 0);
        server.createContext(
                "/reset",
                exchange -> {
                    if (!"POST".equals(exchange.getRequestMethod())) {
                        exchange.sendResponseHeaders(405, -1);
                        exchange.close();
                        return;
                    }
                    resetCallback.run();
                    byte[] body = "{\"status\":\"ok\"}".getBytes();
                    exchange.getResponseHeaders().set("Content-Type", "application/json");
                    exchange.sendResponseHeaders(200, body.length);
                    try (OutputStream os = exchange.getResponseBody()) {
                        os.write(body);
                    }
                    logger.info("Emulator state reset via REST endpoint.");
                });
        server.createContext(
                "/status",
                exchange -> {
                    if (!"GET".equals(exchange.getRequestMethod())) {
                        exchange.sendResponseHeaders(405, -1);
                        exchange.close();
                        return;
                    }
                    byte[] body = statusSupplier.get().getBytes();
                    exchange.getResponseHeaders().set("Content-Type", "application/json");
                    exchange.sendResponseHeaders(200, body.length);
                    try (OutputStream os = exchange.getResponseBody()) {
                        os.write(body);
                    }
                });
    }

    public void start() {
        server.start();
        logger.info("Reset HTTP server listening on port {}", server.getAddress().getPort());
    }

    public void stop() {
        server.stop(0);
    }
}
