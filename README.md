# Smart Traffic System 🚦

A VHDL-based smart traffic intersection management system implemented on the **BASYS3 FPGA board**, designed to improve urban traffic control, safety, and real-time monitoring. The system controls traffic lights, detects violations, and displays environmental data using integrated sensors and a 7-segment display.

---

## 🧠 Project Overview

This project simulates a **4-way traffic intersection** with intelligent control over vehicle and pedestrian signals. It uses **ultrasonic sensors** to detect red-light violations, a **DHT11 temperature sensor** to monitor environmental conditions, and an **alarm buzzer** to alert in case of violations. All control logic is implemented in **VHDL** and tested on a **BASYS3 FPGA board**.

---

## 🔧 System Features

### 🚦 Traffic Light Control
- **Vehicle Traffic Lights**: Red, yellow, and green lights on all four directions.
- **Pedestrian Signals**: Separate red/yellow/green lights, synchronized with vehicle lights.

### 📏 Violation Detection
- **4 Ultrasonic Sensors** monitor vehicles in each direction.
- If a vehicle is detected crossing on red, an **alarm buzzer** is triggered.

### 🌡️ Temperature Monitoring
- **DHT11 sensor** measures ambient temperature.
- Real-time temperature is displayed on the **7-segment display**.

### ⚡ 220V Light Control
- Vehicle and pedestrian lights operate on 220V via **relay interface**.
- FPGA handles low-voltage control logic, safely connected through relays.

---

## 🔌 Hardware Components

- **BASYS3 FPGA board**
- **4x Ultrasonic sensors (HC-SR04)**
- **DHT11 temperature sensor**
- **220V red/yellow/green LEDs (8 each)**
- **2-channel 4x relay module**
- **Buzzer for violations**
- **Breadboard, MM/MF jumper wires, and power supply**

---

## 🧱 Intersection Design

- Each of the four streets has:
  - Two lanes (one in each direction)
  - Vehicle traffic lights
  - Pedestrian crossing signals
- All signals are synchronized to avoid car-pedestrian conflict.

---

## 📊 Functional Flow

1. **Initialization**
   - System waits for start signal.
   - LEDs and sensors are initialized.

2. **Traffic Control Cycle**
   - Horizontal street: green → yellow → red
   - Vertical street: red → green → yellow
   - Timed logic ensures safe transitions (10s green, 3s yellow)

3. **Violation Monitoring**
   - While red light is active:
     - If ultrasonic sensor detects a car → buzzer is activated

4. **Temperature Reading**
   - DHT11 sensor sends temperature to FPGA.
   - Displayed using 7-segment module via `Segment_Control.vhd`.

---

## 🛠️ VHDL Modules

| Module               | Description                                                                 |
|----------------------|-----------------------------------------------------------------------------|
| `Main.vhd`           | Top-level module integrating all subsystems                                 |
| `LEDs_Control.vhd`   | Controls the traffic light timing and synchronization                       |
| `Ultrasonic_Sensor.vhd` | Manages distance measurement and triggers alarms on violations           |
| `Temp_Sensor.vhd`    | Interfaces with DHT11 sensor and extracts temperature data                  |
| `Segment_Control.vhd`| Displays the temperature on a 4-digit 7-segment display                     |
| `MainTB.vhd`         | Testbench for simulating the full system                                    |

---

## 📺 Display & Output

- **7-Segment Display**: Shows current temperature (in Celsius).
- **BASYS3 LEDs**: Indicate system states.
- **Buzzer**: Active during red-light violations.

---

## 🧪 Testing & Simulation

- Full simulation done using VHDL testbench (`MainTB.vhd`)
- Test scenarios:
  - Traffic light timing correctness
  - Alarm functionality under different signal phases
  - DHT11 temperature reading verification
  - Integration test with all modules active

---

## 👨‍💻 Team Members

| Name                  | Role                  |
|-----------------------|------------------------|
| Ahmed Tarek Husseini | VHDL Logic & Integration |
| Ahmed Hossam Badran    | Sensor Control & Testing |
| Mohamed Mohsen Abu Ayyad | Display Logic & TB Design |
| Mohamed Yasser Ahmed   | Hardware Implementation |
| Hamza Sherif Mansour   | System Architecture |
| Zyad Mohamed Naguib    | Alarm System Design |

---

## 🏁 Future Enhancements

- Add dynamic traffic light duration based on traffic density
- Integrate pedestrian push buttons
- Implement real-time logging and serial interface
- Expand to 3-lane support and real-world deployment
