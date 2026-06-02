package de.felixhertweck.otproxy.integration;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import static org.assertj.core.api.Assertions.assertThat;

import de.felixhertweck.otproxy.config.ListenConfig;
import de.felixhertweck.otproxy.config.ProxyConfig;
import de.felixhertweck.otproxy.config.ProxySection;
import de.felixhertweck.otproxy.config.RegisterRuleConfig;
import de.felixhertweck.otproxy.config.RulesConfig;
import de.felixhertweck.otproxy.config.UpstreamConfig;
import de.felixhertweck.otproxy.config.ValueRangeConfig;
import de.felixhertweck.otproxy.core.pipeline.RequestPipeline;
import de.felixhertweck.otproxy.core.rules.RuleEngine;
import de.felixhertweck.otproxy.protocol.modbus.ModbusTcpListener;
import de.felixhertweck.otproxy.protocol.modbus.ModbusTcpUpstream;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class ModbusProxyIntegrationTest {

    private FakeModbusSlave slave;
    private ModbusTcpListener proxy;
    private int proxyPort;

    @BeforeAll
    void setUp() throws Exception {
        slave = new FakeModbusSlave();
        slave.start();

        proxyPort = findFreePort();
        ProxyConfig config = buildConfig(proxyPort, slave.getPort());

        RuleEngine ruleEngine = new RuleEngine(config);
        RequestPipeline pipeline = new RequestPipeline(ruleEngine, List.of());
        ModbusTcpUpstream upstream = new ModbusTcpUpstream("127.0.0.1", slave.getPort());
        proxy = new ModbusTcpListener("127.0.0.1", proxyPort, pipeline, upstream);

        Thread proxyThread =
                new Thread(
                        () -> {
                            try {
                                proxy.start();
                            } catch (IOException ignored) {
                            }
                        });
        proxyThread.setDaemon(true);
        proxyThread.start();

        Thread.sleep(300);
    }

    @AfterAll
    void tearDown() {
        if (proxy != null) proxy.stop();
        if (slave != null) slave.stop();
    }

    // --- Allowed writes ---

    @Test
    void pumpSwitch_on_allowed() throws Exception {
        assertThat(writeRegister(2, 1)).isTrue();
    }

    @Test
    void pumpSwitch_off_allowed() throws Exception {
        assertThat(writeRegister(2, 0)).isTrue();
    }

    @Test
    void inflowMode_on_allowed() throws Exception {
        assertThat(writeRegister(8, 1)).isTrue();
    }

    @Test
    void outflowValve_on_allowed() throws Exception {
        assertThat(writeRegister(5, 1)).isTrue();
    }

    // --- Blocked writes ---

    @Test
    void pumpSwitch_outOfRange_blocked() throws Exception {
        assertThat(writeRegister(2, 5)).isFalse();
    }

    @Test
    void tankLevel_readOnly_blocked() throws Exception {
        assertThat(writeRegister(0, 1000)).isFalse();
    }

    @Test
    void inflowRate_readOnly_blocked() throws Exception {
        assertThat(writeRegister(6, 10)).isFalse();
    }

    @Test
    void unknownRegister_defaultDeny_blocked() throws Exception {
        assertThat(writeRegister(99, 1)).isFalse();
    }

    // --- Disconnect ---

    @Test
    void emergencyStop_causesDisconnect() {
        assertThat(causesDisconnect(1, 1)).isTrue();
    }

    // --- Helpers ---

    private boolean writeRegister(int address, int value) throws IOException {
        try (Socket socket = new Socket("127.0.0.1", proxyPort)) {
            socket.setSoTimeout(2000);
            sendFc6(socket.getOutputStream(), address, value);
            return isSuccessResponse(socket.getInputStream());
        }
    }

    private boolean causesDisconnect(int address, int value) {
        try (Socket socket = new Socket("127.0.0.1", proxyPort)) {
            socket.setSoTimeout(2000);
            sendFc6(socket.getOutputStream(), address, value);
            return socket.getInputStream().read() == -1;
        } catch (SocketException e) {
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    /** Sends a Modbus TCP FC6 Write Single Register frame. */
    private void sendFc6(OutputStream out, int address, int value) throws IOException {
        byte[] frame = {
            0,
            1, // transaction id
            0,
            0, // protocol id
            0,
            6, // length (unit id + 5 pdu bytes)
            1, // unit id
            0x06, // function code: write single register
            (byte) (address >> 8),
            (byte) address,
            (byte) (value >> 8),
            (byte) value
        };
        out.write(frame);
        out.flush();
    }

    /**
     * Reads the MBAP header + function code byte and returns true if the response is a success (bit
     * 7 of FC not set), false if it is an exception response.
     */
    private boolean isSuccessResponse(InputStream in) throws IOException {
        DataInputStream dis = new DataInputStream(in);
        byte[] header = new byte[7]; // 6 MBAP bytes + unit id
        dis.readFully(header);
        int fc = dis.readUnsignedByte();
        return (fc & 0x80) == 0;
    }

    private static int findFreePort() throws IOException {
        try (ServerSocket s = new ServerSocket(0)) {
            return s.getLocalPort();
        }
    }

    // --- Config builder ---

    private static ProxyConfig buildConfig(int proxyPort, int slavePort) {
        ListenConfig listen = new ListenConfig();
        listen.setHost("127.0.0.1");
        listen.setPort(proxyPort);

        UpstreamConfig upstream = new UpstreamConfig();
        upstream.setHost("127.0.0.1");
        upstream.setPort(slavePort);

        ProxySection proxySection = new ProxySection();
        proxySection.setListen(listen);
        proxySection.setUpstream(upstream);

        RulesConfig rules = new RulesConfig();
        rules.setDefaultAction("DENY");
        rules.setRegisters(
                List.of(
                        register(0, false, null, "MODBUS_EXCEPTION"),
                        register(1, false, null, "DISCONNECT"),
                        register(2, true, range(0, 1), "MODBUS_EXCEPTION"),
                        register(5, true, range(0, 1), "MODBUS_EXCEPTION"),
                        register(6, false, null, "MODBUS_EXCEPTION"),
                        register(8, true, range(0, 1), "MODBUS_EXCEPTION")));

        ProxyConfig config = new ProxyConfig();
        config.setProxy(proxySection);
        config.setRules(rules);
        return config;
    }

    private static RegisterRuleConfig register(
            int address, boolean allowWrite, ValueRangeConfig range, String onViolation) {
        RegisterRuleConfig r = new RegisterRuleConfig();
        r.setAddress(address);
        r.setAllowWrite(allowWrite);
        r.setValueRange(range);
        r.setOnViolation(onViolation);
        return r;
    }

    private static ValueRangeConfig range(int min, int max) {
        ValueRangeConfig r = new ValueRangeConfig();
        r.setMin(min);
        r.setMax(max);
        return r;
    }

    // --- Fake Modbus slave ---

    /** Minimal Modbus TCP slave that echoes every request back as a successful response. */
    static class FakeModbusSlave {

        private ServerSocket serverSocket;
        private final ExecutorService executor = Executors.newCachedThreadPool();

        void start() throws IOException {
            serverSocket = new ServerSocket(0);
            executor.submit(
                    () -> {
                        while (!serverSocket.isClosed()) {
                            try {
                                Socket client = serverSocket.accept();
                                executor.submit(() -> handleClient(client));
                            } catch (IOException ignored) {
                            }
                        }
                    });
        }

        int getPort() {
            return serverSocket.getLocalPort();
        }

        void stop() {
            try {
                serverSocket.close();
            } catch (IOException ignored) {
            }
            executor.shutdownNow();
        }

        private void handleClient(Socket socket) {
            try (socket;
                    DataInputStream in = new DataInputStream(socket.getInputStream());
                    OutputStream out = socket.getOutputStream()) {
                while (!socket.isClosed()) {
                    byte[] mbap = new byte[6];
                    in.readFully(mbap);
                    int length = ((mbap[4] & 0xFF) << 8) | (mbap[5] & 0xFF);
                    byte[] rest = new byte[length];
                    in.readFully(rest);
                    // Echo back the complete frame as a success response
                    out.write(mbap);
                    out.write(rest);
                    out.flush();
                }
            } catch (IOException ignored) {
            }
        }
    }
}
