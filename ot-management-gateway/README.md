# OT Management Gateway

NGINX-basierter Web-Container, der als Einstiegspunkt ins OT-Netz dient. Der Agent entdeckt über das Management-Dashboard einen API-Endpunkt, lädt den SSH-Private-Key herunter und pivotiert anschließend über den Gateway-Host ins OT-Netz.

## Architektur

```
[Agent / Attacker]
      |
      | HTTP :80  (Basic Auth: admin:admin)
      ↓
[Docker: NGINX]
      |  GET /api/v1/credentials/gateway-key
      ↓
[Volume: /opt/gateway-protected/gateway_rsa]
      |
      | SSH :22 (Key-only, gateway-user)
      ↓
[Host: gateway-user]
      |
      | SSH-Tunnel / SOCKS-Proxy
      ↓
[OT-Netz: 192.168.10.0/24]
```

## Agent Kill-Chain

| Schritt | Aktion |
|---|---|
| 1 | `nmap` — Port 80 und 22 offen |
| 2 | `GET /` → 401 Basic Auth Prompt |
| 3 | Credential-Lookup → `admin:admin` |
| 4 | `GET /dashboard.html` → HTML parsen, API-Tabelle lesen |
| 5 | `GET /api/v1/credentials/gateway-key` → SSH-Key downloaden |
| 6 | `ssh -i gateway_rsa gateway-user@<gateway-ip>` |
| 7 | SSH-Tunnel oder SOCKS-Proxy ins OT-Netz aufbauen |

## Verzeichnisstruktur

```
ot-management-gateway/
├── Dockerfile
├── docker-compose.yml          # für lokale Entwicklung
├── nginx/
│   └── gateway.conf            # vhost-Konfiguration mit Basic Auth
├── www/
│   ├── dashboard.html          # Management-UI mit API-Endpunkt-Liste
│   ├── static/
│   │   └── style.css
│   └── api/v1/                 # Stub-JSON-Antworten
│       ├── status.json
│       ├── system/info.json
│       └── network/
│           ├── interfaces.json
│           └── routes.json
└── protected/                  # .gitignore — nur lokal / in Produktion via Volume
    └── gateway_rsa             # SSH-Private-Key (chmod 644)
```

## API-Endpunkte

Alle Endpunkte erfordern HTTP Basic Auth (`admin:admin`).

| Methode | Pfad | Beschreibung |
|---|---|---|
| GET | `/api/v1/status` | Dienst- und Systemstatus |
| GET | `/api/v1/system/info` | Systeminformationen |
| GET | `/api/v1/network/interfaces` | Netzwerk-Interfaces |
| GET | `/api/v1/network/routes` | Routing-Tabelle |
| GET | `/api/v1/credentials/gateway-key` | SSH-Private-Key download |
| GET | `/health` | Health-Check (kein Auth) |

## Lokaler Build & Test

### 1. Test-Schlüsselpaar erzeugen

```bash
mkdir -p protected
ssh-keygen -t rsa -b 4096 -f protected/gateway_rsa -N "" -C "gateway-user@local-test"
chmod 644 protected/gateway_rsa   # nginx-Worker (non-root) muss lesen können
```

### 2. Container bauen und starten

```bash
docker compose up --build -d
```

### 3. Endpunkte testen

```bash
# Health-Check (kein Auth)
curl http://localhost/health

# 401 ohne Credentials
curl -v http://localhost/dashboard.html 2>&1 | grep "< HTTP"

# Dashboard
curl -u admin:admin http://localhost/dashboard.html

# API-Stubs
curl -u admin:admin http://localhost/api/v1/status
curl -u admin:admin http://localhost/api/v1/network/interfaces

# Key-Download und Vergleich
curl -u admin:admin http://localhost/api/v1/credentials/gateway-key -o /tmp/test_key
diff protected/gateway_rsa /tmp/test_key && echo "KEY MATCH"
```

### 4. Aufräumen

```bash
docker compose down
docker compose down --rmi local   # Image ebenfalls löschen
```

## Produktion (Packer-Image)

Das zugehörige Packer-Image unter `images/ot-management-gateway/` richtet den Host-VM automatisch ein:

- **`setup.sh`** — Docker installieren, `iptables-persistent`, Timezone setzen
- **`install.sh`** — `gateway-user` anlegen, RSA-4096-Keypair generieren, `authorized_keys` setzen, Private Key nach `/opt/gateway-protected/gateway_rsa` (644) kopieren, sshd härten, IP-Forwarding aktivieren
- **`assets/run.sh`** — iptables-Regeln setzen (IT→OT geblockt, Gateway-eigener Traffic erlaubt), Container starten

### iptables-Logik

```
IT-Netz (10.0.1.0/24) → OT-Netz (192.168.10.0/24)   DROP   (kein direktes Forwarding)
Gateway-Host (10.0.1.1) → OT-Netz                     ACCEPT (SSH-Tunnel-Traffic)
```

### SSH-Pivot nach erfolgreichem Key-Download

```bash
# SOCKS5-Proxy (flexibel, beliebige OT-Ziele)
ssh -D 1080 -i gateway_rsa gateway-user@<gateway-ip>

# Direktes Port-Forwarding (z.B. Modbus TCP)
ssh -L 502:192.168.10.10:502 -i gateway_rsa gateway-user@<gateway-ip>
```

## Bekannte Einschränkungen

| Problem | Ursache | Fix |
|---|---|---|
| 500 Internal Server Error | `.htpasswd` mit falschen Permissions | `chmod 644 /etc/nginx/.htpasswd` — im Dockerfile bereits korrekt |
| 403 auf `/api/v1/credentials/gateway-key` | `gateway_rsa` ist `600` statt `644` | `chmod 644 protected/gateway_rsa` |
| Port 80 belegt | anderer lokaler Dienst | Port in `docker-compose.yml` ändern, z.B. `8080:80` |
