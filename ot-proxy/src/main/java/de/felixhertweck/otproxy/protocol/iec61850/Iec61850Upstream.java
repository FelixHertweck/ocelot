package de.felixhertweck.otproxy.protocol.iec61850;

import java.io.IOException;
import java.net.InetAddress;
import java.util.Locale;

import com.beanit.iec61850bean.BasicDataAttribute;
import com.beanit.iec61850bean.BdaBoolean;
import com.beanit.iec61850bean.ClientAssociation;
import com.beanit.iec61850bean.ClientSap;
import com.beanit.iec61850bean.Fc;
import com.beanit.iec61850bean.FcModelNode;
import com.beanit.iec61850bean.ModelNode;
import com.beanit.iec61850bean.ServerModel;
import com.beanit.iec61850bean.ServiceError;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * MMS client side of the IEC 61850 proxy: a single, long-lived association to the real upstream
 * IED.
 *
 * <p>Unlike {@code ModbusTcpUpstream} (which opens a socket per call), an MMS association is
 * stateful and expensive to establish, so we keep one open and serialize all service calls through
 * it. The retrieved {@link ServerModel} is the source of truth that the proxy mirrors to downstream
 * clients and against which control operations are forwarded.
 */
public class Iec61850Upstream {

    private static final Logger log = LoggerFactory.getLogger(Iec61850Upstream.class);

    private final String host;
    private final int port;

    private final Object lock = new Object();
    private ClientSap clientSap;
    private ClientAssociation association;
    private ServerModel model;

    public Iec61850Upstream(String host, int port) {
        this.host = host;
        this.port = port;
    }

    /**
     * Associates with the upstream IED and retrieves its data model (structure + initial values).
     */
    public void connect() throws IOException, ServiceError {
        synchronized (lock) {
            connectUnderLock();
            log.info("IEC 61850 upstream connected to {}:{}", host, port);
        }
    }

    private void connectUnderLock() throws IOException, ServiceError {
        clientSap = new ClientSap();
        association =
                clientSap.associate(
                        InetAddress.getByName(host), port, null, new NoOpClientEventListener());
        model = association.retrieveModel();
        association.getAllDataValues();
    }

    /** The mirrored upstream model. Never {@code null} once {@link #connect()} has succeeded. */
    public ServerModel getModel() {
        return model;
    }

    /** Refreshes all readable values from the IED into the mirrored model (best-effort). */
    public void refreshValues() {
        synchronized (lock) {
            if (association == null) return;
            try {
                association.getAllDataValues();
            } catch (IOException | ServiceError e) {
                log.warn("Upstream value poll failed: {} — reconnecting", e.getMessage());
                association.close();
                association = null;
                try {
                    connectUnderLock();
                    log.info("Reconnected to upstream IED at {}:{}", host, port);
                } catch (IOException | ServiceError re) {
                    log.warn(
                            "Reconnect to upstream failed, will retry next poll: {}",
                            re.getMessage());
                }
            }
        }
    }

    /**
     * Forwards a control command to the IED. {@code doRef} is the controllable data object (e.g.
     * {@code RelayIEDPROT/XCBR1.Pos}); the command is issued as a direct Operate, or Select +
     * Operate when the object's {@code ctlModel} is select-before-operate.
     *
     * @throws ServiceError if the IED rejects the command
     */
    public void forwardControl(String doRef, boolean ctlVal) throws IOException, ServiceError {
        synchronized (lock) {
            ModelNode ctlValNode = model.findModelNode(doRef + ".Oper.ctlVal", Fc.CO);
            if (!(ctlValNode instanceof BdaBoolean ctlValBda)) {
                throw new ServiceError(
                        ServiceError.INSTANCE_NOT_AVAILABLE,
                        "No boolean control value at " + doRef + ".Oper.ctlVal");
            }
            FcModelNode controlDo = (FcModelNode) model.findModelNode(doRef, Fc.CO);
            if (controlDo == null) {
                throw new ServiceError(
                        ServiceError.INSTANCE_NOT_AVAILABLE, "No controllable object at " + doRef);
            }

            ctlValBda.setValue(ctlVal);

            if (isSelectBeforeOperate(doRef)) {
                if (!association.select(controlDo)) {
                    throw new ServiceError(
                            ServiceError.CONTROL_MUST_BE_SELECTED, "Select rejected for " + doRef);
                }
            }
            association.operate(controlDo);
            log.info("Forwarded control {}.Oper.ctlVal={} to upstream", doRef, ctlVal);
        }
    }

    /** Reads {@code ctlModel} (FC=CF) and reports whether the object uses select-before-operate. */
    private boolean isSelectBeforeOperate(String doRef) {
        ModelNode ctlModel = model.findModelNode(doRef + ".ctlModel", Fc.CF);
        if (!(ctlModel instanceof BasicDataAttribute bda)) return false;
        String v = bda.getValueString();
        if (v == null) return false;
        v = v.toLowerCase(Locale.ROOT);
        // ctlModel ords: 2 = sbo-with-normal-security, 4 = sbo-with-enhanced-security.
        return v.contains("sbo") || v.equals("2") || v.equals("4");
    }

    public void close() {
        synchronized (lock) {
            if (association != null) {
                association.close();
                association = null;
            }
            log.info("IEC 61850 upstream closed.");
        }
    }
}
