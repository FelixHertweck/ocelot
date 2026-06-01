package de.felixhertweck.otgateway.core.pipeline;

import java.util.List;

import de.felixhertweck.otgateway.core.model.RuleResult;
import de.felixhertweck.otgateway.core.model.WriteRequest;
import de.felixhertweck.otgateway.core.rules.RuleEngine;

public class RequestPipeline {

    private final RuleEngine ruleEngine;
    private final List<RequestHandler> handlers;

    public RequestPipeline(RuleEngine ruleEngine, List<RequestHandler> handlers) {
        this.ruleEngine = ruleEngine;
        this.handlers = List.copyOf(handlers);
    }

    public RuleResult process(WriteRequest request) {
        RuleResult result = ruleEngine.evaluate(request);
        handlers.forEach(h -> h.handle(request, result));
        return result;
    }
}
