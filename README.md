## Hardware-based GCD Calculator using Finite State Machine and Datapath
This project implements a hardware-based Greatest Common Divisor (GCD) calculator using an FSMD (Finite State Machine with Datapath) structure. The algorithm utilizes a simple iterative method of finding the GCD of two numbers by continuously subtracting the smaller number from the larger one until both numbers are equal. The implementation uses an FSM to generate control signals that direct the datapath to perform the necessary operations.

## Contents

- [Project Description](#project-description)
- [Algorithm](# Algorithm)
- [Usage](#usage)
- [Testing](#testing)
- [Contributing](#contributing)

## Algorithm
```
while (1) {
while (!start);
while (A != B) {
if (A > B) {
A = A - B;
}
else { // A < B
B = B - A;
}
}
res = A; // or res = B because they should be equal
}
```
## Usage
To use this project, you can clone this repository and open the RTL files in your preferred FPGA development environment. You can modify the RTL files as needed for your specific use case.

## Testing
The gcd_testbench.v file includes a simple testbench that checks the results for at least 2 sets of inputs. To run the testbench, you can simulate the design in your preferred FPGA development environment.
