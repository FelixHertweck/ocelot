# ADR: Agent Orchestration Framework (LangGraph over OpenClaw)

**Date:** May 19, 2026  
**Status:** Accepted  
**Context Area:** AI Agent Orchestration, ICS Exploitation Testbed

## 1. Context and Problem Statement
The project aims to demonstrate how a multi-agent AI system can overcome the "capability wall" (context drift, compounding logic errors, and polling traps) observed in monolithic LLMs during Industrial Control System (ICS) exploitation. The architecture will execute complex, multi-step scenarios (Phases 1 through 5) against physical and emulated OT devices (Modbus TCP, IEC 61850). 

To orchestrate the LLM agents on the attacker VM, two primary approaches were considered:
1. **OpenClaw:** A fully autonomous, persistent Command and Control (C2) daemon/framework that natively handles OS interactions and agent workflows.
2. **LangGraph + MCP (Model Context Protocol):** A developer-centric framework for building stateful, multi-actor applications with explicit control flows and tool boundaries.

We need to decide which framework serves as the foundation for the attacker VM, keeping in mind the rigorous evaluation requirements (token efficiency, error recovery) and our Infrastructure-as-Code (IaC) deployment via the CAVE Framework and OpenTofu.

## 2. Decision
We will exclusively use **LangGraph combined with MCP tools** for the agent orchestration across all project phases. **OpenClaw will not be used** at this stage of the research.

## 3. Rationale

### 3.1. Scientific Precision (Whitebox vs. Blackbox Architecture)
As stated in the project proposal, the scientific value of this research lies in the *systematic application and evaluation* of agent frameworks to overcome specific OT exploitation limits. 
* **LangGraph** provides a "whitebox" approach. We can explicitly model the state machine, define the exact routing between sub-agents (e.g., Planner, Recon, ICS-Reasoning in Phase 4), and definitively prove *how* the architecture prevents polling loops. 
* **OpenClaw** acts as a "blackbox". It abstracts the decision-making process to maximize autonomy. Using it would force us to rely heavily on prompt engineering to suppress its default behaviors, risking the exact same monolithic failures (context drift) identified in the baseline paper.

### 3.2. Mandatory Knowledge Graph Integration (Phase 2 & Beyond)
Phase 2 introduces a persistent Knowledge Graph to prevent cross-subnet and multi-protocol context drift. 
* In **LangGraph**, we can strictly enforce graph updates by structuring the state transitions (e.g., an agent *must* pass state to a KG-Update node before proceeding). 
* In **OpenClaw**, there is no native shared state graph in the same way. We would have to provide the Knowledge Graph as a standard tool plugin and "hope" the LLM uses it correctly, which compromises the deterministic nature required for the Phase 5 Advanced Persistent Threat (APT) benchmark.

### 3.3. IaC and Deployment Compatibility
The project relies on dynamic JSON configurations injected into standard base images via CAVE and OpenTofu.
* A **LangGraph** workflow can be executed as a standard, predictable Python process triggered directly by the injected configuration. Once the scenario (e.g., Phase 1a) is complete, the process terminates cleanly.
* **OpenClaw** runs as a persistent daemon requiring its own security context, messaging integrations, and environment setup. This adds unnecessary deployment overhead to the base images and complicates the automated lifecycle management of the testbed.

## 4. Consequences

### Positive
* **Measurability:** We retain exact control over token usage, step-by-step error recovery rates, and state transitions, making the Phase 5 evaluation highly scientifically rigorous.
* **Traceability:** Debugging failed agent interactions (e.g., incorrect IEC 61850 MMS PDUs in Phase 3a) will be straightforward because the LangGraph node boundaries isolate the logic.
* **Simplicity of Infrastructure:** The attacker VM remains lightweight and stateless prior to the execution of the Python LangGraph script.

### Negative / Trade-offs
* **Increased Development Overhead for Tools:** Because we are not using OpenClaw's native system-interaction features, we must write and expose our own MCP tools (e.g., Shell execution, Python code generation, file manipulation) for the agent to interact with the underlying OS.
* **Less "Out-of-the-box" Autonomy:** Creating the supervisor logic (Phase 4) requires writing explicit routing code rather than relying on an autonomous agent operating system.

## 5. Future Considerations
While OpenClaw is rejected for the core scientific proofs of Phases 1-5, it may be re-evaluated in future work if the project scope expands to require a persistent, hands-off C2 dashboard for human operators, provided the core ICS capability wall has already been demonstrably solved via the LangGraph architecture.