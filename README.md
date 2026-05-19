# Aegis Grid: AI-Driven Multi-Agent System for ICS Exploitation

Current monolithic Large Language Models (LLMs) often fail at executing multi-step attacks on Industrial Control Systems (ICS). This project implements a LangGraph-based multi-agent system specifically tailored for testing energy hardware OT devices. 

It provides an Infrastructure-as-Code (IaC) testbed that dynamically loads attack scenarios against standard base images (using physical hardware and custom software emulations).

**Note:** This is a research project. Detailed documentation, including Architectural Decision Records (ADRs) and the project proposal, can be found in the `docs/` folder.

## Project Structure

* **`.github/`**: GitHub Actions workflows for CI/CD.
* **`config/`**: Configuration files for the cave deployment.
* **`docs/`**: Project documentation.
  * **`adrs/`**: Architecture Decision Records.
* **`images/`**: Packer configurations to build the VM images for the ICS testbed (inspired by `cave-infrastructure-docker`).
  * **`attacker/`**: Attacker image — installs Kali Linux with VNC, noVNC, MCP server, AI agent tooling, and scenario-specific attack tools. Must be built for the attacker VM.
* **`src/`**: Source code for the AI agents and knowledge graph.
  * **`agents/`**: LangGraph orchestration, Recon Agent, and Execution Agent.
  * **`kg/`**: Knowledge Graph integration and schema definitions.
* **`tests/`**: Unit and integration tests for agents and emulators.

## Getting Started

*(Instructions for setting up the environment, building the packer images, and running the LangGraph agents will be added here).*
