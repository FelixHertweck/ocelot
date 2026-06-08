package com.example.emulator;

import com.beanit.iec61850bean.BdaFloat32;
import com.beanit.iec61850bean.FcModelNode;
import com.beanit.iec61850bean.ServerModel;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

class ProtectionRelayEmulatorTest {

    private ProtectionRelayEmulator emulator;

    @BeforeEach
    void setUp() throws Exception {
        // Use a different port for testing to avoid conflicts
        emulator = new ProtectionRelayEmulator(10103);
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
        FcModelNode hzNode = (FcModelNode) model.findModelNode("RelayIEDPROT/MMXU1.Hz.mag.f", com.beanit.iec61850bean.Fc.MX);
        assertNotNull(hzNode, "Hz node should exist");

        // Verify XCBR exists
        FcModelNode posNode = (FcModelNode) model.findModelNode("RelayIEDPROT/XCBR1.Pos.stVal", com.beanit.iec61850bean.Fc.ST);
        assertNotNull(posNode, "XCBR Pos stVal node should exist");
    }

    @Test
    void testDynamicSimulationUpdatesMeasurements() throws InterruptedException {
        ServerModel model = emulator.getServerModel();
        FcModelNode totWNode = (FcModelNode) model.findModelNode("RelayIEDPROT/MMXU1.TotW.mag.f", com.beanit.iec61850bean.Fc.MX);
        assertNotNull(totWNode);

        BdaFloat32 bda = (BdaFloat32) totWNode;
        Float initialValue = bda.getFloat();

        // Wait for scheduler to run
        Thread.sleep(3500);

        Float newValue = bda.getFloat();
        assertNotNull(newValue);

        // Since we initialize as null/0, after 2s it should be around 1000.
        assertTrue(newValue > 0.0f, "Value should have been updated by dynamic simulation");
    }
}
