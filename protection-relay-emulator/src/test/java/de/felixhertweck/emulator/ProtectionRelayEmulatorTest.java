package de.felixhertweck.emulator;

import java.net.ServerSocket;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import com.beanit.iec61850bean.BdaBitString;
import com.beanit.iec61850bean.BdaFloat32;
import com.beanit.iec61850bean.Fc;
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

        FcModelNode hzNode =
                (FcModelNode) model.findModelNode("RelayIEDPROT/MMXU1.Hz.mag.f", Fc.MX);
        assertNotNull(hzNode, "Hz node should exist");

        FcModelNode posNode =
                (FcModelNode) model.findModelNode("RelayIEDPROT/XCBR1.Pos.stVal", Fc.ST);
        assertNotNull(posNode, "XCBR Pos stVal node should exist");
    }

    @Test
    void testPtocNodesExist() {
        ServerModel model = emulator.getServerModel();

        FcModelNode strNode =
                (FcModelNode) model.findModelNode("RelayIEDPROT/PTOC1.Str.general", Fc.ST);
        assertNotNull(strNode, "PTOC Str.general node should exist");

        FcModelNode opNode =
                (FcModelNode) model.findModelNode("RelayIEDPROT/PTOC1.Op.general", Fc.ST);
        assertNotNull(opNode, "PTOC Op.general node should exist");
    }

    @Test
    void testBreakerCommandChangesState() {
        assertTrue(emulator.isBreakerClosed(), "Breaker should start closed");

        emulator.triggerBreakerCommand(false);
        assertFalse(emulator.isBreakerClosed(), "Breaker should be open after OPEN command");

        // Verify XCBR model node reflects the open state (0x40 = off/open in Dbpos encoding)
        FcModelNode posNode =
                (FcModelNode)
                        emulator.getServerModel()
                                .findModelNode("RelayIEDPROT/XCBR1.Pos.stVal", Fc.ST);
        assertNotNull(posNode);
        BdaBitString bda = (BdaBitString) posNode;
        assertTrue((bda.getValue()[0] & 0xFF) == 0x40, "XCBR Pos should reflect OPEN state (0x40)");

        emulator.triggerBreakerCommand(true);
        assertTrue(emulator.isBreakerClosed(), "Breaker should be closed after CLOSE command");

        // Verify closed state (0x80 = on/closed in Dbpos encoding)
        assertTrue(
                (bda.getValue()[0] & 0xFF) == 0x80, "XCBR Pos should reflect CLOSED state (0x80)");
    }

    @Test
    void testBreakerStateAffectsMmxuCurrents() throws InterruptedException {
        ServerModel model = emulator.getServerModel();
        BdaFloat32 totW = (BdaFloat32) model.findModelNode("RelayIEDPROT/MMXU1.TotW.mag.f", Fc.MX);
        assertNotNull(totW);

        // Wait for first measurement cycle with breaker closed (~1000 W)
        boolean seenHighValue = false;
        for (int i = 0; i < 50; i++) {
            Thread.sleep(100);
            Float v = totW.getFloat();
            if (v != null && v > 100f) {
                seenHighValue = true;
                break;
            }
        }
        assertTrue(seenHighValue, "TotW should exceed 100 W with breaker closed");

        emulator.triggerBreakerCommand(false);

        // Wait for next measurement cycle — multiplier drops to 0.001, so TotW ≈ 1 W
        boolean seenLowValue = false;
        for (int i = 0; i < 50; i++) {
            Thread.sleep(100);
            Float v = totW.getFloat();
            if (v != null && v < 5f) {
                seenLowValue = true;
                break;
            }
        }
        assertTrue(seenLowValue, "TotW should drop below 5 W with breaker open");
    }

    @Test
    void testDynamicSimulationUpdatesMeasurements() throws InterruptedException {
        ServerModel model = emulator.getServerModel();
        FcModelNode totWNode =
                (FcModelNode) model.findModelNode("RelayIEDPROT/MMXU1.TotW.mag.f", Fc.MX);
        assertNotNull(totWNode);

        BdaFloat32 bda = (BdaFloat32) totWNode;
        Float initialValue = bda.getFloat();
        float initial = initialValue == null ? 0.0f : initialValue;

        boolean valueChanged = false;
        for (int i = 0; i < 50; i++) {
            Thread.sleep(100);
            Float newValue = bda.getFloat();
            if (newValue != null && Math.abs(newValue - initial) > 1.0e-3f) {
                valueChanged = true;
                break;
            }
        }

        assertTrue(valueChanged, "Value should have been updated by dynamic simulation");
    }
}
