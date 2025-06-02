

# Vivado BRAM Projects

This repository contains two Vivado projects demonstrating Block RAM (BRAM) usage in FPGA designs:

- **BRAM_instantiation**: Single-port BRAM instantiation and simulation.
- **dual_port_bram**: Dual-port BRAM instantiation and simulation.

## Directory Structure

- BRAM_instantiation/
  - ├── BRAM_instantiation.xpr         # Vivado project file
  - ├── BRAM_instantiation.srcs/       # Source files (RTL and testbenches)
  - ├── BRAM_instantiation.sim/        # Simulation files and scripts
  - └── ...                            # Other Vivado-generated files

- dual_port_bram/
   - ├── dual_port_bram.xpr             # Vivado project file
   - ├── dual_port_bram.srcs/           # Source files (RTL and testbenches)
   - ├── dual_port_bram.sim/            # Simulation files and scripts
   - └── ...                            # Other Vivado-generated files

## Source Files

- **BRAM_instantiation**
  - RTL: `BRAM_instantiation.srcs/sources_1/new/bram.sv`
  - Testbench: `BRAM_instantiation.srcs/sim_1/new/tb_bram.sv`

- **dual_port_bram**
  - RTL: `dual_port_bram.srcs/sources_1/new/block_ram_dual_port.sv`
  - Testbench: `dual_port_bram.srcs/sim_1/new/tb_bram_dual_port.sv`

## How to Simulate

Each project includes scripts for compiling and simulating the design using Vivado's XSim simulator.

### 1. Open a Terminal

Navigate to the simulation directory for the desired project:

```sh
cd xsim
# or
cd xsim
```

### 2. Compile the Design

```sh
compile.sh
```

### 3. Run the Simulation

```sh
simulate.sh
```

Simulation results and waveforms will be generated in the same directory.

## Requirements

- Vivado 2024.2 or compatible version
- Bash shell for running scripts

## Notes

- The `.xpr` files can be opened directly in Vivado for GUI-based development.
- All source and testbench files are written in SystemVerilog.
