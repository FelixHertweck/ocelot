package de.felixhertweck.otproxy.config;

import java.util.Locale;

/**
 * Read and write default action ({@code ALLOW}/{@code DENY}) for points not listed under {@code
 * rules.objects}/{@code rules.registers}. Values are case-insensitive, normalized to upper case,
 * and anything else is rejected at load time.
 */
public class DirectionalActionConfig {
    private String read;
    private String write;

    public String getRead() {
        return read;
    }

    public void setRead(String read) {
        this.read = normalize("read", read);
    }

    public String getWrite() {
        return write;
    }

    public void setWrite(String write) {
        this.write = normalize("write", write);
    }

    private static String normalize(String direction, String value) {
        if (value == null) {
            return null;
        }
        String upper = value.trim().toUpperCase(Locale.ROOT);
        if (!upper.equals("ALLOW") && !upper.equals("DENY")) {
            throw new IllegalArgumentException(
                    "default_action." + direction + " must be ALLOW or DENY, got: " + value);
        }
        return upper;
    }
}
