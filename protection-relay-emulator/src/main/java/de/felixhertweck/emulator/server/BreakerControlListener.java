package de.felixhertweck.emulator.server;

import java.util.List;

import com.beanit.iec61850bean.BasicDataAttribute;
import com.beanit.iec61850bean.BdaBoolean;
import com.beanit.iec61850bean.ServerEventListener;
import com.beanit.iec61850bean.ServerSap;
import com.beanit.iec61850bean.ServiceError;
import de.felixhertweck.emulator.model.Iec61850References;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class BreakerControlListener implements ServerEventListener {

    private static final Logger logger = LoggerFactory.getLogger(BreakerControlListener.class);
    private final BreakerStateChanged callback;

    public BreakerControlListener(BreakerStateChanged callback) {
        this.callback = callback;
    }

    @Override
    public List<ServiceError> write(List<BasicDataAttribute> bdas) {
        logger.info("Received write request:");
        for (BasicDataAttribute bda : bdas) {
            logger.info(" - {} : {}", bda.getReference(), bda.getValueString());

            // Intercept writing to XCBR1 Pos.Oper.ctlVal (Control value for circuit breaker)
            if (Iec61850References.XCBR_POS_OPER_CTLVAL.equals(bda.getReference().toString())) {
                if (bda instanceof BdaBoolean bdaBoolean) {
                    boolean command = bdaBoolean.getValue();
                    logger.info(
                            "Received command to {} the circuit breaker.",
                            command ? "CLOSE" : "OPEN");
                    callback.onBreakerCommand(command);
                }
            }
        }
        return null; // returning null indicates success
    }

    @Override
    public void serverStoppedListening(ServerSap serverSap) {
        logger.info("Server stopped listening.");
    }

    @FunctionalInterface
    public interface BreakerStateChanged {
        void onBreakerCommand(boolean close);
    }
}
