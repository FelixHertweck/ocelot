package de.felixhertweck.otproxy.config;

public class ProxyConfig {
    private ProxySection proxy = new ProxySection();
    private RulesConfig rules = new RulesConfig();

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
