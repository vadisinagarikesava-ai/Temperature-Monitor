Temperature Monitor

Description

A simple Verilog-based digital temperature monitoring system that checks an 8-bit temperature input and indicates whether the temperature is LOW, NORMAL, or HIGH.

Features

- 8-bit temperature input
- Configurable low-temperature limit
- Configurable high-temperature limit
- Synchronous operation using a clock
- Reset input
- LOW, NORMAL, and HIGH status outputs

Temperature Conditions

Temperature| Status
Below 20°C| LOW
20°C to 30°C| NORMAL
Above 30°C| HIGH

Files

temperature-monitor/
├── README.md
├── temperature_monitor.v
├── temperature_monitor_tb.v
└── simulation_output.txt

Inputs

- "clk" – System clock
- "reset" – Active-high reset
- "temperature[7:0]" – Temperature value in °C

Outputs

- "low_temp" – Indicates low temperature
- "normal_temp" – Indicates normal temperature
- "high_temp" – Indicates high temperature

Simulation

The testbench applies different temperature values:

- 15°C → LOW
- 25°C → NORMAL
- 35°C → HIGH
- 20°C → NORMAL
- 30°C → NORMAL

Tools

This project can be simulated using:

- Icarus Verilog
- GTKWave
- ModelSim
- Vivado

How to Run

Using Icarus Verilog:

iverilog -o temperature_monitor_sim temperature_monitor.v temperature_monitor_tb.v
vvp temperature_monitor_sim

For waveform generation, add "$dumpfile" and "$dumpvars" to the testbench and open the generated VCD file using GTKWave.

Expected Result

The monitor correctly identifies the temperature condition and activates only the corresponding status output.

Author

Temperature Monitor – Digital Hardware/Verilog Project
