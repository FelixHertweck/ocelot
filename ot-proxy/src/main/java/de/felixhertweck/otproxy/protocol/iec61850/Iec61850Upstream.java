package de.felixhertweck.otproxy.protocol.iec61850;

import java.io.IOException;
import java.net.InetAddress;

import com.beanit.iec61850bean.ClientAssociation;
import com.beanit.iec61850bean.ClientSap;
import com.beanit.iec61850bean.ServerModel;
import com.beanit.iec61850bean.ServiceError;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Iec61850Upstream {

    private static final Logger log = LoggerFactory.getLogger(Iec61850Upstream.class);

    private final String host;
    private final int port;
    private ClientSap clientSap;
    private ClientAssociation clientAssociation;
    private ServerModel serverModel;

    public Iec61850Upstream(String host, int port) {
        this.host = host;
        this.port = port;
        this.clientSap = new ClientSap();
    }

    public synchronized void connect() throws IOException {
        if (clientAssociation != null && clientAssociation.isOpen()) {
            return;
        }

        log.info("Connecting to IEC 61850 upstream at {}:{}", host, port);
        try {
            clientAssociation = clientSap.associate(InetAddress.getByName(host), port, null, null);
            log.info("Retrieving server model from upstream...");
            serverModel = clientAssociation.retrieveModel();
            log.info("Successfully retrieved server model from upstream");
        } catch (ServiceError e) {
            throw new IOException("Failed to connect to upstream: " + e.getMessage(), e);
        }
    }

    public ServerModel getServerModel() {
        return serverModel;
    }

    public ClientAssociation getClientAssociation() {
        return clientAssociation;
    }

    public synchronized void disconnect() {
        if (clientAssociation != null && clientAssociation.isOpen()) {
            clientAssociation.disconnect();
        }
    }
}
