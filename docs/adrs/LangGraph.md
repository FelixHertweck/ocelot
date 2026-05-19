# ADR: Adoption of LangGraph for Multi-Agent Orchestration

**Date:** May 19, 2026  
**Status:** Accepted  
**Context Area:** Agent Orchestration Framework  

## 1. Context and Problem Statement

The objective of this project is to develop an AI-driven multi-agent system capable of executing multi-step Advanced Persistent Threat (APT) scenarios against hybrid IT/OT Industrial Control Systems (ICS).

As noted in our project proposal, monolithic Large Language Models (LLMs) and traditional linear prompt chains (e.g., standard LangChain sequences) consistently fail in complex OT environments. The primary failure modes include:

* **Context Drift:** Losing track of goals during long, multi-step attack chains.  
* **Semantic Gap:** Failing to correlate IT findings (e.g., web dashboards) with raw OT protocols (Modbus, IEC 61850).  
* **Execution Loops ("Getting Stuck"):** The tendency of LLMs to fall into repetitive polling loops—such as repeatedly querying the same unresponsive Modbus register, hallucinating success, or retrying a failed parsing function indefinitely without altering their strategy.

To achieve the goals outlined in Phase 4 (Multi-Subnet IT/OT Hybrid Environment) and Phase 5 (Advanced APT Scenario), we require an orchestration framework that supports modular, multi-agent roles (Planner, Recon, ICS-Reasoning) and can reliably prevent the LLM from getting stuck in endless iterative cycles.

## 2. Decision

We will adopt **LangGraph** as the foundational orchestration framework for our multi-agent ICS exploitation system. LangGraph will be used to construct a stateful, cyclical graph where nodes represent specific agents or tool-execution blocks, and edges represent the conditional routing logic between them.

## 3. Rationale

LangGraph was chosen over alternatives (like AutoGen, CrewAI, or vanilla LangChain) specifically because of its approach to state management, predictable cyclical execution, and supervisor-based routing.

### 3.1. Mitigating LLM Execution Loops

The most critical advantage of LangGraph for this project is its ability to mathematically and logically break an LLM out of an execution loop. It achieves this through several mechanisms:

* **Explicit State Management:** Unlike standard conversational agents where state is purely derived from the chat history (which can become cluttered and cause hallucinations), LangGraph maintains a strict, typed global State object. If an Execution Agent repeatedly fails to read a register, the state explicitly records these failures.  
* **Conditional Edge Routing:** We can program deterministic Python logic into the graph's edges rather than relying purely on the LLM to decide its next move. If the State shows that a specific Modbus connection failed three times, a conditional edge can automatically route the flow to an "Error Recovery" node or back to the "Planner" node to formulate a new strategy, forcibly breaking the LLM's loop.  
* **Recursion Limits:** LangGraph natively supports recursion\_limit parameters. If the graph loops between a Recon Agent and a Tool Execution node too many times without reaching an end state (e.g., falling into a polling loop as mentioned in Phase 1a), the framework acts as a hard circuit breaker, gracefully pausing or terminating the run rather than burning tokens infinitely.

### 3.2. Supervisor Agent Architecture (Phase 4)

As the project progresses to Phase 4, the complexity of cross-subnet state tracking requires multiple specialized agents. LangGraph natively supports the **Supervisor Node** pattern. A deterministic or LLM-driven Supervisor node can monitor the shared state and delegate tasks to sub-agents (e.g., instructing the *Recon Agent* to scan an IT subnet, then passing the extracted IP to the *ICS-Reasoning Agent*). If a subordinate agent gets stuck, the Supervisor can revoke its execution turn and reassign the task, mimicking real-world red team coordination.

### 3.3. Integration with the Knowledge Graph (Phase 2 & Beyond)

In Phase 2, we introduce a persistent Knowledge Graph to store discovered IPs, Modbus mappings, and IEC 61850 nodes. LangGraph's architecture allows us to build distinct tool nodes that read/write to this Knowledge Graph. By decoupling the memory storage from the LLM's context window, we ensure the LLM receives only the highly relevant, retrieved state at each graph step, vastly reducing context drift and hallucination over the 6-step APT chain in Phase 5\.

## 4. Consequences

### Positive

* **High Reliability:** Hard boundaries and programmatic conditional edges prevent the system from burning tokens in infinite loops.  
* **Modularity:** We can start small in Phase 1a with a simple 2-node graph (Recon \<-\> Execution) and smoothly scale to a complex hierarchical graph for Phase 5 without rewriting the core architecture.  
* **Observability:** LangGraph's built-in persistence and step-by-step state tracking will make it significantly easier to evaluate token efficiency, error recovery rates, and attack success (as required for our research contributions).

### Negative / Risks

* **Complexity overhead:** Designing the initial graph state schema and the conditional routing functions requires more upfront software engineering effort compared to deploying a simple conversational loop.  
* **Strict State Typing:** The State object must be carefully designed to hold all necessary context for both Modbus and IEC 61850 data structures to avoid data loss between graph nodes.