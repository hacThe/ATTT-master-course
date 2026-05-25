# Week 2 – Edge Intelligence I: TinyML for IoT Devices

## 🎯 Core Idea
Rather than shipping raw sensor data to the cloud, **TinyML** brings machine learning inference directly onto microcontrollers (MCUs). The key insight is that **deployment constraints drive every design decision** — model architecture, training strategy, data pipeline, and runtime are all co-designed for the target hardware.

---

## 📌 Key Concepts

### Why Move Intelligence to the Edge?
| Driver | Problem Solved |
|--------|---------------|
| **Latency** | Control/safety loops need millisecond responses — cloud round-trips can't guarantee that |
| **Bandwidth** | Edge extracts only events/features, transmitting distilled insights instead of raw streams |
| **Energy** | Radio TX is expensive; local inference reduces radio usage |
| **Privacy** | Sensitive data stays on device; less attack surface |
| **Resilience** | Works offline; cloud becomes supportive, not critical |

### The TinyML Workflow (End-to-End)
```
Problem Definition → Data Collection → Preprocessing → Feature Extraction
→ Model Development → Training → Optimisation → Firmware Integration → Inference
```

#### Step-by-Step Detail
1. **Problem Definition**: Classify? Detect? Regress? Set latency/memory/energy budgets.
2. **Data Collection**: Representative, real-world conditions; address class imbalance; preserve temporal structure.
3. **Preprocessing**: Denoise, normalize, align sampling rates; use deterministic/integer-friendly ops (must match training exactly at deploy time).
4. **Feature Extraction**: Frequency-domain features, statistical summaries; reduces model complexity.
5. **Model Development**: Small, efficient architectures; treat **peak SRAM** as a first-class metric.
6. **Training**: Off-device (standard ML frameworks); iterate on accuracy ↔ efficiency trade-offs.
7. **Optimisation** *(critical step)*:
   - **Quantization**: Reduce numeric precision (e.g., float32 → int8).
   - **Pruning**: Remove redundant parameters.
   - Often combined; evaluate accuracy after each step.
8. **Inference Loop**: Sense → Preprocess → Infer → Act; no dynamic memory allocation on MCUs.

### MCUNet (MIT Case Study)
- **TinyNAS**: Constraint-aware Neural Architecture Search — finds the best model for a given MCU budget.
- **TinyEngine**: Memory-efficient inference runtime — reduces peak SRAM usage.
- **Key insight**: Co-design of architecture + runtime expands feasible model space; outperforms manually compressed baselines.
- Resources: [tinyml.mit.edu](http://tinyml.mit.edu) | [GitHub](https://github.com/mit-han-lab/mcunet)

### Edge LLMs (TinyChatEngine)
- Lightweight C/C++ inference engine for LLMs on constrained devices.
- Requires aggressive compression (quantization + pruning).
- Use case: privacy-preserving local language interaction.
- [GitHub](https://github.com/mit-han-lab/TinyChatEngine)

---

## 🔑 Design Principles
- The **best model** is not the most accurate one — it is the **deployable** one.
- **Optimisation is not optional** in TinyML.
- **Co-design** (algorithm + runtime) unlocks feasibility beyond model-only compression.

---

## 💡 Project Application Ideas
- **Always-on audio**: Wake-word / sound event recognition with sliding windows.
- **Vibration anomaly detection**: Motor/pump health monitoring; event-driven reporting.
- **Tiny vision**: Low-res image classification on MCUs (MCUNet-inspired).
- **Privacy-preserving edge filter**: Edge decides what leaves the device.
- **Edge-assisted digital twin update**: Send semantic events, not raw data.

---

## 🔗 Connections to Other Weeks
- Week 1: TinyML is the *edge intelligence* component of the IoT 3.0 / Digital Twin stack.
- Week 3: Multiple TinyML devices collaborating via Federated Learning.
- Week 6: TinyML edge inference is a privacy mechanism in itself.

---

## 📚 Key References
- Lin et al. (2020). *MCUNet: Tiny deep learning on IoT devices*, NeurIPS.
- Lin et al. (2022). *Tiny Machine Learning: Progress and Futures*, arXiv:2206.15472.
