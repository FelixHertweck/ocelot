package de.felixhertweck.otproxy.core.model;

public record RuleResult(boolean allowed, ViolationAction action, String reason) {

    public static RuleResult allow() {
        return new RuleResult(true, null, null);
    }

    public static RuleResult deny(ViolationAction action, String reason) {
        return new RuleResult(false, action, reason);
    }
}
