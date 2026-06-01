package de.felixhertweck.otgateway.config;

public class ProxySection {
    private ListenConfig listen = new ListenConfig();
    private UpstreamConfig upstream = new UpstreamConfig();

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
