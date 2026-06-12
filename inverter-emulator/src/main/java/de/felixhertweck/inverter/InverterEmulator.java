package de.felixhertweck.inverter;

import com.ghgande.j2mod.modbus.procimg.InputRegister;
import com.ghgande.j2mod.modbus.procimg.SimpleInputRegister;
import com.ghgande.j2mod.modbus.procimg.SimpleProcessImage;
import com.ghgande.j2mod.modbus.procimg.SimpleRegister;
import com.ghgande.j2mod.modbus.slave.ModbusSlave;
import com.ghgande.j2mod.modbus.slave.ModbusSlaveFactory;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class InverterEmulator {

    private static final Logger log = LoggerFactory.getLogger(InverterEmulator.class);

    private static int PORT = 502;
    private static final int HEALTH_ADDR = 30200; // Offset for 30201
    private static final int POWER_ADDR = 30774; // Offset for 30775 (GridMs.TotW, S32)
    private static final int YIELD_ADDR = 30516; // Offset for 30517
    private static final int ESTOP_ADDR = 39999; // Offset for 40000

    private static final int HEALTH_OK = 307;
    private static final int HEALTH_FAULT = 35;

    private static SimpleProcessImage spi;
    private static long dailyYieldWh = 0;
    private static int basePower = 15000;

    // Set once the simulation thread starts; used to skip logging for internal register accesses.
    private static volatile Thread simulationThread;

    public static void main(String[] args) {
        if (args.length > 0) {
            PORT = Integer.parseInt(args[0]);
        }
        try {
            spi =
                    new SimpleProcessImage() {
                        @Override
                        public synchronized InputRegister getInputRegister(int ref) {
                            // Only log reads originating from external Modbus clients, not from the
                            // internal simulation loop.
                            if (simulationThread != null
                                    && Thread.currentThread() != simulationThread) {
                                if (ref == HEALTH_ADDR) {
                                    log.info(
                                            "Modbus FC04 read: health status (register {})",
                                            ref + 1);
                                } else if (ref == POWER_ADDR) {
                                    log.info(
                                            "Modbus FC04 read: AC active power (register {})",
                                            ref + 1);
                                } else if (ref == YIELD_ADDR) {
                                    log.info(
                                            "Modbus FC04 read: daily energy yield (register {})",
                                            ref + 1);
                                }
                            }
                            return super.getInputRegister(ref);
                        }
                    };

            // Input registers (FC04) for 3xxxx telemetry addresses (read-only via Modbus)
            for (int i = 0; i <= POWER_ADDR + 1; i++) {
                spi.addInputRegister(new SimpleInputRegister(0));
            }

            // Holding registers (FC03/FC16) for 4xxxx control addresses
            for (int i = 0; i <= ESTOP_ADDR; i++) {
                spi.addRegister(new SimpleRegister(0));
            }

            // Initial values
            writeInputU32(HEALTH_ADDR, HEALTH_OK);
            writeInputU32(POWER_ADDR, basePower);
            writeInputU64(YIELD_ADDR, dailyYieldWh);
            spi.getRegister(ESTOP_ADDR).setValue(0);

            // Create and start Modbus TCP Slave
            ModbusSlave slave = ModbusSlaveFactory.createTCPSlave(PORT, 5); // pool size 5
            slave.addProcessImage(1, spi); // default Unit ID 1
            slave.open();

            log.info("Inverter emulator started on port {}", PORT);

            // Simulation Engine
            ScheduledExecutorService executor = Executors.newSingleThreadScheduledExecutor();
            executor.scheduleAtFixedRate(
                    () -> {
                        if (simulationThread == null) {
                            simulationThread = Thread.currentThread();
                        }
                        simulationLoop();
                    },
                    1,
                    1,
                    TimeUnit.SECONDS);

            // Block until JVM shutdown
            CountDownLatch latch = new CountDownLatch(1);
            Runtime.getRuntime().addShutdownHook(new Thread(latch::countDown));
            latch.await();
            executor.shutdown();

        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        } catch (Exception e) {
            log.error("Fatal error starting inverter emulator", e);
            System.exit(1);
        }
    }

    private static void simulationLoop() {
        try {
            int estopValue = spi.getRegister(ESTOP_ADDR).getValue();
            if (estopValue == 1) {
                // Emergency Stop Triggered
                int currentHealth = readInputU32(HEALTH_ADDR);
                if (currentHealth != HEALTH_FAULT) {
                    log.warn(
                            "EMERGENCY STOP triggered via Modbus write to register {} —"
                                    + " shutting down inverter",
                            ESTOP_ADDR + 1);
                    writeInputU32(HEALTH_ADDR, HEALTH_FAULT);
                    writeInputU32(POWER_ADDR, 0);
                    log.info(
                            "Emergency stop confirmed: power={}W, health=FAULT({})",
                            readInputU32(POWER_ADDR),
                            HEALTH_FAULT);
                }
            } else {
                // Normal Operation
                int currentHealth = readInputU32(HEALTH_ADDR);
                if (currentHealth == HEALTH_OK) {
                    // Fluctuate power
                    int fluctuation = (int) (Math.random() * 401) - 200; // -200 to +200
                    int currentPower = basePower + fluctuation;
                    writeInputU32(POWER_ADDR, currentPower);

                    // Power is in Watts. 1 hour = 3600 seconds.
                    // So per second, energy is Power / 3600 Watt-hours.
                    long addedYield = currentPower / 3600;
                    if (addedYield == 0) addedYield = 1;
                    dailyYieldWh += addedYield;
                    writeInputU64(YIELD_ADDR, dailyYieldWh);
                }
            }
        } catch (Exception e) {
            log.error("Simulation loop error", e);
        }
    }

    private static void writeInputU32(int offset, int value) {
        ((SimpleInputRegister) spi.getInputRegister(offset)).setValue((value >> 16) & 0xFFFF);
        ((SimpleInputRegister) spi.getInputRegister(offset + 1)).setValue(value & 0xFFFF);
    }

    private static int readInputU32(int offset) {
        int high = spi.getInputRegister(offset).getValue() & 0xFFFF;
        int low = spi.getInputRegister(offset + 1).getValue() & 0xFFFF;
        return (high << 16) | low;
    }

    private static void writeInputU64(int offset, long value) {
        ((SimpleInputRegister) spi.getInputRegister(offset))
                .setValue((int) ((value >> 48) & 0xFFFF));
        ((SimpleInputRegister) spi.getInputRegister(offset + 1))
                .setValue((int) ((value >> 32) & 0xFFFF));
        ((SimpleInputRegister) spi.getInputRegister(offset + 2))
                .setValue((int) ((value >> 16) & 0xFFFF));
        ((SimpleInputRegister) spi.getInputRegister(offset + 3)).setValue((int) (value & 0xFFFF));
    }
}
