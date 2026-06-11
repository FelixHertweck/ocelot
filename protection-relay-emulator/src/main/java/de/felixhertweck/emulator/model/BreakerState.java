package de.felixhertweck.emulator.model;

/**
 * Represents the double-point control (DPC) status values of a circuit breaker (Dbpos). stVal for
 * DPC is Dbpos, mapped as BdaBitString (2 bits): 00 = intermediate, 01 = off/open (0x40), 10 =
 * on/closed (0x80), 11 = bad-state (0xC0).
 */
public enum BreakerState {
    INTERMEDIATE(new byte[] {0x00}),
    OPEN(new byte[] {0x40}),
    CLOSED(new byte[] {(byte) 0x80}),
    BAD_STATE(new byte[] {(byte) 0xC0});

    private final byte[] dbpos;

    BreakerState(byte[] dbpos) {
        this.dbpos = dbpos;
    }

    public byte[] getDbpos() {
        return dbpos.clone();
    }
}
