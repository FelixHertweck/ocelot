package de.felixhertweck.otproxy.protocol.iec61850;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.beanit.iec61850bean.BasicDataAttribute;
import com.beanit.iec61850bean.ServerEventListener;
import com.beanit.iec61850bean.ServerSap;
import com.beanit.iec61850bean.ServiceError;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.WriteRequest;
import de.felixhertweck.otproxy.core.pipeline.RequestPipeline;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Intercepts downstream writes/control operations on the proxy's MMS server and enforces the safety
 * rules before forwarding allowed commands to the upstream IED.
 *
 * <p>The {@code iec61850bean} server invokes {@link #write(List)} for {@code setDataValues},
 * data-set writes and control Operate. Each control attribute ({@code ...Oper.ctlVal}) is evaluated
 * by the shared rule pipeline. Allowed commands are forwarded to the IED via {@link
 * Iec61850Upstream}; denied ones yield a non-null {@link ServiceError} at the matching index.
 * Unlike Modbus, IEC 61850 has no per-request silent-drop or disconnect, so every deny action
 * collapses to "return a ServiceError".
 */
public class RuleEnforcingServerListener implements ServerEventListener {

    private static final Logger log = LoggerFactory.getLogger(RuleEnforcingServerListener.class);

    private final RequestPipeline pipeline;
    private final Iec61850Upstream upstream;
    private final Iec61850RequestAdapter adapter = new Iec61850RequestAdapter();

    public RuleEnforcingServerListener(RequestPipeline pipeline, Iec61850Upstream upstream) {
        this.pipeline = pipeline;
        this.upstream = upstream;
    }

    @Override
    public List<ServiceError> write(List<BasicDataAttribute> bdas) {
        List<ServiceError> results = new ArrayList<>(bdas.size());
        boolean anyError = false;
        for (BasicDataAttribute bda : bdas) {
            ServiceError error = evaluate(bda);
            results.add(error);
            anyError |= error != null;
        }
        // iec61850bean expects null (not a list of nulls) to signal "all writes succeeded";
        // a non-null list is only returned when at least one attribute was rejected.
        return anyError ? results : null;
    }

    /**
     * Returns {@code null} when the write is allowed (and forwarded), or a {@link ServiceError}.
     */
    private ServiceError evaluate(BasicDataAttribute bda) {
        Optional<WriteRequest> request = adapter.adapt(bda, "mms");
        if (request.isEmpty()) {
            // Not a recognised control write — forwarding non-control writes is out of scope; deny.
            return new ServiceError(
                    ServiceError.ACCESS_VIOLATION,
                    "Write to " + bda.getReference() + " not allowed");
        }

        WriteRequest req = request.get();
        RuleResult result = pipeline.process(req);
        if (!result.allowed()) {
            log.warn("[BLOCKED] {} value={} reason={}", req.target(), req.value(), result.reason());
            return new ServiceError(
                    ServiceError.ACCESS_NOT_ALLOWED_IN_CURRENT_STATE, result.reason());
        }

        try {
            upstream.forwardControl(req.target(), req.value() != 0);
            return null;
        } catch (IOException | ServiceError e) {
            log.error("Upstream control forward failed for {}: {}", req.target(), e.getMessage());
            return new ServiceError(
                    ServiceError.FAILED_DUE_TO_COMMUNICATIONS_CONSTRAINT,
                    "Upstream forward failed: " + e.getMessage());
        }
    }

    @Override
    public void serverStoppedListening(ServerSap serverSap) {
        log.info("IEC 61850 proxy server stopped listening.");
    }
}
