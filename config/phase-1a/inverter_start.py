from pyModbusTCP.client import ModbusClient
import os

host = os.getenv("HOST", "10.1.1.15")
port = int(os.getenv("PORT", "502"))

client = ModbusClient(host=host, port=port, timeout=10.0, unit_id=3)

# holding register 40018 = Inverter.FstStop
# values: [0, 381] => Stop
#         [0, 1467] => Start
#         [0, 1749] => Full stop (FulStop)
for i in range(3, 0, -1):
    result = client.write_multiple_registers(40018, [0, 1467])
    print(i, result)
    if result:
        break
    else:
        client.close()

client.close()