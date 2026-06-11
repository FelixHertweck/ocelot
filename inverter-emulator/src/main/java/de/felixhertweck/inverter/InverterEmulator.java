package de.felixhertweck.inverter;

import com.ghgande.j2mod.modbus.procimg.SimpleProcessImage;
import com.ghgande.j2mod.modbus.procimg.SimpleRegister;
import com.ghgande.j2mod.modbus.slave.ModbusSlave;
import com.ghgande.j2mod.modbus.slave.ModbusSlaveFactory;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class InverterEmulator {

    private static int PORT = 502;
    private static final int HEALTH_ADDR = 30200; // Offset for 30201
    private static final int POWER_ADDR = 30202; // Offset for 30203
    private static final int YIELD_ADDR = 30516; // Offset for 30517
    private static final int ESTOP_ADDR = 39999; // Offset for 40000

    private static final int HEALTH_OK = 307;
    private static final int HEALTH_FAULT = 35;

    private static SimpleProcessImage spi;
    private static long dailyYieldWh = 0;
    private static int basePower = 15000;

    public static void main(String[] args) {
        if (args.length > 0) {
            PORT = Integer.parseInt(args[0]);
        }
        try {
            spi = new SimpleProcessImage();

            // Add registers up to 40000
            for (int i = 0; i <= 40000; i++) {
                spi.addRegister(new SimpleRegister(0));
            }

            // Initial values
            writeU32(HEALTH_ADDR, HEALTH_OK);
            writeU32(POWER_ADDR, basePower);
            writeU64(YIELD_ADDR, dailyYieldWh);
            spi.getRegister(ESTOP_ADDR).setValue(0);

            // Create and start Modbus TCP Slave
            ModbusSlave slave = ModbusSlaveFactory.createTCPSlave(PORT, 5); // pool size 5
            slave.addProcessImage(1, spi); // default Unit ID 1
            slave.open();

            System.out.println("Inverter Emulator started on port " + PORT);

            // Simulation Engine
            ScheduledExecutorService executor = Executors.newSingleThreadScheduledExecutor();
            executor.scheduleAtFixedRate(InverterEmulator::simulationLoop, 1, 1, TimeUnit.SECONDS);

            // Block until JVM shutdown
            CountDownLatch latch = new CountDownLatch(1);
            Runtime.getRuntime().addShutdownHook(new Thread(latch::countDown));
            latch.await();
            executor.shutdown();

        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
    }

    private static void simulationLoop() {
        try {
            int estopValue = spi.getRegister(ESTOP_ADDR).getValue();
            if (estopValue == 1) {
                // Emergency Stop Triggered
                int currentHealth = readU32(HEALTH_ADDR);
                if (currentHealth != HEALTH_FAULT) {
                    System.out.println("EMERGENCY STOP TRIGGERED VIA MODBUS");
                    writeU32(HEALTH_ADDR, HEALTH_FAULT);
                    writeU32(POWER_ADDR, 0);
                }
            } else {
                // Normal Operation
                int currentHealth = readU32(HEALTH_ADDR);
                if (currentHealth == HEALTH_OK) {
                    // Fluctuate power
                    int fluctuation = (int) (Math.random() * 401) - 200; // -200 to +200
                    int currentPower = basePower + fluctuation;
                    writeU32(POWER_ADDR, currentPower);

                    // Increment yield
                    // Power is in Watts. 1 hour = 3600 seconds.
                    // So per second, energy is Power / 3600 Watt-hours.
                    long addedYield = currentPower / 3600;
                    if (addedYield == 0) addedYield = 1;
                    dailyYieldWh += addedYield;
                    writeU64(YIELD_ADDR, dailyYieldWh);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void writeU32(int offset, int value) {
        spi.getRegister(offset).setValue((value >> 16) & 0xFFFF);
        spi.getRegister(offset + 1).setValue(value & 0xFFFF);
    }

    private static int readU32(int offset) {
        int high = spi.getRegister(offset).getValue() & 0xFFFF;
        int low = spi.getRegister(offset + 1).getValue() & 0xFFFF;
        return (high << 16) | low;
    }

    private static void writeU64(int offset, long value) {
        spi.getRegister(offset).setValue((int) ((value >> 48) & 0xFFFF));
        spi.getRegister(offset + 1).setValue((int) ((value >> 32) & 0xFFFF));
        spi.getRegister(offset + 2).setValue((int) ((value >> 16) & 0xFFFF));
        spi.getRegister(offset + 3).setValue((int) (value & 0xFFFF));
    }
}
