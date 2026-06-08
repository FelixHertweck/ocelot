package de.felixhertweck.otproxy.config;

public class ProxySection {
    private String protocol = "modbus"; // default to modbus
    private ListenConfig listen = new ListenConfig();
    private UpstreamConfig upstream = new UpstreamConfig();

    public String getProtocol() {
        return protocol;
    }

    public void setProtocol(String protocol) {
        this.protocol = protocol;
    }

    public ListenConfig getListen() {
        return listen;
    }

    public void setListen(ListenConfig listen) {
        this.listen = listen;
    }

    public UpstreamConfig getUpstream() {
        return upstream;
    }

    public void setUpstream(UpstreamConfig upstream) {
        this.upstream = upstream;
    }
}
