package de.felixhertweck.otgateway.config;

public class UpstreamConfig {
    private String host = "127.0.0.1";
    private int port = 502;

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }
}
