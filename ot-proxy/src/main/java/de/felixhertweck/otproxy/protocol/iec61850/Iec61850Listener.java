package de.felixhertweck.otproxy.protocol.iec61850;

import java.io.IOException;
import java.net.InetAddress;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import com.beanit.iec61850bean.BasicDataAttribute;
import com.beanit.iec61850bean.FcModelNode;
import com.beanit.iec61850bean.ServerEventListener;
import com.beanit.iec61850bean.ServerModel;
import com.beanit.iec61850bean.ServerSap;
import com.beanit.iec61850bean.ServiceError;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.WriteRequest;
import de.felixhertweck.otproxy.core.pipeline.RequestPipeline;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Iec61850Listener implements ServerEventListener {

    private static final Logger log = LoggerFactory.getLogger(Iec61850Listener.class);

    private final String bindHost;
    private final int bindPort;
    private final RequestPipeline pipeline;
    private final Iec61850Upstream upstream;

    private ServerSap serverSap;
    private ServerModel proxyModel;
    private volatile boolean running = false;
    private final ExecutorService executor = Executors.newSingleThreadExecutor();

    public Iec61850Listener(
            String bindHost, int bindPort, RequestPipeline pipeline, Iec61850Upstream upstream) {
        this.bindHost = bindHost;
        this.bindPort = bindPort;
        this.pipeline = pipeline;
        this.upstream = upstream;
    }

    public void start() throws IOException {
        upstream.connect();
        ServerModel model = upstream.getServerModel();

        // Copy the upstream model so the proxy can serve clients independently
        proxyModel = model.copy();

        serverSap = new ServerSap(bindPort, 50, InetAddress.getByName(bindHost), proxyModel, null);
        running = true;

        serverSap.startListening(this);
        log.info("IEC 61850 proxy listening on {}:{}", bindHost, bindPort);

        // Start a background thread to poll data from upstream and update the local model
        executor.submit(this::pollUpstream);
    }

    private void pollUpstream() {
        while (running) {
            try {
                // To keep the proxy's server model up-to-date with the upstream,
                // we periodically read the entire model.
                upstream.getClientAssociation().getAllDataValues();
                // Copy the values from the upstream model to the proxy model
                List<BasicDataAttribute> proxyBdas = new ArrayList<>();
                for (com.beanit.iec61850bean.ModelNode upstreamNode : upstream.getServerModel()) {
                    for (BasicDataAttribute upstreamBda : upstreamNode.getBasicDataAttributes()) {
                        com.beanit.iec61850bean.ModelNode proxyNode =
                                serverSap
                                        .getModelCopy()
                                        .findModelNode(
                                                upstreamBda.getReference().toString(),
                                                upstreamBda.getFc());
                        if (proxyNode instanceof BasicDataAttribute) {
                            BasicDataAttribute proxyBda = (BasicDataAttribute) proxyNode;
                            proxyBda.setValueFrom(upstreamBda);
                            proxyBdas.add(proxyBda);
                        }
                    }
                }
                serverSap.setValues(proxyBdas);

                Thread.sleep(1000); // 1 second polling interval
            } catch (Exception e) {
                if (running) {
                    log.error("Error polling upstream: {}", e.getMessage());
                    try {
                        Thread.sleep(5000);
                        upstream.connect(); // Try to reconnect
                    } catch (InterruptedException | IOException ex) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }
    }

    public void stop() {
        running = false;
        if (serverSap != null) {
            serverSap.stop();
        }
        upstream.disconnect();
        executor.shutdownNow();
        log.info("IEC 61850 proxy stopped.");
    }

    @Override
    public List<ServiceError> write(List<BasicDataAttribute> bdas) {
        List<ServiceError> errors = new ArrayList<>();

        for (BasicDataAttribute bda : bdas) {
            String target = bda.getReference().toString();
            Object value = extractValue(bda);

            // "0.0.0.0" is used as a placeholder because ServerEventListener doesn't provide client
            // IP in IEC61850bean
            WriteRequest request =
                    new WriteRequest("iec61850", target, value, "0.0.0.0", Instant.now());

            RuleResult result = pipeline.process(request);

            if (result.allowed()) {
                // Forward the write to upstream
                try {
                    // Find the corresponding node in the upstream model
                    com.beanit.iec61850bean.ModelNode node =
                            upstream.getServerModel()
                                    .findModelNode(bda.getReference().toString(), bda.getFc());

                    if (node instanceof BasicDataAttribute) {
                        BasicDataAttribute upstreamBda = (BasicDataAttribute) node;
                        upstreamBda.setValueFrom(bda);

                        com.beanit.iec61850bean.ModelNode parent = upstreamBda.getParent();
                        while (parent != null && !(parent instanceof FcModelNode)) {
                            parent = parent.getParent();
                        }

                        if (parent instanceof FcModelNode) {
                            upstream.getClientAssociation().setDataValues((FcModelNode) parent);
                            errors.add(null); // Success
                        } else {
                            log.warn("Cannot find FcModelNode parent for {}", target);
                            errors.add(
                                    new ServiceError(
                                            ServiceError.FAILED_DUE_TO_COMMUNICATIONS_CONSTRAINT));
                        }
                    } else {
                        log.warn("Cannot find corresponding BasicDataAttribute for {}", target);
                        errors.add(
                                new ServiceError(
                                        ServiceError.FAILED_DUE_TO_COMMUNICATIONS_CONSTRAINT));
                    }
                } catch (Exception e) {
                    log.error(
                            "Error forwarding write to upstream for {}: {}",
                            target,
                            e.getMessage());
                    errors.add(
                            new ServiceError(ServiceError.FAILED_DUE_TO_COMMUNICATIONS_CONSTRAINT));
                }
            } else {
                log.warn("[BLOCKED] target={} value={} reason={}", target, value, result.reason());
                // Return access denied error
                errors.add(new ServiceError(ServiceError.ACCESS_VIOLATION));

                if (result.action()
                        == de.felixhertweck.otproxy.core.model.ViolationAction.DISCONNECT) {
                    // There is no direct way to close the specific connection in
                    // ServerEventListener in iec61850bean
                    log.warn(
                            "DISCONNECT action requested but not supported per-client in IEC61850"
                                    + " proxy.");
                }
            }
        }

        return errors;
    }

    @Override
    public void serverStoppedListening(ServerSap serverSap) {
        log.warn("IEC 61850 server stopped listening");
    }

    private Object extractValue(BasicDataAttribute bda) {
        // As a simplification we just return its string representation.
        // For value range checks, it would be better to extract the actual number.
        // If needed, we can cast bda to specific types (e.g. BdaInt16, BdaFloat32) and get the
        // value.
        // For now, returning string works with our generic rules.
        String val = bda.getValueString();
        try {
            return Double.parseDouble(val);
        } catch (NumberFormatException e) {
            return val;
        }
    }
}
