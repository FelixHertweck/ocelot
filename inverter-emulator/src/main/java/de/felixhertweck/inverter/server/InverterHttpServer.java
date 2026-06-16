package de.felixhertweck.inverter.server;

import com.sun.net.httpserver.HttpServer;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.util.function.Supplier;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class InverterHttpServer {

    private static final Logger log = LoggerFactory.getLogger(InverterHttpServer.class);
    private final HttpServer server;

    public InverterHttpServer(int port, Runnable resetCallback, Supplier<String> statusSupplier)
            throws IOException {
        server = HttpServer.create(new InetSocketAddress(port), 0);
        server.createContext(
                "/reset",
                exchange -> {
                    try {
                        exchange.getRequestBody().close();
                        if (!"POST".equals(exchange.getRequestMethod())) {
                            exchange.sendResponseHeaders(405, -1);
                            return;
                        }
                        resetCallback.run();
                        byte[] body = "{\"status\":\"ok\"}".getBytes();
                        exchange.getResponseHeaders().set("Content-Type", "application/json");
                        exchange.sendResponseHeaders(200, body.length);
                        try (OutputStream os = exchange.getResponseBody()) {
                            os.write(body);
                        }
                        log.info("Inverter state reset via REST endpoint.");
                    } finally {
                        exchange.close();
                    }
                });
        server.createContext(
                "/status",
                exchange -> {
                    try {
                        exchange.getRequestBody().close();
                        if (!"GET".equals(exchange.getRequestMethod())) {
                            exchange.sendResponseHeaders(405, -1);
                            return;
                        }
                        byte[] body = statusSupplier.get().getBytes();
                        exchange.getResponseHeaders().set("Content-Type", "application/json");
                        exchange.sendResponseHeaders(200, body.length);
                        try (OutputStream os = exchange.getResponseBody()) {
                            os.write(body);
                        }
                    } finally {
                        exchange.close();
                    }
                });
    }

    public void start() {
        server.start();
        log.info("Inverter HTTP server listening on port {}", server.getAddress().getPort());
    }

    public void stop() {
        server.stop(0);
    }
}
