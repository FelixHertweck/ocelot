# SMA Inverter Emulator

A Modbus TCP emulator of an SMA solar inverter, built with Java and [j2mod](https://github.com/steveohara/j2mod). It exposes a subset of realistic SMA registers and runs a background simulation loop that generates dynamic telemetry. Designed as a deterministic, observable target for attack scenario deployments in the CAVE testbed.

## Registers

| Address | Name | Type | Function Code | Description |
|---|---|---|---|---|
| 30201 | `Condition` | U32 | FC04 | Device health — `307` (Ok) / `35` (Fault) |
| 30517 | `Metering.DyWhOut` | U64 | FC04 | Daily energy yield in Wh |
| 30775 | `GridMs.TotW` | S32 | FC04 | Total AC active power in W |
| 40000 | E-Stop control | U16 | FC03/FC16 | Write `1` to trigger Emergency Stop |

Telemetry registers (3xxxx) are read-only input registers (FC04). The E-Stop register (4xxxx) is a writable holding register (FC03/FC16).

## Emergency Stop Behaviour

When `1` is written to register 40000, the emulator transitions on the next simulation tick (≤ 1 s):

- `Condition` → `35` (Fault)
- `GridMs.TotW` → `0`

## REST API

The emulator exposes a REST API on port `8080` (configurable via `REST_PORT` env var).

### `GET /status`

Returns the current emulator state.

```json
{
  "emergencyStop": false,
  "health": "OK",
  "powerW": 14823,
  "dailyYieldWh": 1234
}
```

`health` is `"OK"`, `"FAULT"`, or `"UNKNOWN"` (if the register holds an unexpected value).

### `POST /reset`

Clears the emergency stop and restores normal operation.

```bash
curl -X POST http://localhost:8080/reset
# → {"status":"ok"}
```

After a successful reset the simulation loop resumes power fluctuation on the next tick (≤ 1 s).

## Running

```bash
# Default port 502 (requires root / CAP_NET_BIND_SERVICE)
java -jar target/inverter-emulator-*-jar-with-dependencies.jar

# Custom port
java -jar target/inverter-emulator-*-jar-with-dependencies.jar 1502
```

Or via Docker:

```bash
docker run --rm -p 502:502 -p 8080:8080 ghcr.io/felixhertweck/ocelot-inverter-emulator:main
```

## Building

```bash
mvn package
```
