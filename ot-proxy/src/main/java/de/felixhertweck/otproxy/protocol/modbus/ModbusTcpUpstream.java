package de.felixhertweck.otproxy.protocol.modbus;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Forwards a Modbus TCP frame to the upstream device and returns its response.
 *
 * <p>Opens a new TCP connection per call (simple, correct for low-frequency OT use cases). Upgrade
 * to a connection pool if latency becomes a concern.
 */
public class ModbusTcpUpstream {

    private static final Logger log = LoggerFactory.getLogger(ModbusTcpUpstream.class);

    private final String host;
    private final int port;
    private final int timeoutMs;

    public ModbusTcpUpstream(String host, int port) {
        this(host, port, 5000);
    }

    public ModbusTcpUpstream(String host, int port, int timeoutMs) {
        this.host = host;
        this.port = port;
        this.timeoutMs = timeoutMs;
    }

    /**
     * Sends the raw frame bytes to the upstream device and reads back the response frame.
     *
     * @throws IOException if the connection fails or upstream sends an invalid response
     */
    public ModbusFrame forward(ModbusFrame request) throws IOException {
        try (Socket socket = new Socket(host, port)) {
            socket.setSoTimeout(timeoutMs);

            OutputStream out = socket.getOutputStream();
            out.write(request.toBytes());
            out.flush();

            DataInputStream in = new DataInputStream(socket.getInputStream());
            return ModbusFrame.read(in);
        } catch (IOException e) {
            log.error("Upstream connection to {}:{} failed: {}", host, port, e.getMessage());
            throw e;
        }
    }
}
