package de.felixhertweck.emulator.simulation;

import java.util.Random;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;

import com.beanit.iec61850bean.Fc;
import de.felixhertweck.emulator.model.Iec61850References;
import de.felixhertweck.emulator.service.ModelNodeWriter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ProtectionSimulator implements Runnable {

    private static final Logger logger = LoggerFactory.getLogger(ProtectionSimulator.class);
    private final ModelNodeWriter writer;
    private final Consumer<Boolean> breakerCommandCallback;
    private final Random random = new Random();

    private final long initialDelay;
    private final long period;
    private final TimeUnit timeUnit;
    private final double faultProbability;
    private final long operateDelaySeconds;
    private final long clearDelaySeconds;

    private ScheduledExecutorService scheduler;

    public ProtectionSimulator(ModelNodeWriter writer, Consumer<Boolean> breakerCommandCallback) {
        this(writer, breakerCommandCallback, 15, 30, TimeUnit.SECONDS, 0.3, 1, 4);
    }

    public ProtectionSimulator(
            ModelNodeWriter writer,
            Consumer<Boolean> breakerCommandCallback,
            long initialDelay,
            long period,
            TimeUnit timeUnit,
            double faultProbability,
            long operateDelaySeconds,
            long clearDelaySeconds) {
        this.writer = writer;
        this.breakerCommandCallback = breakerCommandCallback;
        this.initialDelay = initialDelay;
        this.period = period;
        this.timeUnit = timeUnit;
        this.faultProbability = faultProbability;
        this.operateDelaySeconds = operateDelaySeconds;
        this.clearDelaySeconds = clearDelaySeconds;
    }

    public void scheduleOn(ScheduledExecutorService scheduler) {
        this.scheduler = scheduler;
        scheduler.scheduleAtFixedRate(this, initialDelay, period, timeUnit);
        logger.info("Protection fault simulation scheduled (every {} {}).", period, timeUnit);
    }

    @Override
    public void run() {
        try {
            if (random.nextDouble() < faultProbability) {
                simulateFault();
            }
        } catch (Exception e) {
            logger.error("Error in protection fault checker", e);
        }
    }

    /** Simulates a fault event (pickup -> trip after delay -> clear indicators after delay). */
    public void simulateFault() {
        if (scheduler == null) {
            logger.warn("Scheduler not set, cannot run asynchronous fault simulation steps");
            return;
        }

        logger.info("Simulating protection fault: PTOC pickup (Str=true)");
        writer.writeBoolean(Iec61850References.PTOC_STR_GENERAL, Fc.ST, true);

        scheduler.schedule(
                () -> {
                    logger.info("PTOC operated (Op=true): opening circuit breaker");
                    writer.writeBoolean(Iec61850References.PTOC_OP_GENERAL, Fc.ST, true);
                    breakerCommandCallback.accept(false);
                },
                operateDelaySeconds,
                TimeUnit.SECONDS);

        scheduler.schedule(
                () -> {
                    logger.info("Fault cleared: resetting PTOC indicators");
                    writer.writeBoolean(Iec61850References.PTOC_STR_GENERAL, Fc.ST, false);
                    writer.writeBoolean(Iec61850References.PTOC_OP_GENERAL, Fc.ST, false);
                },
                clearDelaySeconds,
                TimeUnit.SECONDS);
    }
}
