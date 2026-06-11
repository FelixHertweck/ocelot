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
  default_action: DENY  # block everything not explicitly listed

  # Write throttle for registers without their own rate_limit (per-register overrides).
  default_rate_limit:
    max_writes: 1
    per_millis: 100

  # Global throttle for all read requests (ms window).
  read_rate_limit:
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
      rate_limit:
        max_writes: 10
        per_millis: 60000   # sliding window in milliseconds
      on_violation: MODBUS_EXCEPTION   # MODBUS_EXCEPTION | SILENT_DROP | DISCONNECT

    - address: 200
      description: "Emergency stop (read-only)"
      allow_write: false
      on_violation: DISCONNECT
```

### Rate limiting

`rate_limit` enforces at most `max_writes` writes per sliding window of
`per_millis` milliseconds, tracked **per register address**. Define
`default_rate_limit` under `rules` to apply a baseline to every writable
register; a register's own `rate_limit` takes precedence, and registers without
either are unthrottled.

`read_rate_limit` applies the same sliding-window mechanism to **all read
(non-write) requests** as a single global window (shared across registers and
clients), independent of the write limits. `max_requests` is the cap per
`per_millis` window; `on_violation` (`MODBUS_EXCEPTION` | `SILENT_DROP` |
`DISCONNECT`) controls what happens when it is exceeded. Omit the block to leave
reads unthrottled.

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
