# IEC 61850 Protection Relay Emulator

A software-emulated IEC 61850 protection relay built with Java and [iec61850bean](https://github.com/beanit/iec61850bean). It exposes a realistic IED data model (PTOC, XCBR, MMXU) over MMS and runs a background simulation that generates dynamic telemetry. Designed as a deterministic, observable target for attack scenario deployments in the CAVE testbed.

## IED Data Model

IED name: `RelayIED` — Logical Device: `PROT` — full reference prefix: `RelayIEDPROT`

| LN Class | Instance | Description |
|----------|----------|-------------|
| `LLN0`   | `LLN0`   | Logical node zero (LD-level administration) |
| `LPHD`   | `LPHD1`  | Physical device information |
| `PTOC`   | `PTOC1`  | Time overcurrent protection function |
| `XCBR`   | `XCBR1`  | Circuit breaker control |
| `MMXU`   | `MMXU1`  | Measurements (voltage, current, power, frequency) |

### Key Data Attributes

| Object Reference | FC | Description |
|------------------|----|-------------|
| `RelayIEDPROT/XCBR1.Pos.stVal` | ST | Breaker position (Dbpos: 1=open, 2=closed) |
| `RelayIEDPROT/XCBR1.Pos.ctlModel` | CF | Control model (1 = direct-with-normal-security) |
| `RelayIEDPROT/MMXU1.Hz.mag.f` | MX | Grid frequency (Hz) |
| `RelayIEDPROT/MMXU1.TotW.mag.f` | MX | Total active power (W) |
| `RelayIEDPROT/MMXU1.PPV.phsAB.cVal.mag.f` | MX | Phase AB voltage (V) |
| `RelayIEDPROT/PTOC1.Str.general` | ST | Overcurrent pickup signal |
| `RelayIEDPROT/PTOC1.Op.general` | ST | Overcurrent operate signal |

## Circuit Breaker Behaviour

The breaker starts **closed** on every container start. It uses `direct-with-normal-security` control model — no Select step required.

**To open:** issue `Control.Operate(ctlVal=false)` on `RelayIEDPROT/XCBR1.Pos`.  
**To close:** issue `Control.Operate(ctlVal=true)` on `RelayIEDPROT/XCBR1.Pos`.

The breaker is never opened automatically. PTOC fault indicators (`Str.general`, `Op.general`) are simulated periodically but do not trip the breaker.

## Dynamic Simulation

- **Measurements** update every 2 seconds with realistic random values around nominal (50 Hz, ~1000 W, ~400 V). Power and current drop to near zero when the breaker is open.
- **PTOC fault events** occur randomly (30% chance every 30 s after a 15 s initial delay), toggling `Str.general` and `Op.general` without affecting the breaker state.

## REST API

A lightweight HTTP server runs alongside the MMS server to support test lifecycle management.

### `GET /status`

Returns the current emulator state.

```bash
curl http://localhost:8080/status
```

```json
{
  "breakerClosed": true,
  "ptocStart": false,
  "ptocOperate": false,
  "frequencyHz": 50.02,
  "totalPowerW": 1023.5,
  "currentA": {"phsA": 100.1, "phsB": 99.3, "phsC": 101.2},
  "voltageV": {"phsAB": 400.1, "phsBC": 401.0, "phsCA": 399.5}
}
```

### `POST /reset`

Resets the emulator to its initial state:
- Closes the circuit breaker (`XCBR1.Pos.stVal` → 2/closed)
- Clears PTOC indicators (`Str.general`, `Op.general` → false)

```bash
curl -X POST http://localhost:8080/reset
# {"status":"ok"}
```

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `IEC61850_PORT` | `102` | MMS TCP port |
| `REST_PORT` | `8080` | REST API port |

## Running

```bash
docker run --rm -p 102:102 -p 8080:8080 \
  ghcr.io/felixhertweck/ocelot-protection-relay-emulator:main
```

Or via Docker Compose:

```bash
docker compose up
```

## Building

```bash
mvn package
```
