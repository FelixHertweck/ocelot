package de.felixhertweck.otproxy.protocol.modbus;

import java.time.Instant;
import java.util.Optional;
import java.util.OptionalInt;

import de.felixhertweck.otproxy.core.model.WriteRequest;

/**
 * Translates a Modbus frame into a generic WriteRequest if the frame is a write operation.
 *
 * <p>Supported write function codes: 0x05 Write Single Coil 0x06 Write Single Register 0x0F Write
 * Multiple Coils 0x10 Write Multiple Registers. Read function codes 0x01-0x04 are recognized for
 * read rate limiting.
 */
public class ModbusRequestAdapter {

    private static final int FC_READ_COILS = 0x01;
    private static final int FC_READ_DISCRETE_INPUTS = 0x02;
    private static final int FC_READ_HOLDING_REGISTERS = 0x03;
    private static final int FC_READ_INPUT_REGISTERS = 0x04;
    private static final int FC_WRITE_SINGLE_COIL = 0x05;
    private static final int FC_WRITE_SINGLE_REGISTER = 0x06;
    private static final int FC_WRITE_MULTIPLE_COILS = 0x0F;
    private static final int FC_WRITE_MULTIPLE_REGS = 0x10;

    public Optional<WriteRequest> adapt(ModbusFrame frame, String sourceIp) {
        int fc = frame.functionCode();
        byte[] pdu = frame.pdu();

        return switch (fc) {
            case FC_WRITE_SINGLE_COIL, FC_WRITE_SINGLE_REGISTER -> {
                if (pdu.length < 5) yield Optional.empty();
                int address = ((pdu[1] & 0xFF) << 8) | (pdu[2] & 0xFF);
                int value = ((pdu[3] & 0xFF) << 8) | (pdu[4] & 0xFF);
                yield Optional.of(
                        new WriteRequest(
                                "modbus",
                                Integer.toString(address),
                                value,
                                sourceIp,
                                Instant.now()));
            }
            case FC_WRITE_MULTIPLE_COILS, FC_WRITE_MULTIPLE_REGS -> {
                if (pdu.length < 5) yield Optional.empty();
                // Use starting address and first value (if present) for rule evaluation
                int address = ((pdu[1] & 0xFF) << 8) | (pdu[2] & 0xFF);
                int value = pdu.length >= 8 ? ((pdu[6] & 0xFF) << 8) | (pdu[7] & 0xFF) : 0;
                yield Optional.of(
                        new WriteRequest(
                                "modbus",
                                Integer.toString(address),
                                value,
                                sourceIp,
                                Instant.now()));
            }
            default -> Optional.empty();
        };
    }

    public boolean isWriteFrame(ModbusFrame frame) {
        int fc = frame.functionCode();
        return fc == FC_WRITE_SINGLE_COIL
                || fc == FC_WRITE_SINGLE_REGISTER
                || fc == FC_WRITE_MULTIPLE_COILS
                || fc == FC_WRITE_MULTIPLE_REGS;
    }

    public boolean isReadFrame(ModbusFrame frame) {
        int fc = frame.functionCode();
        return fc == FC_READ_COILS
                || fc == FC_READ_DISCRETE_INPUTS
                || fc == FC_READ_HOLDING_REGISTERS
                || fc == FC_READ_INPUT_REGISTERS;
    }

    /**
     * Starting address of a read frame (FC 0x01-0x04), or empty for any other frame. A read PDU is
     * FC + 2-byte start address + 2-byte quantity, so anything shorter than 5 bytes is malformed
     * and forwarded transparently rather than rate-limited.
     */
    public OptionalInt readStartAddress(ModbusFrame frame) {
        if (!isReadFrame(frame)) return OptionalInt.empty();
        byte[] pdu = frame.pdu();
        if (pdu.length < 5) return OptionalInt.empty();
        return OptionalInt.of(((pdu[1] & 0xFF) << 8) | (pdu[2] & 0xFF));
    }
}
