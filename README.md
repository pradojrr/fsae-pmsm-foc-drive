# High-Voltage PMSM Field-Oriented Control (FOC) Drive Architecture

Model-Based Design (MBD) and simulation of a closed-loop traction drive for an 86 kW Permanent Magnet Synchronous Motor (PMSM), engineered for high-performance electric motorsport (Formula SAE) and high-voltage hybrid powertrain applications.

---

## Technical Highlights
- **High-Voltage Architecture:** Tuned for a 380V DC-link bus accumulator stage.
- **Decoupled Current Regulation:** Inner-loop d-q vector current tracking via tuned proportional-integral (PI) controllers with anti-windup.
- **Space Vector PWM (SVPWM):** Voltage vector sector determination maximizing DC bus utilization by ~15.5% compared to sinusoidal PWM.
- **Fast Dynamic Response:** Current loop bandwidth set to 1.0 kHz to deliver transient torque responses required for competitive track performance.

---

## Control Architecture Overview
