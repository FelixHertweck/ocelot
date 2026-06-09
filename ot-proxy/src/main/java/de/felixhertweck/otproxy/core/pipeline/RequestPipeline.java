package de.felixhertweck.otproxy.core.pipeline;

import java.util.List;

import de.felixhertweck.otproxy.core.model.ReadRequest;
import de.felixhertweck.otproxy.core.model.RuleResult;
import de.felixhertweck.otproxy.core.model.WriteRequest;
import de.felixhertweck.otproxy.core.rules.RuleEngine;

public class RequestPipeline {

    private final RuleEngine ruleEngine;
    private final List<RequestHandler> handlers;

    public RequestPipeline(RuleEngine ruleEngine, List<RequestHandler> handlers) {
        this.ruleEngine = ruleEngine;
        this.handlers = List.copyOf(handlers);
    }

    public RuleResult processRead(ReadRequest request) {
        RuleResult result = ruleEngine.evaluateRead(request);
        handlers.forEach(h -> h.handleRead(request, result));
        return result;
    }

    public RuleResult process(WriteRequest request) {
        RuleResult result = ruleEngine.evaluate(request);
        handlers.forEach(h -> h.handle(request, result));
        return result;
    }
}
