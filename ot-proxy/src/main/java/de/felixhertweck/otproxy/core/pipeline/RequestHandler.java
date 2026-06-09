package de.felixhertweck.otproxy.core.pipeline;

import de.felixhertweck.otproxy.core.model.ReadRequest;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.WriteRequest;

public interface RequestHandler {
    void handle(WriteRequest request, RuleResult result);

    default void handleRead(ReadRequest request, RuleResult result) {}
}
