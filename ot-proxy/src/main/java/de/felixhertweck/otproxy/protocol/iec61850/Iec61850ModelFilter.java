package de.felixhertweck.otproxy.protocol.iec61850;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import com.beanit.iec61850bean.LogicalDevice;
import com.beanit.iec61850bean.LogicalNode;
import com.beanit.iec61850bean.ModelNode;
import com.beanit.iec61850bean.ServerModel;
import de.felixhertweck.otproxy.config.Iec61850PointRuleConfig;
import de.felixhertweck.otproxy.config.RulesConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Builds the IEC 61850 model the proxy exposes downstream, enforcing the read allow-list.
 *
 * <p>{@code iec61850bean} has no read interception hook, so a "which reads are allowed" policy can
 * only be enforced by withholding objects from the served model. When {@code default_action: DENY},
 * the exposed model keeps only the Logical Nodes referenced by an {@code allow_read} object rule
 * (plus the mandatory system nodes LLN0/LPHD); everything else is absent and reads return
 * object-not-found. Enforcement is at Logical-Node granularity because that is the finest unit the
 * library's public model API lets us rebuild. On any failure the full mirror is exposed (fail-open
 * on reads — write/control rules are always enforced separately).
 */
public final class Iec61850ModelFilter {

    private static final Logger log = LoggerFactory.getLogger(Iec61850ModelFilter.class);

    private Iec61850ModelFilter() {}

    public static ServerModel buildExposedModel(ServerModel upstream, RulesConfig rules) {
        boolean denyByDefault = rules != null && "DENY".equalsIgnoreCase(rules.getDefaultAction());
        if (!denyByDefault) {
            return upstream; // default-allow: expose the full mirror
        }

        List<Iec61850PointRuleConfig> objects = rules.getObjects();
        if (objects == null) {
            objects = List.of();
        }
        Set<String> allowedLnPrefixes =
                objects.stream()
                        .filter(Iec61850PointRuleConfig::isAllowRead)
                        .map(Iec61850PointRuleConfig::getReference)
                        .filter(ref -> ref != null && ref.contains("."))
                        // "RelayIEDPROT/XCBR1.Pos" -> "RelayIEDPROT/XCBR1"
                        .map(ref -> ref.substring(0, ref.indexOf('.')))
                        .collect(Collectors.toSet());

        try {
            List<LogicalDevice> keptLds = new ArrayList<>();
            for (ModelNode ldNode : upstream.getChildren()) {
                LogicalDevice ld = (LogicalDevice) ldNode;
                List<LogicalNode> keptLns = new ArrayList<>();
                for (ModelNode lnNode : ld.getChildren()) {
                    LogicalNode ln = (LogicalNode) lnNode;
                    String lnPrefix = ld.getReference().toString() + "/" + ln.getName();
                    if (isSystemNode(ln.getName()) || allowedLnPrefixes.contains(lnPrefix)) {
                        keptLns.add(ln);
                    }
                }
                if (!keptLns.isEmpty()) {
                    keptLds.add(new LogicalDevice(ld.getReference(), keptLns));
                }
            }
            if (keptLds.isEmpty()) {
                log.warn("Read allow-list pruned every node; exposing full mirror instead.");
                return upstream;
            }
            return new ServerModel(keptLds, null);
        } catch (RuntimeException e) {
            log.warn("Read allow-list pruning failed ({}); exposing full mirror.", e.getMessage());
            return upstream;
        }
    }

    private static boolean isSystemNode(String lnName) {
        return lnName.startsWith("LLN0") || lnName.startsWith("LPHD");
    }
}
