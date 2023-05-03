## Hardware-based GCD Calculator using Finite State Machine and Datapath
This project implements a hardware-based Greatest Common Divisor (GCD) calculator using an FSMD (Finite State Machine with Datapath) structure. The algorithm utilizes a simple iterative method of finding the GCD of two numbers by continuously subtracting the smaller number from the larger one until both numbers are equal. The implementation uses an FSM to generate control signals that direct the datapath to perform the necessary operations.

## Contents

- [Project Description](#project-description)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Testing](#testing)
- [Contributing](#contributing)

## Project Structure
The project includes the following files:
.
├── '''gcd_controller.v  # RTL implementation of the controller module
├── gcd_datapath.v    # RTL implementation of the datapath module
├── gcd_top.v         # RTL implementation of the top module that combines the controller and datapath
├── gcd_testbench.v   # Simple testbench that checks the results for at least 2 sets of inputs
└── README.md         # This README file

## Usage
To use this project, you can clone this repository and open the RTL files in your preferred FPGA development environment. You can modify the RTL files as needed for your specific use case.

## Testing
The gcd_testbench.v file includes a simple testbench that checks the results for at least 2 sets of inputs. To run the testbench, you can simulate the design in your preferred FPGA development environment.
