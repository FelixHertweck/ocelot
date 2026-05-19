# AI-Driven Multi-Agent System for ICS Exploitation: Project Proposal

## Objective and Motivation

Current monolithic Large Language Models (LLMs) fail at executing multi-step attacks on Industrial Control Systems (ICS) due to context drift, compounding logic errors, and the semantic gap between IT networks and OT process logic. Building on recent findings regarding AI agent limitations in ICS environments, this project proposes a LangGraph-based multi-agent system specifically tailored for and tested on energy hardware OT devices. Rather than introducing novel agent architectures as the primary research contribution, the system deliberately relies on well-established, production-grade agent frameworks and memory primitives — the scientific value lies in the systematic application and evaluation of these components in the underexplored domain of OT exploitation. To ensure high reproducibility and flexibility, the project will deliver an Infrastructure-as-Code (IaC) testbed that dynamically loads attack scenarios via JSON configurations into standard base images. The project will initially leverage existing physical energy sector devices and progressively introduce custom software emulations. This hybrid approach guarantees real-world applicability while ultimately providing the flexibility to run complex scenarios without strict physical hardware dependencies.

---

## Phase 1a: Proof of Concept — Modbus TCP on Physical Hardware

For the initial Proof of Concept, the primary goal is to validate the basic LangGraph orchestration and the deployment pipeline directly on actual hardware. A physical energy hardware OT device that has been intentionally configured to be open and vulnerable for testing purposes will serve as the target. The interaction will be straightforward, focusing on discovering an exposed interface such as unauthenticated Modbus TCP holding registers. The agent architecture will be minimal, featuring only a Recon Agent and an Execution Agent, both implemented using established LangGraph patterns without custom modifications to the underlying framework. No persistent external memory is used in this phase; all state is maintained within the agent's context window.

Success is defined by the LangGraph system autonomously connecting to the physical device over the network, identifying the correct exposed registers, and successfully reading operational parameters without altering the system state or falling into a repetitive polling loop.

---

## Phase 1b: Web Interface Exploitation and Register Mapping

The second sub-phase introduces a more realistic attack entry point that mirrors common vulnerabilities found in deployed OT environments. The target is a separate physical OT device — distinct from the one used in Phase 1a — that exposes an HTTP-based management web interface accessible within the test network and protected only by vendor-supplied default credentials. This interface provides human-readable diagnostic and configuration views that are unavailable via the raw Modbus TCP interface alone.

In this phase, the agent must first identify the web interface through network reconnaissance, authenticate using default credential pairs sourced from a curated lookup table embedded in the agent's toolchain, and systematically parse the web application's pages to extract structured information — most critically, the mapping between human-readable register labels and their corresponding Modbus register addresses. This mapping directly resolves the semantic gap identified in the baseline paper as a primary cause of agent failure: rather than hallucinating the function of unknown register addresses, the agent derives a grounded, verified register-to-component mapping from the device's own management interface.

Once the register mapping has been extracted, the agent proceeds to execute a targeted Modbus TCP interaction informed by this semantic context. The success criterion is the agent's ability to autonomously traverse the full chain from unauthenticated web access through credential exploitation to semantically correct Modbus register interaction, without human intervention or pre-seeded register knowledge.

---

## Phase 2: Knowledge Graph Integration

With the foundational Modbus-based phases complete, Phase 2 introduces the Knowledge Graph as the agent's persistent external memory before the system is exposed to the additional protocol and network complexity of later phases. In Phases 1a and 1b, the agent operated against a single device in a flat network topology, and the accumulated state remained within manageable context window bounds. From Phase 3 onward, the agent must simultaneously track multiple physical devices, two distinct OT protocol namespaces, extracted credential pairs, and register-to-component mappings — a volume of cross-session state that reliably exceeds what an in-context-only approach can maintain without drift.

The Knowledge Graph is therefore introduced at this point as a deliberate architectural upgrade before complexity scales further. It stores discovered IPs, protocol types, credential pairs, Modbus register mappings, and — anticipating Phase 3 — IEC 61850 logical node paths in a structured graph schema, making this information reliably accessible across tool calls without occupying context window capacity. The schema is designed to model ICS entities and their relationships explicitly: a device node carries its protocol type and network address, register nodes are linked to their parent device and annotated with their human-readable semantic label, and credential nodes are associated with the interface through which they were obtained.

It should be noted that the Knowledge Graph is the technically most demanding component in the entire project. Designing a schema that correctly captures ICS entity relationships and exposing it through reliable LangGraph tool bindings requires significantly more engineering effort than any individual protocol client. This phase therefore serves a dual purpose: it delivers the memory infrastructure that all subsequent phases depend on, and it validates that the Knowledge Graph integration does not introduce new failure modes into the agent's tool-use behaviour before the scenarios become more complex.

---

## Phase 3a: IEC 61850 Reconnaissance on Physical Hardware

Phase 3a mirrors the objective of Phase 1a but targets an entirely different protocol, thereby establishing a direct protocol-difficulty comparison within a controlled experimental setting. The target is a physical IEC 61850-capable protection or measurement device present in the test environment, configured to accept unauthenticated MMS connections.

The agent must discover the device's MMS endpoint, issue a `GetServerDirectory` request to enumerate its Logical Devices, traverse the object hierarchy down to individual Data Objects and Data Attributes using `GetLogicalNodeDirectory` and `GetDataValues` service primitives, and produce a structured inventory of the device's logical node topology. Unlike Modbus, where a valid read requires only a register address and a function code, IEC 61850 demands that the agent correctly navigate the four-level hierarchy of Logical Device, Logical Node, Data Object, and Data Attribute — and encode each request as a valid MMS PDU. The agent may not rely on hardcoded paths; the traversal must be derived dynamically from the server's own directory responses. All discovered topology information is written to the Knowledge Graph established in Phase 2.

