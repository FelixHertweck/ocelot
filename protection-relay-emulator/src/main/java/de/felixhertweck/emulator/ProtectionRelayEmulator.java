package de.felixhertweck.emulator;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.atomic.AtomicBoolean;

import com.beanit.iec61850bean.BdaInt8;
import com.beanit.iec61850bean.Fc;
import com.beanit.iec61850bean.FcModelNode;
import com.beanit.iec61850bean.SclParser;
import com.beanit.iec61850bean.ServerModel;
import com.beanit.iec61850bean.ServerSap;
import de.felixhertweck.emulator.model.Iec61850References;
import de.felixhertweck.emulator.server.BreakerControlListener;
import de.felixhertweck.emulator.server.ResetHttpServer;
import de.felixhertweck.emulator.service.IcdFileLoader;
import de.felixhertweck.emulator.service.ModelNodeWriter;
import de.felixhertweck.emulator.simulation.MeasurementGenerator;
import de.felixhertweck.emulator.simulation.ProtectionSimulator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ProtectionRelayEmulator {

    private static final Logger logger = LoggerFactory.getLogger(ProtectionRelayEmulator.class);

    private final int port;
    private final int restPort;
    private final IcdFileLoader icdLoader = new IcdFileLoader();
    private final AtomicBoolean breakerClosed = new AtomicBoolean(true);

    private ServerSap serverSap;
    private ServerModel serverModel;
    private ModelNodeWriter writer;
    private ScheduledExecutorService scheduler;
    private MeasurementGenerator measurements;
    private ProtectionSimulator protection;
    private ResetHttpServer resetHttpServer;

    public ProtectionRelayEmulator(int port, int restPort) {
        this.port = port;
        this.restPort = restPort;
    }

    public void start() throws Exception {
        String icdPath = icdLoader.extractToTemp();
        serverModel = SclParser.parse(icdPath).get(0);

        initCtlModel();

        serverSap = new ServerSap(port, 0, null, serverModel, null);
        writer = new ModelNodeWriter(serverModel, serverSap);

        BreakerControlListener listener = new BreakerControlListener(this::onBreakerCommand);
        serverSap.startListening(listener);

        logger.info("Protection Relay Emulator started and listening on port {}", port);

        resetHttpServer = new ResetHttpServer(restPort, this::reset, this::getStatusJson);
        resetHttpServer.start();

        // Publish the initial breaker position
        publishInitialBreakerState();

        // Start dynamic simulations
        scheduler = Executors.newScheduledThreadPool(2);
        measurements = new MeasurementGenerator(writer, breakerClosed::get);
        protection = new ProtectionSimulator(writer);

        measurements.scheduleOn(scheduler);
        protection.scheduleOn(scheduler);
    }

    public void stop() {
        if (scheduler != null) {
            scheduler.shutdownNow();
        }
        if (resetHttpServer != null) {
            resetHttpServer.stop();
        }
        if (serverSap != null) {
            serverSap.stop();
            logger.info("Protection Relay Emulator stopped.");
        }
    }

    String getStatusJson() {
        boolean closed = breakerClosed.get();
        boolean ptocStart = writer.readBoolean(Iec61850References.PTOC_STR_GENERAL, Fc.ST);
        boolean ptocOperate = writer.readBoolean(Iec61850References.PTOC_OP_GENERAL, Fc.ST);
        float hz = writer.readFloat32(Iec61850References.MMXU_HZ_MAG_F);
        float totW = writer.readFloat32(Iec61850References.MMXU_TOTW_MAG_F);
        float iA = writer.readFloat32(Iec61850References.MMXU_A_PHSA_MAG_F);
        float iB = writer.readFloat32(Iec61850References.MMXU_A_PHSB_MAG_F);
        float iC = writer.readFloat32(Iec61850References.MMXU_A_PHSC_MAG_F);
        float uAB = writer.readFloat32(Iec61850References.MMXU_PPV_PHSAB_MAG_F);
        float uBC = writer.readFloat32(Iec61850References.MMXU_PPV_PHSBC_MAG_F);
        float uCA = writer.readFloat32(Iec61850References.MMXU_PPV_PHSCA_MAG_F);
        return "{"
                + "\"breakerClosed\":"
                + closed
                + ","
                + "\"ptocStart\":"
                + ptocStart
                + ","
                + "\"ptocOperate\":"
                + ptocOperate
                + ","
                + "\"frequencyHz\":"
                + hz
                + ","
                + "\"totalPowerW\":"
                + totW
                + ","
                + "\"currentA\":{"
                + "\"phsA\":"
                + iA
                + ","
                + "\"phsB\":"
                + iB
                + ","
                + "\"phsC\":"
                + iC
                + "},"
                + "\"voltageV\":{"
                + "\"phsAB\":"
                + uAB
                + ","
                + "\"phsBC\":"
                + uBC
                + ","
                + "\"phsCA\":"
                + uCA
                + "}"
                + "}";
    }

    void reset() {
        breakerClosed.set(true);
        writer.writeBreakerState(Iec61850References.XCBR_POS_STVAL, true);
        writer.writeBoolean(Iec61850References.PTOC_STR_GENERAL, Fc.ST, false);
        writer.writeBoolean(Iec61850References.PTOC_OP_GENERAL, Fc.ST, false);
        logger.info("Emulator state reset: circuit breaker closed, PTOC indicators cleared.");
    }

    public ServerModel getServerModel() {
        return serverModel;
    }

    /** Returns the current logical state of the circuit breaker. Package-private for tests. */
    boolean isBreakerClosed() {
        return breakerClosed.get();
    }

    /**
     * Applies a breaker open/close command and updates the XCBR model node. Package-private for
     * tests.
     */
    void triggerBreakerCommand(boolean close) {
        onBreakerCommand(close);
    }

    private void initCtlModel() {
        FcModelNode node =
                (FcModelNode)
                        serverModel.findModelNode(Iec61850References.XCBR_POS_CTL_MODEL, Fc.CF);
        if (node instanceof BdaInt8 bda) {
            bda.setValue((byte) 1); // 1 = direct-with-normal-security
        } else {
            logger.warn(
                    "Could not initialize ctlModel for XCBR1.Pos — node not found or wrong type");
        }
    }

    private void onBreakerCommand(boolean close) {
        breakerClosed.set(close);
        writer.writeBreakerState(Iec61850References.XCBR_POS_STVAL, close);
    }

    private void publishInitialBreakerState() {
        writer.writeBreakerState(Iec61850References.XCBR_POS_STVAL, breakerClosed.get());
    }

    public static void main(String[] args) {
        try {
            int port = 10102;
            String portEnv = System.getenv("IEC61850_PORT");
            if (portEnv != null) {
                port = Integer.parseInt(portEnv);
            }

            int restPort = 8080;
            String restPortEnv = System.getenv("REST_PORT");
            if (restPortEnv != null) {
                restPort = Integer.parseInt(restPortEnv);
            }

            ProtectionRelayEmulator emulator = new ProtectionRelayEmulator(port, restPort);
            emulator.start();

            Runtime.getRuntime().addShutdownHook(new Thread(emulator::stop));

            // Block main thread until interrupted
            try {
                Thread.currentThread().join();
            } catch (InterruptedException e) {
                logger.info("Main thread interrupted, shutting down...");
            }
        } catch (Exception e) {
            logger.error("Failed to start emulator", e);
        }
    }
}
