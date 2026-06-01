package de.felixhertweck.otgateway.config;

public class ValueRangeConfig {
    private int min = 0;
    private int max = Integer.MAX_VALUE;

    public int getMin() {
        return min;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }
}
