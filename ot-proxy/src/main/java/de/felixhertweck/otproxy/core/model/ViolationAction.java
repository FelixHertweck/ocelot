package de.felixhertweck.otproxy.core.model;

import java.util.Locale;

public enum ViolationAction {
    /** Reject the request at the protocol level (Modbus exception frame / IEC MMS ServiceError). */
    REJECT,
    SILENT_DROP,
    DISCONNECT;

    /**
     * Protocol-neutral alias kept for backwards compatibility with existing Modbus configs and
     * tests. {@code MODBUS_EXCEPTION} is the historic name for {@link #REJECT}.
     */
    public static final ViolationAction MODBUS_EXCEPTION = REJECT;

    /** Parses a config value, defaulting to {@link #REJECT} for null/unknown input. */
    public static ViolationAction parse(String action) {
        if (action == null) return REJECT;
        return switch (action.toUpperCase(Locale.ROOT)) {
            case "SILENT_DROP" -> SILENT_DROP;
            case "DISCONNECT" -> DISCONNECT;
            default -> REJECT;
        };
    }
}
