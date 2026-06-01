package de.felixhertweck.otgateway.protocol.modbus;

import java.io.DataInputStream;
import java.io.IOException;

/**
 * Modbus TCP MBAP header + PDU frame.
 *
 * <p>Wire format: [0-1] Transaction ID (big-endian) [2-3] Protocol ID (always 0x0000) [4-5] Length
 * (PDU length including Unit ID) [6] Unit ID [7…] PDU (Function Code + data)
 */
public record ModbusFrame(int transactionId, int protocolId, int unitId, byte[] pdu) {

    static final int MBAP_LENGTH = 7;

    public int functionCode() {
        return pdu[0] & 0xFF;
    }

    /** Serialize back to the raw bytes that were received. */
    public byte[] toBytes() {
        int pduLength = pdu.length;
        byte[] out = new byte[MBAP_LENGTH + pduLength];
        out[0] = (byte) (transactionId >> 8);
        out[1] = (byte) transactionId;
        out[2] = (byte) (protocolId >> 8);
        out[3] = (byte) protocolId;
        int lengthField = 1 + pduLength; // Unit ID + PDU
        out[4] = (byte) (lengthField >> 8);
        out[5] = (byte) lengthField;
        out[6] = (byte) unitId;
        System.arraycopy(pdu, 0, out, MBAP_LENGTH, pduLength);
        return out;
    }

    /** Build a Modbus exception response for this frame. */
    public byte[] toExceptionResponse(int exceptionCode) {
        byte errorFc = (byte) (functionCode() | 0x80);
        byte[] exPdu = {errorFc, (byte) exceptionCode};
        int lengthField = 1 + exPdu.length;
        byte[] out = new byte[MBAP_LENGTH + exPdu.length];
        out[0] = (byte) (transactionId >> 8);
        out[1] = (byte) transactionId;
        out[2] = (byte) (protocolId >> 8);
        out[3] = (byte) protocolId;
        out[4] = (byte) (lengthField >> 8);
        out[5] = (byte) lengthField;
        out[6] = (byte) unitId;
        out[7] = errorFc;
        out[8] = (byte) exceptionCode;
        return out;
    }

    public static ModbusFrame read(DataInputStream in) throws IOException {
        // Read MBAP header
        int transactionId = readUnsignedShort(in);
        int protocolId = readUnsignedShort(in);
        int lengthField = readUnsignedShort(in);
        int unitId = in.read();
        if (unitId == -1) throw new IOException("Connection closed while reading Unit ID");

        // length field = 1 (Unit ID) + PDU bytes
        int pduLength = lengthField - 1;
        if (pduLength <= 0) throw new IOException("Invalid Modbus length field: " + lengthField);

        byte[] pdu = new byte[pduLength];
        in.readFully(pdu);
        return new ModbusFrame(transactionId, protocolId, unitId, pdu);
    }

    private static int readUnsignedShort(DataInputStream in) throws IOException {
        int hi = in.read();
        int lo = in.read();
        if (hi == -1 || lo == -1)
            throw new IOException("Connection closed while reading MBAP header");
        return (hi << 8) | lo;
    }
}
