# OT Proxy

A protocol-agnostic security proxy for OT devices. It sits between clients and a real OT device, inspecting every request through a configurable rule engine before forwarding it upstream.

```
Client → [Proxy Listener] → [Pipeline] → [Upstream Connector] → OT Device
                                 ↑
                           [Rule Engine]
                                 ↑
                           [YAML Config]
```

**Supported protocols**

| Protocol | Writes filterable | Reads filterable | Notes |
|---|---|---|---|
| Modbus TCP | Yes | Yes | Full rule engine support |
| IEC 61850 (MMS) | Yes | **No** | See [IEC 61850 limitations](#iec-61850-limitations) |

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
java -jar target/otproxy-*-jar-with-dependencies.jar path/to/proxy-config.yml
```

Without an argument the proxy falls back to the bundled `proxy-config.yml`.

## Test

```bash
mvn test
```

## Configuration

### Protocol selection

```yaml
proxy:
  protocol: modbus      # modbus (default) | iec61850
  listen:
    host: 0.0.0.0
    port: 5020
  upstream:
    host: 192.168.1.10
    port: 502
```

### Modbus TCP example

```yaml
proxy:
  protocol: modbus
  listen:
    host: 0.0.0.0
    port: 5020
  upstream:
    host: 192.168.1.10
    port: 502

rules:
  default_action: DENY          # DENY | ALLOW — applies to writes for unconfigured targets
  default_read_action: ALLOW    # DENY | ALLOW — applies to reads for unconfigured targets (default: ALLOW)
  default_violation_action: MODBUS_EXCEPTION  # action used when default_action/default_read_action blocks

  nodes:
    - target: "100"             # Modbus register address as string
      description: "Pump speed setpoint"
      allow_write: true
      value_range:
        min: 0
        max: 1500
      rate_limit:
        max_writes: 10
        per_seconds: 60
      on_violation: MODBUS_EXCEPTION

    - target: "200"
      description: "Emergency stop (read-only)"
      allow_read: true          # default: true
      allow_write: false
      on_violation: DISCONNECT
```

### IEC 61850 example

```yaml
proxy:
  protocol: iec61850
  listen:
    host: 0.0.0.0
    port: 102
  upstream:
    host: 192.168.1.20
    port: 102

rules:
  default_action: DENY

  nodes:
    - target: "simpleIOGenericIO/GGIO1.SPCSO1.ctlModel"
      description: "Control output 1"
      allow_write: true
      on_violation: MODBUS_EXCEPTION

    - target: "simpleIOGenericIO/GGIO1.SPCSO2.ctlModel"
      description: "Control output 2 (blocked)"
      allow_write: false
      on_violation: MODBUS_EXCEPTION
```

The `target` field is the full IEC 61850 object reference as returned by `bda.getReference().toString()`.

### Node configuration fields

| Field | Type | Default | Description |
|---|---|---|---|
| `target` | string | — | Register address (Modbus) or object reference (IEC 61850) |
| `description` | string | `""` | Human-readable label, not evaluated |
| `allow_read` | bool | `true` | Whether reads are permitted (Modbus only — see limitations) |
| `allow_write` | bool | `false` | Whether writes are permitted |
| `value_range.min` | number | — | Minimum allowed write value |
| `value_range.max` | number | — | Maximum allowed write value |
| `rate_limit.max_writes` | int | — | Maximum write count within the time window |
| `rate_limit.per_seconds` | int | — | Time window in seconds for rate limiting |
| `on_violation` | string | `MODBUS_EXCEPTION` | Action on rule violation |

### Violation actions

| Action | Modbus behaviour | IEC 61850 behaviour |
|---|---|---|
| `MODBUS_EXCEPTION` | Returns Modbus exception code 01 to client | Returns `ACCESS_VIOLATION` service error |
| `SILENT_DROP` | Drops the request, no response | Returns `ACCESS_VIOLATION` service error |
| `DISCONNECT` | Closes the client TCP connection | Logs a warning; **connection close not supported** by iec61850bean's `ServerEventListener` — use `MODBUS_EXCEPTION` instead |

### Backwards compatibility

Old Modbus configs that use `registers` / `address` still load:

```yaml
rules:
  registers:           # alias for nodes
    - address: 100     # alias for target (converted to string)
      allow_write: true
```

## IEC 61850 limitations

### Read filtering not supported

The iec61850bean `ServerEventListener` interface only provides a `write()` callback. There is no equivalent callback for read requests — reads are handled internally by the `ServerSap` and forwarded to clients transparently. As a result:

- `allow_read: false` has **no effect** for IEC 61850 nodes.
- `default_read_action: DENY` has **no effect** for IEC 61850.
- Read access control for IEC 61850 must be implemented at a lower level (e.g. SCL access control, network segmentation).

### Client IP not available

The `ServerEventListener.write()` callback does not expose the client's IP address. The proxy logs `0.0.0.0` as the source IP for all IEC 61850 write events. IP-based rules are therefore not applicable.

### DISCONNECT action not supported per-client

The iec61850bean API does not provide a way to close a specific client connection from within the `write()` callback. When a rule with `on_violation: DISCONNECT` is triggered, the proxy logs a warning and returns `ACCESS_VIOLATION` instead.

## Docker

**Build image** (JAR must be built first):

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
