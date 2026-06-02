package de.felixhertweck.otproxy.protocol.modbus;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import de.felixhertweck.otproxy.core.pipeline.RequestPipeline;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ModbusTcpListener {

    private static final Logger log = LoggerFactory.getLogger(ModbusTcpListener.class);

    private final String bindHost;
    private final int bindPort;
    private final RequestPipeline pipeline;
    private final ModbusTcpUpstream upstream;
    private final ExecutorService executor = Executors.newCachedThreadPool();

    private volatile boolean running = false;
    private ServerSocket serverSocket;

    public ModbusTcpListener(
            String bindHost, int bindPort, RequestPipeline pipeline, ModbusTcpUpstream upstream) {
        this.bindHost = bindHost;
        this.bindPort = bindPort;
        this.pipeline = pipeline;
        this.upstream = upstream;
    }

    public void start() throws IOException {
        serverSocket = new ServerSocket(bindPort);
        running = true;
        log.info("Modbus proxy listening on {}:{}", bindHost, bindPort);

        while (running) {
            try {
                Socket client = serverSocket.accept();
                executor.submit(new ModbusConnectionHandler(client, pipeline, upstream));
            } catch (IOException e) {
                if (running) {
                    log.error("Accept error: {}", e.getMessage());
                }
            }
        }
    }

    public void stop() {
        running = false;
        try {
            if (serverSocket != null) serverSocket.close();
        } catch (IOException e) {
            log.warn("Error closing server socket: {}", e.getMessage());
        }
        executor.shutdown();
        try {
            if (!executor.awaitTermination(5, TimeUnit.SECONDS)) {
                executor.shutdownNow();
            }
        } catch (InterruptedException e) {
            executor.shutdownNow();
            Thread.currentThread().interrupt();
        }
        log.info("Modbus proxy stopped.");
    }
}
