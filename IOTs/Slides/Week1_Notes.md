# Week 1 – Modern IoT Stack & Digital Twin Architectures

## 🎯 Core Idea
IoT has evolved through three distinct eras, culminating in the **Digital Twin era (IoT 3.0)** where physical systems have continuously-synchronized virtual replicas enhanced by AI. The core shift is from *connected devices* → *cloud analytics* → *intelligent, autonomous cyber-physical systems*.

---

## 📌 Key Concepts

### IoT Evolution (The Three Eras)
| Era | Name | Characteristics |
|-----|------|-----------------|
| IoT 1.0 | Connectivity Era | Basic sensing/actuation, centralized servers, limited analytics |
| IoT 2.0 | Cloud-Centric Era | Cloud analytics, dashboards, but high latency & privacy issues |
| IoT 3.0 | Digital Twin Era | Continuous sync with virtual replicas, AI integration, closed-loop autonomous operation |

### Digital Twin
- A **virtual replica** of a physical asset that stays continuously synchronized.
- Types by structure: **Discrete** (single asset), **Composite** (system of systems), **Hierarchical**.
- Types by function: Product-level, Facility-level, Lifecycle-oriented.
- Data it manages: **time-series** (sensor readings, real-time history) + **master/transactional** (metadata, configuration, business records).

### Data Modeling Standards (Moving away from raw JSON)
| Standard | Origin | Domain |
|----------|--------|--------|
| **AAS** (Asset Administration Shell) | Industry 4.0 | Industrial assets |
| **DTDL** (Digital Twin Definition Language) | Microsoft / Azure | General IoT |
| **NGSI-LD** | ETSI | Smart Cities / Linked Data |

### Models Used Inside Digital Twins
- **Physics-based**: High accuracy, grounded in physical laws.
- **Analytics / AI**: ML-based prediction and anomaly detection.
- **Visual / Simulation**: 3D environments, AR/VR for human understanding.

### AI Placement Strategy
| Placement | Strengths |
|-----------|-----------|
| Cloud Intelligence | High compute, global visibility, long-term analytics |
| Edge Intelligence | Low latency, reduced bandwidth, improved privacy |
| Hybrid Intelligence | Balanced latency/scalability — most practical |

- **Predictive AI**: Forecasting, early fault detection, proactive maintenance.
- **Prescriptive/Autonomous AI**: Optimal action recommendations, automated control.

---

## 🧠 Mental Model
> The "vertical slice" course philosophy: build one complete IoT system across the semester, progressing from Level 1 (observable) → Level 2 (intelligent edge / enriched twin) → Level 3 (cognitive, AI-driven reasoning).

---

## 🔗 Connections to Other Weeks
- Week 2: Edge AI / TinyML brings *edge intelligence* to life on constrained devices.
- Week 3: Federated Learning enables *distributed intelligence* across the IoT stack.
- Week 4–5: Connectivity (Matter/Thread, 6G/NTN) feeds the digital twin with real data.
- Week 6: Security protects the integrity of twin data and commands.

---

## 📚 Key References
- Hakiri et al. (2024). *A comprehensive survey on digital twin for future networks*, Computer Networks.
- Xu et al. (2023). *A survey on digital twin for industrial IoT*, IEEE Communications Surveys & Tutorials.
