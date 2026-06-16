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
import de.felixhertweck.emulator.service.IcdFileLoader;
import de.felixhertweck.emulator.service.ModelNodeWriter;
import de.felixhertweck.emulator.simulation.MeasurementGenerator;
import de.felixhertweck.emulator.simulation.ProtectionSimulator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ProtectionRelayEmulator {

    private static final Logger logger = LoggerFactory.getLogger(ProtectionRelayEmulator.class);

    private final int port;
    private final IcdFileLoader icdLoader = new IcdFileLoader();
    private final AtomicBoolean breakerClosed = new AtomicBoolean(true);

    private ServerSap serverSap;
    private ServerModel serverModel;
    private ModelNodeWriter writer;
    private ScheduledExecutorService scheduler;
    private MeasurementGenerator measurements;
    private ProtectionSimulator protection;

    public ProtectionRelayEmulator(int port) {
        this.port = port;
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
        if (serverSap != null) {
            serverSap.stop();
            logger.info("Protection Relay Emulator stopped.");
        }
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

            ProtectionRelayEmulator emulator = new ProtectionRelayEmulator(port);
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
