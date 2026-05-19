# ADR: Knowledge Graph as Persistent External Memory

**Date:** May 19, 2026  
**Status:** Accepted  
**Context Area:** Agent Memory, State Management, ICS Exploitation Testbed

## 1. Context and Problem Statement
In multi-step Industrial Control System (ICS) exploitation scenarios, monolithic LLMs suffer from severe "context drift" and compounding logic errors. While in-context memory is sufficient for single-device, flat-network tasks (Phases 1a and 1b), it fails as complexity scales. 

From Phase 3 onward, the AI agent must simultaneously track:
* Multiple physical and emulated devices across different network segments (IT and OT).
* Distinct OT protocol namespaces (Modbus TCP and IEC 61850).
* Extracted credential pairs and their associated interfaces.
* Semantic register-to-component mappings (bridging the IT/OT semantic gap).
* Hierarchical logical node paths (Logical Device $\rightarrow$ Logical Node $\rightarrow$ Data Object $\rightarrow$ Data Attribute for IEC 61850).

Relying solely on the LLM's context window to maintain this cross-session state reliably leads to hallucinated register addresses, forgotten credentials, and repetitive polling loops. We need a robust external memory architecture to persist this state across the multi-agent system.

## 2. Decision
We will implement a **Knowledge Graph (KG)** as the primary persistent external memory structure for the LangGraph multi-agent system, officially integrated during Phase 2 of the project. 

The KG will utilize a strict, explicit schema to model ICS entities and their relationships. Agents will interact with the KG via specialized LangGraph tool bindings (e.g., `update_graph`, `query_graph`) to store and retrieve reconnaissance data and semantic mappings.

## 3. Rationale

### 3.1. Natural Fit for ICS Network and Protocol Topologies
A graph structure perfectly mirrors the reality of OT environments. It naturally represents relationships such as:
* `(Credential: admin/admin) -[UNLOCKS]-> (Interface: Web HMI) -[HOSTED_ON]-> (Device: 192.168.1.50)`
* `(Label: "Main Breaker") -[MAPS_TO]-> (Register: 40001) -[ACCESSIBLE_VIA]-> (Protocol: Modbus TCP)`
Furthermore, the deeply hierarchical nature of the IEC 61850 standard (introduced in Phase 3) maps directly to graph nodes and directed edges, which would be cumbersome to model in flat JSON or relational databases.

### 3.2. Elimination of Context Drift & Token Efficiency
Instead of forcing the LLM to process thousands of lines of raw network logs and Modbus hex dumps in every prompt, the LangGraph agents will query the KG only for the specific sub-graph relevant to their current task. This offloads state from the context window, dramatically improving token efficiency and ensuring that facts discovered in Step 1 (e.g., IT jump-host credentials) are perfectly preserved for Step 6 (OT physical disruption) in the Phase 5 APT scenario.

### 3.3. Grounded Semantic Mapping
The baseline paper identified the "semantic gap" as a primary failure mode. By extracting human-readable mappings from web interfaces (Phase 1b) and writing them to the KG, the ICS-Reasoning agent has a cryptographically strict, verified dictionary to rely on. It forces the agent to act on verified facts rather than hallucinating protocol interactions.

### 3.4. Shared Source of Truth for Multi-Agent Supervisor
In Phase 4, the system transitions to a Supervisor model with distinct agent roles (Planner, Recon, ICS-Reasoning). The Knowledge Graph acts as the centralized blackboard. The Recon Agent updates the graph with IPs and ports, while the ICS-Reasoning agent subsequently queries those exact nodes to execute its payload, enabling seamless cross-agent collaboration.

## 4. Consequences

### Positive
* **Scalability:** The system can handle highly complex, multi-subnet topologies without degrading LLM reasoning performance.
* **Auditability:** The graph provides a structured, human-readable audit trail of exactly what the agent "knew" at any given point in the attack chain, which is crucial for the Phase 5 evaluation metrics.
* **Error Reduction:** By forcing agents to retrieve targets from the KG, we mechanically prevent the hallucination of IP addresses and registers.

### Negative / Trade-offs
* **High Engineering Complexity:** As noted in the proposal, this is the most technically demanding component. Designing the correct ICS schema and building bulletproof LangGraph tool bindings to interact with it requires significant development effort.
* **Strict Tool Compliance Required:** The LLM must be successfully prompted and constrained to consistently use the KG update/query tools. If an agent fails to write discovered data to the graph, the subsequent attack chain will break. (Phase 2 is dedicated explicitly to validating this behavior before scaling up).