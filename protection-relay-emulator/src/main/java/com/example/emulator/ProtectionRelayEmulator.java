package com.example.emulator;

import com.beanit.iec61850bean.BasicDataAttribute;
import com.beanit.iec61850bean.BdaBoolean;
import com.beanit.iec61850bean.BdaFloat32;
import com.beanit.iec61850bean.BdaBitString;
import com.beanit.iec61850bean.FcModelNode;
import com.beanit.iec61850bean.SclParser;
import com.beanit.iec61850bean.ServerEventListener;
import com.beanit.iec61850bean.ServerModel;
import com.beanit.iec61850bean.ServerSap;
import com.beanit.iec61850bean.ServiceError;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Random;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.Collections;

public class ProtectionRelayEmulator {

    private static final Logger logger = LoggerFactory.getLogger(ProtectionRelayEmulator.class);
    private final int port;
    private ServerSap serverSap;
    private ServerModel serverModel;
    private ScheduledExecutorService scheduler;
    private final Random random = new Random();

    // Circuit Breaker State (XCBR)
    private boolean breakerClosed = true;

    public ProtectionRelayEmulator(int port) {
        this.port = port;
    }

    public void start() throws Exception {
        String icdFilePath = extractIcdFile();
        List<ServerModel> serverModels = SclParser.parse(icdFilePath);
        serverModel = serverModels.get(0);

        serverSap = new ServerSap(port, 0, null, serverModel, null);
        serverSap.startListening(new EmulatorDataListener());

        logger.info("Protection Relay Emulator started and listening on port " + port);

        startDynamicSimulation();
        updateBreakerPosition();
    }

    public void stop() {
        if (scheduler != null) {
            scheduler.shutdownNow();
        }
        if (serverSap != null) {
            serverSap.stop();
            logger.info("Protection Relay Emulator stopped.");
        }
    }

    public ServerModel getServerModel() {
        return serverModel;
    }

    private void startDynamicSimulation() {
        scheduler = Executors.newSingleThreadScheduledExecutor();
        scheduler.scheduleAtFixedRate(this::updateMeasurements, 1, 2, TimeUnit.SECONDS);
        logger.info("Dynamic measurement simulation started.");
    }

    private void updateMeasurements() {
        try {
            // If breaker is open, current and power should be near zero.
            float currentMultiplier = breakerClosed ? 1.0f : 0.001f;

            // Update MMXU Hz
            updateFloat32Value("RelayIEDPROT/MMXU1.Hz.mag.f", 50.0f + (random.nextFloat() - 0.5f) * 0.2f);

            // Update MMXU TotW
            updateFloat32Value("RelayIEDPROT/MMXU1.TotW.mag.f", (1000.0f + (random.nextFloat() - 0.5f) * 50.0f) * currentMultiplier);

            // Update MMXU Phase A Current (A.phsA.cVal.mag.f)
            updateFloat32Value("RelayIEDPROT/MMXU1.A.phsA.cVal.mag.f", (100.0f + (random.nextFloat() - 0.5f) * 5.0f) * currentMultiplier);
            updateFloat32Value("RelayIEDPROT/MMXU1.A.phsB.cVal.mag.f", (99.0f + (random.nextFloat() - 0.5f) * 5.0f) * currentMultiplier);
            updateFloat32Value("RelayIEDPROT/MMXU1.A.phsC.cVal.mag.f", (101.0f + (random.nextFloat() - 0.5f) * 5.0f) * currentMultiplier);

            // Update Voltage PPV (Voltage remains even if breaker is open)
            updateFloat32Value("RelayIEDPROT/MMXU1.PPV.phsAB.cVal.mag.f", 400.0f + (random.nextFloat() - 0.5f) * 10.0f);
            updateFloat32Value("RelayIEDPROT/MMXU1.PPV.phsBC.cVal.mag.f", 401.0f + (random.nextFloat() - 0.5f) * 10.0f);
            updateFloat32Value("RelayIEDPROT/MMXU1.PPV.phsCA.cVal.mag.f", 399.0f + (random.nextFloat() - 0.5f) * 10.0f);

        } catch (Exception e) {
            logger.error("Error updating measurements", e);
        }
    }

