package de.felixhertweck.otproxy.core.model;

import java.time.Instant;

public record WriteRequest(
        String protocol, int registerAddress, int value, String sourceIp, Instant timestamp) {}
