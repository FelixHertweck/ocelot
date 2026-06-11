package de.felixhertweck.otproxy.core.pipeline;

import java.time.Instant;
import java.util.List;

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

    public RuleResult process(WriteRequest request) {
        RuleResult result = ruleEngine.evaluate(request);
        handlers.forEach(h -> h.handle(request, result));
        return result;
    }

    /** Applies the read rate limit for a read of {@code address}. */
    public RuleResult processRead(int address, Instant now) {
        return ruleEngine.evaluateRead(address, now);
    }
}
