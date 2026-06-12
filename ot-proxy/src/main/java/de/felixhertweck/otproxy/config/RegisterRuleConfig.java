package de.felixhertweck.otproxy.config;

/** Modbus safety rule, keyed by a numeric register address. */
public class RegisterRuleConfig extends PointRuleConfig {
    private int address;

    @Override
    public String key() {
        return Integer.toString(address);
    }

    public int getAddress() {
        return address;
    }

    public void setAddress(int address) {
        this.address = address;
    }
}