This phase is expected to be the most protocol-challenging of the hardware-based phases. IEC 61850 and its MMS transport layer are significantly less represented in public training corpora than Modbus, and the agent will depend more heavily on the tool abstractions provided by a `libIEC61850`-based client than on latent protocol knowledge. The contrast between agent performance in Phase 1a and Phase 3a provides a direct empirical measure of the protocol complexity differential.

---

## Phase 3b: IEC 61850 Software Emulation

Building on the physical hardware baseline established in Phase 3a, this sub-phase introduces a lightweight software emulation of an IEC 61850 protection device. The motivation is twofold: to remove physical hardware dependencies for repeatable scenario execution, and to provide a fully controlled endpoint whose internal state can be instrumented for evaluation purposes.

The emulator is implemented using `libIEC61850` as the reference implementation to ensure protocol correctness and standards compliance. The emulated device exposes a deliberately minimal but realistic set of logical nodes — covering protection functions such as PTOC and XCBR and measurement data via MMXU — and responds to standard MMS read and control service requests. When queried with a correctly structured `GetDataValues` or `GetLogicalNodeDirectory` request, the device returns a structured parameter list reflecting the current state of the emulated protection functions. No simulation of physical processes is required; the emulator's sole responsibility is to provide a protocol-correct IEC 61850 endpoint that rewards syntactically and semantically valid agent interactions with meaningful structured data.

---

## Phase 4: Multi-Subnet IT/OT Hybrid Environment

Building on the hardware and emulation-based foundations of the previous phases, Phase 4 introduces full network segmentation and multi-step lateral movement. The IaC framework deploys a multi-subnet environment containing both an IT network segment and an OT network segment, separated by a routing boundary. The IT segment contains an emulated, exposed web-based HMI dashboard acting as a jump host with known vulnerabilities. The OT segment hosts the physical devices from earlier phases alongside additional emulated endpoints.

The attack scenario demands a two-step chain where the agent must first compromise the web-based IT interface to gain routing access, and only then interact with the OT targets. To handle the increased cross-network state complexity, this phase deploys the full Supervisor model with separated agent roles — Planner, Recon, and ICS-Reasoning — coordinated by a LangGraph supervisor node. The Knowledge Graph is extended to store cross-subnet topology information including discovered routing paths, subnet memberships, and the cumulative device inventory from both network segments.

---

## Phase 5: Final Scenario — Advanced Persistent Threat in a Power Grid Substation

The final phase demonstrates the full capability of the platform through a realistic, six-step Advanced Persistent Threat scenario targeting a hybrid power grid substation environment. The IaC framework deploys a complete hybrid testbed that seamlessly integrates the software emulators developed in earlier phases with physical hardware-in-the-loop devices such as PLCs and protection relays. The scenario is designed to mirror documented APT intrusion patterns in energy infrastructure and serves as the definitive benchmark for evaluating the multi-agent architecture end-to-end.

The attack chain proceeds as follows. In the first step, the agent performs passive and active reconnaissance of the externally reachable IT perimeter, identifying an internet-facing engineering workstation with an exposed remote management service. In the second step, the agent exploits a credential vulnerability on this workstation — using either default credentials or a credential derived from earlier open-source intelligence — to gain an initial foothold and establish a persistent session. In the third step, from the compromised workstation, the agent enumerates the internal network to discover the OT-adjacent SCADA HMI, maps the routing boundary between the IT and OT subnets, and identifies accessible OT endpoints. In the fourth step, the agent exploits the HMI's web interface, following the pattern established in Phase 1b, to extract the substation's register and logical node topology, including Modbus register mappings for the physical RTU and IEC 61850 logical node directories for the protection relay emulator. In the fifth step, the agent executes a coordinated interaction sequence across both protocols: it reads current operational parameters from the Modbus RTU to establish a baseline system state, then issues a correctly formed IEC 61850 MMS control command to the protection relay to open a simulated circuit breaker logical node (XCBR). In the sixth step, the agent validates the effect of the control action by re-reading the relevant status registers and logical node attributes, confirms the state change, and produces a structured attack report documenting each step, the credentials and register mappings used, and the final physical impact achieved.

This six-step chain requires the agent to exercise every capability developed across all previous phases — network reconnaissance, credential exploitation, web interface parsing, cross-subnet lateral movement, multi-protocol OT interaction, and state validation — within a single autonomous run. The phase concludes with a comprehensive evaluation measuring attack success rate, token efficiency per phase, error recovery rate at each step, and the Knowledge Graph's effectiveness in preventing context drift across the full chain.

---

## Expected Contributions

Ultimately, this project will yield several key contributions to the field of industrial system security. We will deliver a modular, open-source IaC platform capable of dynamically deploying flexible, hybrid ICS testbeds across multiple network segments and protocol domains. A major value proposition of this platform is its ease of extensibility, allowing researchers to add new software emulations or integrate additional physical systems through simple JSON configuration files. We will present a novel, Knowledge-Graph-backed multi-agent architecture specifically tailored to overcome current LLM limitations in OT exploitation, with a rigorous evaluation methodology measuring token efficiency, attack success rates, and error recovery capabilities. The direct protocol-difficulty comparison between Modbus and IEC 61850 established across Phases 1a and 3a constitutes an additional empirical contribution. Finally, the six-step APT benchmark scenario in Phase 5 provides a reusable, reproducible evaluation framework for future research in AI-assisted industrial cybersecurity.