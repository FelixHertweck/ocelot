package de.felixhertweck.otgateway.core.pipeline;

import de.felixhertweck.otgateway.core.model.RuleResult;
import de.felixhertweck.otgateway.core.model.WriteRequest;

@FunctionalInterface
public interface RequestHandler {
    void handle(WriteRequest request, RuleResult result);
}
