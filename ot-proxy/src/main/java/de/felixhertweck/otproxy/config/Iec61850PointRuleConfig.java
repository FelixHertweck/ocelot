package de.felixhertweck.otproxy.config;

/**
 * IEC 61850 safety rule, keyed by an object reference such as {@code RelayIEDPROT/XCBR1.Pos} (the
 * controllable data object, without the {@code .Oper.ctlVal} suffix).
 */
public class Iec61850PointRuleConfig extends PointRuleConfig {
    private String reference;

    @Override
    public String key() {
        return reference;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }
}
