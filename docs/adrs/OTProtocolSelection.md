# ADR: Initial OT Protocol Selection (Modbus TCP vs. IEC 61850)

**Date:** May 19, 2026  
**Status:** Accepted  
**Context Area:** OT Protocol Targeting, Phase 1 & 2 Scenario Design

## 1. Context and Problem Statement
For the initial phases of our ICS exploitation testbed (Phase 1a/1b and Phase 2), we must select a primary Operational Technology (OT) protocol to target. The two primary candidates are Modbus TCP and IEC 61850. 

We need to decide which protocol allows us to best isolate and test the agent's core capabilities (specifically semantic mapping and Knowledge Graph integration) without overwhelming the LangGraph architecture with excessive protocol-specific complexity right from the start.

## 2. Decision
We will use **Modbus TCP** as the initial target protocol for Phase 1 and Phase 2. The introduction of **IEC 61850** will be explicitly delayed until Phase 3.

## 3. Rationale

The decision to start with Modbus over IEC 61850 is based on the massive disparity in protocol complexity and their representation in LLM training corpora.

### 3.1. Why Modbus is Simple (Ideal for Baseline Validation)
Modbus is conceptually trivial. It relies on a flat architecture of numerical registers where an agent simply reads or writes a value. The entire semantic structure of the protocol can be explained in a few sentences.
Furthermore, Modbus is massively represented in the training data corpora of modern LLMs. Through countless tutorials, code snippets, and Stack Overflow posts, an agent can confidently generate a working Modbus client using a handful of tool calls without ever truly "understanding" the protocol. 
For Modbus, the actual difficulty does not lie in the protocol itself, but in the *missing semantics of the registers* (knowing what a register controls in the physical world). This makes it the perfect protocol to test Phase 1b and Phase 2, where the primary objective is explicitly solving this semantic gap via web interface extraction and the Knowledge Graph.

### 3.2. Why IEC 61850 is Highly Complex
In contrast, IEC 61850 introduces severe complexity on multiple levels:
1. **The Object Model:** The protocol does not think in flat registers, but in a strict hierarchy of *Logical Devices*, *Logical Nodes*, *Data Objects*, and *Data Attributes*. An agent must understand that a string like `IED1/XCBR1.Pos.stVal` requires a specific traversal of this tree, not just a simple address query.
2. **The Service Layer (MMS):** The underlying transport mechanism, MMS (Manufacturing Message Specification), is a complex ASN.1-encoded protocol. The mappings between IEC 61850 service primitives and MMS PDUs are highly non-intuitive and significantly less documented on the public internet than Modbus.
3. **Standard Fragmentation:** The IEC 61850 standard is split across over a dozen sub-documents (e.g., 61850-7-2, 61850-7-4, 61850-8-1). If an LLM attempts to reconstruct a coherent protocol flow from its training data, it retrieves fragmented and often contradictory information.
4. **Scarce Training Corpus:** IEC 61850 is a niche standard deployed primarily in proprietary power substation environments. Publicly accessible code and documentation are extremely thin compared to Modbus.

## 4. Consequences

### Positive
* **Isolated Testing:** Starting with Modbus allows us to perfectly isolate and test our Knowledge Graph architecture (Phase 2) without the agent failing prematurely due to syntax or protocol encoding errors.
* **Valuable Scientific Data Point:** Delaying IEC 61850 to Phase 3 creates a highly interesting experimental baseline. In Phase 3, the agent will not be able to rely on latent protocol knowledge "from its gut" (as it can with Modbus). It will be forced to rely almost entirely on the correct usage of provided tool interfaces (like a `libIEC61850` API wrapper). Comparing Phase 1a (Modbus) with Phase 3a (IEC 61850) will yield a strong empirical data point on how well multi-agent systems can utilize complex protocol-specific tools when their internal, pre-trained knowledge base is weak.

### Negative / Trade-offs
* We defer testing the multi-agent system's ability to handle deeply nested data structures until midway through the project, meaning any necessary adjustments to the LangGraph schema to support hierarchical objects will only be discovered in Phase 3.