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

```text
[Torque/Speed Target] 
       │
       ▼
 [Speed PI Loop] ──> iq_ref (Torque production)
                     id_ref = 0 (Constant torque region)
                            │
                            ▼
        [Decoupled d-q Current PI Regulators]
                            │
                            ▼
                   [Vd*, Vq* Saturation]
                            │
             ┌──────────────┴──────────────┐
             ▼                             ▼
   [Inverse Park (α-β)]          [Decoupling Compensation]
             │
             ▼
      [SVPWM Modulator] ──> [3-Phase Two-Level Inverter] ──> [380V PMSM Drive]
```

---

## Machine Specifications & Default Parameters

| Parameter | Symbol | Value | Unit |
| :--- | :--- | :--- | :--- |
| Nominal DC-Link Voltage | $V_{dc}$ | 380 | V |
| Peak Output Power | $P_{peak}$ | 86 | kW |
| Stator Phase Resistance | $R_s$ | 0.015 | $\Omega$ |
| d-Axis Inductance | $L_d$ | 0.12 | mH |
| q-Axis Inductance | $L_q$ | 0.15 | mH |
| Permanent Magnet Flux | $\psi_m$ | 0.055 | Wb |
| Pole Pairs | $p$ | 4 | - |
| Inverter Switching Frequency | $f_{sw}$ | 10 | kHz |

---

## Model Execution & Quick Start

1. Clone this repository:
   ```bash
   git clone [https://github.com/pradojrr/fsae-pmsm-foc-drive.git](https://github.com/pradojrr/fsae-pmsm-foc-drive.git)
   cd fsae-pmsm-foc-drive
   ```
2. Open MATLAB (R2022b or later recommended).
3. Run the parameter initialization script in the MATLAB command window:
   ```matlab
   run('scripts/init_params.m')
   ```
4. Open the Simulink traction model located at `models/pmsm_foc_drive.slx`.
5. Run the simulation to inspect torque step tracking and phase current waveforms.

---

## Author
**Ronaldo de Oliveira Prado Junior**  
Founder & Powertrain Director | F.R.O.G. Racing (Formula SAE Electric MS)  
Electrical Engineering Student | Universidade Federal de Mato Grosso do Sul (UFMS)  
- LinkedIn: [linkedin.com/in/engrpjunior](https://www.linkedin.com/in/engrpjunior)  
- GitHub: [github.com/pradojrr](https://github.com/pradojrr)
