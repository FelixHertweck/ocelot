package de.felixhertweck.otproxy.protocol.iec61850;

import java.time.Instant;
import java.util.Optional;

import com.beanit.iec61850bean.BasicDataAttribute;
import com.beanit.iec61850bean.BdaBoolean;
import de.felixhertweck.otproxy.core.model.WriteRequest;

/**
 * Translates an intercepted IEC 61850 control write into a protocol-neutral {@link WriteRequest}.
 *
 * <p>A control Operate surfaces server-side as a write to the {@code ...Oper.ctlVal} leaf
 * attribute. The rule {@code target} is the controllable data object reference with the {@code
 * .Oper.ctlVal} suffix stripped (e.g. {@code RelayIEDPROT/XCBR1.Pos}); a boolean {@code ctlVal} is
 * carried as {@code 1}/{@code 0} so it reuses the same value-range/whitelist rules as Modbus.
 */
public class Iec61850RequestAdapter {

    private static final String OPER_CTLVAL_SUFFIX = ".Oper.ctlVal";

    /** Returns a {@link WriteRequest} for a boolean control write, or empty for anything else. */
    public Optional<WriteRequest> adapt(BasicDataAttribute bda, String sourceIp) {
        String reference = bda.getReference().toString();
        if (!reference.endsWith(OPER_CTLVAL_SUFFIX)) {
            return Optional.empty();
        }
        if (!(bda instanceof BdaBoolean boolBda)) {
            return Optional.empty();
        }
        String target = reference.substring(0, reference.length() - OPER_CTLVAL_SUFFIX.length());
        int value = boolBda.getValue() ? 1 : 0;
        return Optional.of(new WriteRequest("iec61850", target, value, sourceIp, Instant.now()));
    }
}
