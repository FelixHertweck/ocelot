package de.felixhertweck.otproxy.protocol.modbus;

import java.io.DataInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.time.Instant;
import java.util.Optional;
import java.util.OptionalInt;

import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.ViolationAction;
import de.felixhertweck.otproxy.core.model.WriteRequest;
import de.felixhertweck.otproxy.core.pipeline.RequestPipeline;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Handles a single Modbus TCP client connection.
 *
 * <p>For every incoming frame: - Read requests → checked against the per-register read rate limit,
 * then forwarded to upstream - Write requests → evaluated by the rule pipeline first ALLOW →
 * forwarded to upstream, response relayed back MODBUS_EXCEPTION → exception frame returned to
 * client SILENT_DROP → request discarded, connection stays open DISCONNECT → connection closed
 * immediately
 */
public class ModbusConnectionHandler implements Runnable {

    private static final Logger log = LoggerFactory.getLogger(ModbusConnectionHandler.class);

    // Modbus exception codes
    private static final int EX_ILLEGAL_DATA_ADDRESS = 0x02;
    private static final int EX_ILLEGAL_DATA_VALUE = 0x03;
    private static final int EX_SLAVE_DEVICE_FAILURE = 0x04;

    private final Socket clientSocket;
    private final RequestPipeline pipeline;
    private final ModbusTcpUpstream upstream;
    private final ModbusRequestAdapter adapter = new ModbusRequestAdapter();

    public ModbusConnectionHandler(
            Socket clientSocket, RequestPipeline pipeline, ModbusTcpUpstream upstream) {
        this.clientSocket = clientSocket;
        this.pipeline = pipeline;
        this.upstream = upstream;
    }

    @Override
    public void run() {
        String clientAddr = clientSocket.getRemoteSocketAddress().toString();
        log.info("Client connected: {}", clientAddr);
        try (clientSocket;
                DataInputStream in = new DataInputStream(clientSocket.getInputStream());
                OutputStream out = clientSocket.getOutputStream()) {

            while (!clientSocket.isClosed()) {
                ModbusFrame frame = ModbusFrame.read(in);

                if (!adapter.isWriteFrame(frame)) {
                    // Reads (FC 0x01-0x04) are throttled per register; other non-write frames
                    // (diagnostics, …) are forwarded transparently.
                    OptionalInt readAddress = adapter.readStartAddress(frame);
                    if (readAddress.isPresent()) {
                        RuleResult readResult =
                                pipeline.processRead(readAddress.getAsInt(), Instant.now());
                        if (!readResult.allowed()) {
                            log.warn(
                                    "[BLOCKED] {} read register={} reason={}",
                                    clientAddr,
                                    readAddress.getAsInt(),
                                    readResult.reason());
                            handleViolation(frame, readResult, out);
                            if (readResult.action() == ViolationAction.DISCONNECT) {
                                break;
                            }
                            continue;
                        }
                    }
                    relayToUpstream(frame, out);
                    continue;
                }

                Optional<WriteRequest> request = adapter.adapt(frame, clientAddr);
                if (request.isEmpty()) {
                    // Could not parse write — forward as-is (safe-fail open)
                    relayToUpstream(frame, out);
                    continue;
                }

                RuleResult result = pipeline.process(request.get());

                if (result.allowed()) {
                    relayToUpstream(frame, out);
                } else {
                    log.warn(
                            "[BLOCKED] {} register={} value={} reason={}",
                            clientAddr,
                            request.get().registerAddress(),
                            request.get().value(),
                            result.reason());
                    handleViolation(frame, result, out);
                    if (result.action() == ViolationAction.DISCONNECT) {
                        break;
                    }
                }
            }
        } catch (EOFException e) {
            log.debug("Client disconnected: {}", clientAddr);
        } catch (IOException e) {
            log.warn("Connection error for {}: {}", clientAddr, e.getMessage());
        }
        log.info("Client session ended: {}", clientAddr);
    }

    private void relayToUpstream(ModbusFrame frame, OutputStream clientOut) {
        try {
            ModbusFrame response = upstream.forward(frame);
            clientOut.write(response.toBytes());
            clientOut.flush();
        } catch (IOException e) {
            log.error("Upstream relay failed: {}", e.getMessage());
            try {
                clientOut.write(frame.toExceptionResponse(EX_SLAVE_DEVICE_FAILURE));
                clientOut.flush();
            } catch (IOException ignored) {
            }
        }
    }

    private void handleViolation(ModbusFrame frame, RuleResult result, OutputStream out)
            throws IOException {
        switch (result.action()) {
            case MODBUS_EXCEPTION -> {
                out.write(frame.toExceptionResponse(EX_ILLEGAL_DATA_ADDRESS));
                out.flush();
            }
            case SILENT_DROP -> {
                /* do nothing — client sees no response */
            }
            case DISCONNECT -> {
                /* caller closes the socket */
            }
        }
    }
}
