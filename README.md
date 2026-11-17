
# 4-Requestor Round-Robin Arbiter Using Verilog

## Project Overview
This project implements a 4-requestor Round-Robin Arbiter using Verilog HDL.

An arbiter controls access to a shared resource. The round-robin technique rotates priority among requestors to ensure fair access and prevent one requestor from continuously dominating.

## Features
- Supports four requestors.
- Uses rotating priority-based arbitration.
- Ensures only one requestor is granted at a time.
- Uses an active-low asynchronous reset.
- Updates priority after each successful grant.

## Tools Used
- Verilog HDL
- ModelSim – RTL simulation
- Yosys – Logic synthesis
- OpenROAD – Physical design implementation
- Sky130HD – Standard-cell technology
- KLayout – GDS layout inspection

## Design Inputs and Outputs
| Signal | Description |
|---|---|
| clk | Clock input |
| rst_n | Active-low reset |
| req[3:0] | Four request inputs |
| grant[3:0] | Four grant outputs |

## Simulation
The design was verified using a Verilog testbench in ModelSim.

Test cases include:
- All four requestors requesting simultaneously.
- Only requestors 0 and 2 requesting.
- No request being active.
- Continuous request and priority rotation.

When all four requestors are active, the grant sequence is:

`0001 → 0010 → 0100 → 1000`

## Physical Design Results
The design was synthesized using Yosys and implemented using OpenROAD with the Sky130HD platform.

| Parameter | Result |
|---|---:|
| Clock period | 10 ns |
| Critical path delay | 3.5697 ns |
| Critical path slack | 4.4303 ns |
| Estimated power | 0.326 mW |
| Synthesis cell area | 586.8128 µm² |
| Reported DRC violations | 0 |

*Power is an estimate from the physical design report. DRC result refers to the reported DRC count.*

## Physical Design Flow
RTL Design → Synthesis → Floorplanning → Placement → Clock Tree Synthesis → Routing → GDS Generation → DRC

## Repository Structure
- `rtl/` – Verilog RTL design
- `testbench/` – Simulation testbench
- `constraints/` – Timing constraint file

## Future Improvements
- Add parameterized support for more requestors.
- Explore different arbitration architectures.
- Perform further timing and area optimization.
