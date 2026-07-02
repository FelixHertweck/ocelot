from pyModbusTCP.client import ModbusClient
import os

host = os.getenv("HOST", "10.1.2.15")
port = int(os.getenv("PORT", "502"))
client = ModbusClient(host=host, port=port, unit_id=3)

# Operation.PvGriConn (30881) – PV mains connection
# 1779 = Separated  => Emergency stop active
# 1780 = Public grid => Running and feeding in
# 1781 = Island mains
grid_conn_mapping = {
    1779: "Separated (emergency stop active)",
    1780: "Connected to grid (running)",
    1781: "Island mains",
}

result = client.read_input_registers(30881, 2)
if result:
    status_code = result[1]
    status_name = grid_conn_mapping.get(status_code, f"Unknown ({status_code})")
    print(f"Inverter Status: {status_name} (Code: {status_code})")
else:
    print("Error reading status register")

client.close()