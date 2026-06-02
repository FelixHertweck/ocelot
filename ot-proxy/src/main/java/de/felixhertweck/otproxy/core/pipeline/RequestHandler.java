package de.felixhertweck.otproxy.core.pipeline;

import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.WriteRequest;

@FunctionalInterface
public interface RequestHandler {
    void handle(WriteRequest request, RuleResult result);
}
