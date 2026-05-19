# ADR: Underlying Cloud Infrastructure (MicroStack over DevStack)

**Date:** April 8, 2026  
**Status:** Accepted  
**Context Area:** Cloud Infrastructure, CAVE Framework Deployment, OpenStack

## 1. Context and Problem Statement
To support our Infrastructure-as-Code (IaC) testbed deployments via the CAVE framework and OpenTofu, we require an underlying local OpenStack environment running on a single-node server. This server must host the attacker VMs, the emulated OT endpoints, and handle the routing to the physical hardware-in-the-loop devices.

The official CAVE documentation recommends using **DevStack** for local deployments. We needed to evaluate whether to follow this recommendation or use **MicroStack** to ensure the stability and reproducibility required for our research lifecycle.

## 2. Decision
We will use **MicroStack** (deployed via Snap) instead of **DevStack** to provision the single-node OpenStack environment.

## 3. Rationale

### 3.1. Stability and Reproducibility
**DevStack** installs directly from the latest upstream Git repositories. Its state can change unexpectedly, making the installation highly prone to breaking. The official DevStack documentation explicitly warns that it is designed for OpenStack developers and ephemeral Continuous Integration (CI) pipelines, not for persistent, long-running deployments. Additionally, DevStack requires re-running the installation script after every server restart.

In contrast, **MicroStack** provides a pre-packaged, stable environment. Since our single-node server needs to run reliably for the entire duration of the project (to ensure experimental reproducibility for Phases 1 through 5), MicroStack is the significantly more robust and long-lasting solution.

### 3.2. Host System Isolation
MicroStack packages the OpenStack services within an isolated Snap environment. This guarantees that OpenStack dependencies will not interfere with the host system's existing packages or our specific `devenv` setup. DevStack, operating directly on the host, poses a much higher risk of dependency conflicts.

### 3.3. Reduced Configuration Overhead
MicroStack handles much of the configuration automatically out-of-the-box. Many of the manual adjustments required when deploying CAVE with DevStack—such as configuring networking bridges, tuning API limits, and setting resource quotas—are drastically simplified or abstracted away by MicroStack, accelerating our infrastructure setup time.

## 4. Consequences

### Positive
* **Persistent Uptime:** The server can be rebooted without breaking the OpenStack installation or requiring manual re-initialization scripts.
* **Consistent Baselines:** The Snap package guarantees that the OpenStack version remains identical across all project phases, preventing upstream Git updates from altering our testbed behavior mid-research.
* **Faster Provisioning:** Reduced manual configuration allows us to focus entirely on the CAVE/OpenTofu configurations rather than debugging OpenStack networking.

### Negative / Trade-offs
* **Deviation from Documentation:** We deviate from the official CAVE framework recommendation, meaning some CAVE-specific DevStack integration tutorials may not apply perfectly 1:1 and might require slight adaptations.

***

## 5. Implementation / Quick OpenStack Setup Guide

To ensure reproducibility, the deployment procedure for the MicroStack environment is documented below:

### 1. Install MicroStack
Install the MicroStack beta package via Snap:
```bash
sudo snap install microstack --beta
```

### 2. Initialize Control Node
Initialize the environment automatically as a control node (Note: This takes about 10-15 minutes):
```bash
sudo microstack init --auto --control
```

### 3. Get Admin Password
Retrieve the `keystone-password` to log in as the admin user:
```bash
sudo snap get microstack config.credentials.keystone-password
```

### 4. Configure Hostname Resolution
To ensure that the URLs in the OpenRC file and API endpoints resolve correctly, add **openstack** to your local hosts file:
```bash
sudo sh -c 'echo "127.0.0.1 openstack" >> /etc/hosts'
```

### 5. Port Forwarding & Access
Set up SSH port forwarding to map the remote server's port `443` to your local port `8080`:
```bash
ssh -L 8080:localhost:443 user@your-server-ip
```

Once the tunnel is established, access the OpenStack dashboard in your local browser at:
`https://localhost:8080`

Log in using the username **admin** and the password retrieved in Step 3.