    private void updateFloat32Value(String reference, float value) {
        FcModelNode node = (FcModelNode) serverModel.findModelNode(reference, com.beanit.iec61850bean.Fc.MX);
        if (node != null && node instanceof BdaFloat32) {
            BdaFloat32 bda = (BdaFloat32) node;
            bda.setFloat(value);
            try {
                serverSap.setValues(Collections.singletonList(bda));
            } catch (Exception e) {
                // Ignore missing triggers during simulation
            }
        }
    }

    private void updateBreakerPosition() {
        FcModelNode node = (FcModelNode) serverModel.findModelNode("RelayIEDPROT/XCBR1.Pos.stVal", com.beanit.iec61850bean.Fc.ST);
        if (node != null) {
            // stVal for DPC is Dbpos, which maps to BdaBitString (2 bits) in iec61850bean
            // 00=intermediate, 01=off(open), 10=on(closed), 11=bad
            byte[] val = breakerClosed ? new byte[] { (byte) 0x80 } : new byte[] { 0x40 }; // 10000000 (0x80) -> on(10) | 01000000 (0x40) -> off(01)
            try {
                if (node instanceof BdaBitString) {
                    BdaBitString bda = (BdaBitString) node;
                    bda.setValue(val);
                    serverSap.setValues(Collections.singletonList(bda));
                }
            } catch (Exception e) {
                // ignore
            }
            logger.info("Circuit breaker state updated to: " + (breakerClosed ? "CLOSED" : "OPEN"));
        } else {
            logger.warn("Could not find XCBR Pos node");
        }
    }

    private String extractIcdFile() throws IOException {
        InputStream is = getClass().getResourceAsStream("/relay.icd");
        if (is == null) {
            throw new RuntimeException("Could not find relay.icd in classpath");
        }
        File tempFile = File.createTempFile("relay", ".icd");
        tempFile.deleteOnExit();
        try (FileOutputStream out = new FileOutputStream(tempFile)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = is.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
        }
        return tempFile.getAbsolutePath();
    }

    public static void main(String[] args) {
        try {
            int port = 10102; // Default IEC 61850 port is 102, but using 10102 to avoid requiring root
            String portEnv = System.getenv("IEC61850_PORT");
            if (portEnv != null) {
                port = Integer.parseInt(portEnv);
            }

            ProtectionRelayEmulator emulator = new ProtectionRelayEmulator(port);
            emulator.start();

            // Run until interrupted
            Runtime.getRuntime().addShutdownHook(new Thread(emulator::stop));

            while (true) {
                Thread.sleep(1000);
            }
        } catch (Exception e) {
            logger.error("Failed to start emulator", e);
        }
    }

    private class EmulatorDataListener implements ServerEventListener {
        @Override
        public List<ServiceError> write(List<BasicDataAttribute> bdas) {
            logger.info("Received write request:");
            for (BasicDataAttribute bda : bdas) {
                logger.info(" - " + bda.getReference() + " : " + bda.getValueString());

                // Intercept writing to XCBR1 Pos.Oper.ctlVal (Control value for circuit breaker)
                if (bda.getReference().toString().contains("XCBR1.Pos.Oper.ctlVal")) {
                    if (bda instanceof BdaBoolean) {
                        boolean command = ((BdaBoolean) bda).getValue();
                        logger.info("Received command to " + (command ? "CLOSE" : "OPEN") + " the circuit breaker.");
                        breakerClosed = command;
                        updateBreakerPosition();
                    }
                }
            }
            return null; // returning null indicates success
        }

        @Override
        public void serverStoppedListening(ServerSap serverSap) {
            logger.info("Server stopped listening.");
        }
    }
}
