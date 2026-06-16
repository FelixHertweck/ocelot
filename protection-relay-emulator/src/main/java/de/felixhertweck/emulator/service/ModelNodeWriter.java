package de.felixhertweck.emulator.service;

import java.util.Collections;

import com.beanit.iec61850bean.BasicDataAttribute;
import com.beanit.iec61850bean.BdaBitString;
import com.beanit.iec61850bean.BdaBoolean;
import com.beanit.iec61850bean.BdaFloat32;
import com.beanit.iec61850bean.Fc;
import com.beanit.iec61850bean.FcModelNode;
import com.beanit.iec61850bean.ServerModel;
import com.beanit.iec61850bean.ServerSap;
import de.felixhertweck.emulator.model.BreakerState;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ModelNodeWriter {

    private static final Logger logger = LoggerFactory.getLogger(ModelNodeWriter.class);
    private final ServerModel model;
    private final ServerSap sap;

    public ModelNodeWriter(ServerModel model, ServerSap sap) {
        this.model = model;
        this.sap = sap;
    }

    public void writeFloat32(String reference, float value) {
        FcModelNode node = (FcModelNode) model.findModelNode(reference, Fc.MX);
        if (node instanceof BdaFloat32 bda) {
            bda.setFloat(value);
            publish(bda);
        } else {
            logger.warn("Node not found or wrong type for float32: {}", reference);
        }
    }

    public void writeBoolean(String reference, Fc fc, boolean value) {
        FcModelNode node = (FcModelNode) model.findModelNode(reference, fc);
        if (node instanceof BdaBoolean bda) {
            bda.setValue(value);
            publish(bda);
        } else {
            logger.warn("Node not found or wrong type for boolean: {}", reference);
        }
    }

    public void writeBreakerState(String reference, BreakerState state) {
        FcModelNode node = (FcModelNode) model.findModelNode(reference, Fc.ST);
        if (node instanceof BdaBitString bda) {
            bda.setValue(state.getDbpos());
            publish(bda);
            logger.info("Circuit breaker state updated to: {}", state);
        } else {
            logger.warn("Node not found or wrong type for breaker state: {}", reference);
        }
    }

    public void writeBreakerState(String reference, boolean closed) {
        writeBreakerState(reference, closed ? BreakerState.CLOSED : BreakerState.OPEN);
    }

    public float readFloat32(String reference) {
        FcModelNode node = (FcModelNode) model.findModelNode(reference, Fc.MX);
        if (node instanceof BdaFloat32 bda) {
            return bda.getFloat();
        }
        logger.warn("Node not found or wrong type for float32 read: {}", reference);
        return Float.NaN;
    }

    public Boolean readBoolean(String reference, Fc fc) {
        FcModelNode node = (FcModelNode) model.findModelNode(reference, fc);
        if (node instanceof BdaBoolean bda) {
            return bda.getValue();
        }
        logger.warn("Node not found or wrong type for boolean read: {}", reference);
        return null;
    }

    private void publish(BasicDataAttribute bda) {
        try {
            sap.setValues(Collections.singletonList(bda));
        } catch (Exception e) {
            logger.error("Failed to publish value for {}", bda.getReference(), e);
        }
    }
}
