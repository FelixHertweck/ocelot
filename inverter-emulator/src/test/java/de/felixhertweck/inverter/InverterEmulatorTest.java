package de.felixhertweck.inverter;

import static org.assertj.core.api.Assertions.assertThat;

import com.ghgande.j2mod.modbus.facade.ModbusTCPMaster;
import com.ghgande.j2mod.modbus.procimg.Register;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

public class InverterEmulatorTest {

    private static Thread emulatorThread;
    private static final int TEST_PORT = 10502; // Using unprivileged port

    @BeforeAll
    public static void setup() throws Exception {
        emulatorThread =
                new Thread(
                        () -> {
                            InverterEmulator.main(new String[] {String.valueOf(TEST_PORT)});
                        });
        emulatorThread.setDaemon(true);
        emulatorThread.start();

        // Wait for emulator to start up
        Thread.sleep(2000);
    }

    @AfterAll
    public static void teardown() {
        emulatorThread.interrupt();
    }

    @Test
    public void testEmergencyStopLogic() throws Exception {
        ModbusTCPMaster master = new ModbusTCPMaster("127.0.0.1", TEST_PORT);
        master.connect();

        // 1. Check initial state
        Register[] healthRegs = master.readMultipleRegisters(1, 30200, 2);
        int health = (healthRegs[0].getValue() << 16) | healthRegs[1].getValue();
        assertThat(health).isEqualTo(307); // Ok

        // 2. Trigger E-Stop
        Register estopReg =
                com.ghgande.j2mod.modbus.procimg.SimpleRegister.class
                        .getConstructor(int.class)
                        .newInstance(1);
        master.writeSingleRegister(1, 39999, estopReg);

        // Wait for logic to trigger
        Thread.sleep(1500);

        // 3. Verify E-Stop state
        healthRegs = master.readMultipleRegisters(1, 30200, 2);
        health = (healthRegs[0].getValue() << 16) | healthRegs[1].getValue();
        assertThat(health).isEqualTo(35); // Fault

        Register[] powerRegs = master.readMultipleRegisters(1, 30202, 2);
        int power = (powerRegs[0].getValue() << 16) | powerRegs[1].getValue();
        assertThat(power).isEqualTo(0); // Power is 0

        master.disconnect();
    }
}
