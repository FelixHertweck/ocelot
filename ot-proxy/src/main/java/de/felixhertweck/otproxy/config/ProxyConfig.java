package de.felixhertweck.otproxy.config;

public class ProxyConfig {
    /**
     * Protocol classifier: {@code modbus} (default) or {@code iec61850}. Selects the proxy stack.
     */
    private String protocol = "modbus";

    private ProxySection proxy = new ProxySection();
    private RulesConfig rules = new RulesConfig();

    public String getProtocol() {
        return protocol;
    }

    public void setProtocol(String protocol) {
        this.protocol = protocol;
    }

    public ProxySection getProxy() {
        return proxy;
    }

    public void setProxy(ProxySection proxy) {
        this.proxy = proxy;
    }

    public RulesConfig getRules() {
        return rules;
    }

    public void setRules(RulesConfig rules) {
        this.rules = rules;
    }
}
