# Kali-Agent (noVNC + MCP)

These build scripts build an updated Kali VM intended to host AI Agents locally. It features a lightweight Web-VNC solution using [noVNC](https://novnc.com/) and provides Model Context Protocol (MCP) servers so AI agents can execute Kali tools directly.

After the deployment, the noVNC interface can be reached via `https://[IP Address]:6080/vnc.html` with the default VNC credentials `kali:kali`.
Note: The connection uses a self-signed certificate, so you might need to accept a security warning in your browser.

## Features

- **noVNC (HTTPS):** Extremely lightweight web-based VNC (no Guacamole/Tomcat overhead), secured with a self-signed SSL certificate.
- **Passwordless Sudo:** The user `kali` is added to sudoers without password prompt for seamless Agent execution.
- **MCP Enabled:** Pre-installed `mcp-kali-server` and Node.js environment to let local agents execute terminal commands easily.
- **Tools:** Includes Nmap, Metasploit, SQLMap, Wireshark, Powershell-Empire and various other standard toolings.

## Bootstrapping 

Since Kali does not provide a really useful pre-build image which can be used to bootstrap this machine, we recommend using the Kali cloud image or importing the most recent release as a qcow2.
