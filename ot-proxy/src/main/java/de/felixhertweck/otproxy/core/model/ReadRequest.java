package de.felixhertweck.otproxy.core.model;

import java.time.Instant;

public record ReadRequest(
        String protocol, String target, int count, String sourceIp, Instant timestamp) {}
