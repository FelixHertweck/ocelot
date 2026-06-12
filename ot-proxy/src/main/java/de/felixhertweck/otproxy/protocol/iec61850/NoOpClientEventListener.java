package de.felixhertweck.otproxy.protocol.iec61850;

import java.io.IOException;

import com.beanit.iec61850bean.ClientEventListener;
import com.beanit.iec61850bean.Report;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * No-op client event listener. {@code iec61850bean}'s {@code ClientAssociation} dereferences its
 * event listener (e.g. on {@code associationClosed}) without a null check, so a non-null instance
 * must always be supplied to {@code associate}. The proxy does not use unsolicited reports.
 */
public class NoOpClientEventListener implements ClientEventListener {

    private static final Logger log = LoggerFactory.getLogger(NoOpClientEventListener.class);

    @Override
    public void newReport(Report report) {
        // Reports are not used by the proxy.
    }

    @Override
    public void associationClosed(IOException e) {
        log.debug("Upstream association closed: {}", e == null ? "normal" : e.getMessage());
    }
}
