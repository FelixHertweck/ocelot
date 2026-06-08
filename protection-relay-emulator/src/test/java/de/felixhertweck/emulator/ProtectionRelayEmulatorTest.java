package de.felixhertweck.emulator;

import java.net.ServerSocket;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import com.beanit.iec61850bean.BdaFloat32;
import com.beanit.iec61850bean.FcModelNode;
import com.beanit.iec61850bean.ServerModel;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ProtectionRelayEmulatorTest {

    private ProtectionRelayEmulator emulator;

    private int findFreePort() throws Exception {
        try (ServerSocket socket = new ServerSocket(0)) {
            return socket.getLocalPort();
        }
    }

    @BeforeEach
    void setUp() throws Exception {
        // Use an ephemeral port for testing to avoid conflicts
        int port = findFreePort();
        emulator = new ProtectionRelayEmulator(port);
        emulator.start();
    }

    @AfterEach
    void tearDown() {
        if (emulator != null) {
            emulator.stop();
        }
    }

    @Test
    void testServerModelLoadedAndContainsNodes() {
        ServerModel model = emulator.getServerModel();
        assertNotNull(model, "ServerModel should not be null");

        // Verify MMXU exists
        FcModelNode hzNode =
                (FcModelNode)
                        model.findModelNode(
                                "RelayIEDPROT/MMXU1.Hz.mag.f", com.beanit.iec61850bean.Fc.MX);
        assertNotNull(hzNode, "Hz node should exist");

        // Verify XCBR exists
        FcModelNode posNode =
                (FcModelNode)
                        model.findModelNode(
                                "RelayIEDPROT/XCBR1.Pos.stVal", com.beanit.iec61850bean.Fc.ST);
        assertNotNull(posNode, "XCBR Pos stVal node should exist");
    }

    @Test
    void testDynamicSimulationUpdatesMeasurements() throws InterruptedException {
        ServerModel model = emulator.getServerModel();
        FcModelNode totWNode =
                (FcModelNode)
                        model.findModelNode(
                                "RelayIEDPROT/MMXU1.TotW.mag.f", com.beanit.iec61850bean.Fc.MX);
        assertNotNull(totWNode);

        BdaFloat32 bda = (BdaFloat32) totWNode;
        Float initialValue = bda.getFloat();

        // Sometimes it starts as null, so convert null to 0f for comparison
        float initial = initialValue == null ? 0.0f : initialValue;

        boolean valueChanged = false;

        // Wait for scheduler to run (up to 5 seconds max)
        for (int i = 0; i < 50; i++) {
            Thread.sleep(100);
            Float newValue = bda.getFloat();
            if (newValue != null && newValue != initial) {
                valueChanged = true;
                break;
            }
        }

        assertTrue(valueChanged, "Value should have been updated by dynamic simulation");
    }
}
