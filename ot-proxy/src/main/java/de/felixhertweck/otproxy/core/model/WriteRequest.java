package de.felixhertweck.otproxy.core.model;

import java.time.Instant;

/**
 * A protocol-neutral write/control request. {@code target} is the canonical rule key: a Modbus
 * register address (as a String) or an IEC 61850 object reference (e.g. {@code
 * RelayIEDPROT/XCBR1.Pos}). {@code value} is the written value; a boolean IEC control value is
 * carried as {@code 1}/{@code 0}.
 */
public record WriteRequest(
        String protocol, String target, int value, String sourceIp, Instant timestamp) {}
