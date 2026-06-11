# OT Proxy

A protocol-agnostic proxy for OT devices that enforces write-access rules via a YAML config. Currently supports Modbus TCP; the pipeline architecture is designed to accommodate additional protocols (e.g. IEC 61850) as new adapters.

```
Client → [Proxy Listener] → [Pipeline] → [Upstream Connector] → Modbus Device
                                 ↑
                           [Rule Engine]
                                 ↑
                           [YAML Config]
```

## Requirements

- Java 21+
- Maven 3.9+
- Docker (optional)

## Build

```bash
mvn package
```

The fat JAR lands at `target/otproxy-<version>-jar-with-dependencies.jar`.

To skip tests:

```bash
mvn package -DskipTests
```

## Run

```bash
java -jar target/otproxy-*-jar-with-dependencies.jar src/main/resources/proxy-config.yml
```

Without an argument the proxy looks for `proxy-config.yml` in the working directory.

## Test

```bash
mvn test
```

## Configuration

Edit `src/main/resources/proxy-config.yml` (or supply your own file at startup):

```yaml
proxy:
  listen:
    host: 0.0.0.0
    port: 5020          # port the proxy listens on
  upstream:
    host: 192.168.1.10  # real Modbus device
    port: 502

rules:
  default_action: DENY           # block everything not explicitly listed
  default_on_violation: MODBUS_EXCEPTION  # fallback action when none is set closer to the rule

  # Read/write fallback for registers without their own read/write block.
  default_rate_limit:
    write:
      max_requests: 1
      per_millis: 100
      on_violation: MODBUS_EXCEPTION
    read:
      max_requests: 10
      per_millis: 1000
      on_violation: MODBUS_EXCEPTION

  registers:
    - address: 100
      description: "Pump speed setpoint"
      allow_write: true
      value_range:
        min: 0
        max: 1500
      write:                  # overrides default_rate_limit.write for this register
        max_requests: 10
        per_millis: 60000     # sliding window in milliseconds
      read:                   # overrides default_rate_limit.read for this register
        max_requests: 50
        per_millis: 1000
      on_violation: MODBUS_EXCEPTION   # MODBUS_EXCEPTION | SILENT_DROP | DISCONNECT

    - address: 200
      description: "Emergency stop (read-only)"
      allow_write: false
      on_violation: DISCONNECT
```

### Rate limiting

Every rate limit has the same shape — `max_requests` per sliding window of
`per_millis` milliseconds, plus an optional `on_violation` — and is tracked
**per register address**, separately for reads and writes:

- A register's own `read` / `write` block applies first.
- `rules.default_rate_limit.read` / `.write` is the fallback for registers
  without their own block.

Omit a block to leave that direction unthrottled.

### Violation action resolution

`on_violation` is one of `MODBUS_EXCEPTION` | `SILENT_DROP` | `DISCONNECT`.
**Register-level settings always override global defaults.** The exact chain depends
on whether the register has its own rate-limit block:

| Scenario | Resolution order |
|---|---|
| Register has its own `read`/`write` block | rate-limit `on_violation` → register `on_violation` → `default_on_violation` → `MODBUS_EXCEPTION` |
| Register uses `default_rate_limit` | register `on_violation` → `default_rate_limit` `on_violation` → `default_on_violation` → `MODBUS_EXCEPTION` |
| Unlisted register (default action) | `default_on_violation` → `MODBUS_EXCEPTION` |

### Violation actions

| Action | Behaviour |
|---|---|
| `MODBUS_EXCEPTION` | Returns Modbus exception code to client |
| `SILENT_DROP` | Drops the request silently |
| `DISCONNECT` | Closes the client connection |

## Docker

**Build image** (JAR muss vorher gebaut sein):

```bash
mvn package -DskipTests
docker build -t ot-proxy .
```

**Run with the bundled default config:**

```bash
docker run -p 5020:5020 ot-proxy
```

**Run with a custom config mounted from the host:**

```bash
docker run -p 5020:5020 \
  -v /path/to/your/proxy-config.yml:/app/proxy-config.yml \
  ot-proxy
```
