package de.felixhertweck.otproxy.core.model;

import java.time.Instant;

public record WriteRequest(
        String protocol, String target, Object value, String sourceIp, Instant timestamp) {}
