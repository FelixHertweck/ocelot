package de.felixhertweck.inverter;

import static org.assertj.core.api.Assertions.assertThat;

import com.ghgande.j2mod.modbus.facade.ModbusTCPMaster;
import com.ghgande.j2mod.modbus.procimg.Register;
import com.ghgande.j2mod.modbus.procimg.SimpleRegister;
import java.io.IOException;
import java.net.Socket;
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

        // Poll until the emulator port is reachable (max 5 seconds)
        long deadline = System.currentTimeMillis() + 5000;
        while (System.currentTimeMillis() < deadline) {
            try (Socket socket = new Socket("127.0.0.1", TEST_PORT)) {
                break;
            } catch (IOException ignored) {
                Thread.sleep(100);
            }
        }
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
        master.writeSingleRegister(1, 39999, new SimpleRegister(1));

        // 3. Poll until E-Stop takes effect (max 3 seconds)
        long deadline = System.currentTimeMillis() + 3000;
        do {
            healthRegs = master.readMultipleRegisters(1, 30200, 2);
            health = (healthRegs[0].getValue() << 16) | healthRegs[1].getValue();
            if (health != 35) Thread.sleep(100);
        } while (health != 35 && System.currentTimeMillis() < deadline);
        assertThat(health).isEqualTo(35); // Fault

        Register[] powerRegs = master.readMultipleRegisters(1, 30202, 2);
        int power = (powerRegs[0].getValue() << 16) | powerRegs[1].getValue();
        assertThat(power).isEqualTo(0); // Power is 0

        master.disconnect();
    }
}
