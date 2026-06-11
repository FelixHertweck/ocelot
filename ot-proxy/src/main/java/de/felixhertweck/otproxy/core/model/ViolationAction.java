package de.felixhertweck.otproxy.core.model;

import java.util.Locale;

public enum ViolationAction {
    MODBUS_EXCEPTION,
    SILENT_DROP,
    DISCONNECT;

    /** Parses a config value, defaulting to {@link #MODBUS_EXCEPTION} for null/unknown input. */
    public static ViolationAction parse(String action) {
        if (action == null) return MODBUS_EXCEPTION;
        return switch (action.toUpperCase(Locale.ROOT)) {
            case "SILENT_DROP" -> SILENT_DROP;
            case "DISCONNECT" -> DISCONNECT;
            default -> MODBUS_EXCEPTION;
        };
    }
}
