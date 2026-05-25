# Week 3 – Edge Intelligence II: Collaborative Learning, Federated Learning & Privacy in IoT

## 🎯 Core Idea
A single smart device is not enough. IoT intelligence must be **collaborative** — distributed across cloud, edge, and terminals. **Federated Learning (FL)** is the key paradigm: devices train on local data and share only model updates, never raw data. **Privacy and trust are architectural constraints**, not afterthoughts.

---

## 📌 Key Concepts

### 3-Layer Collaborative Intelligence Architecture
| Layer | Role | Constraints |
|-------|------|-------------|
| **Terminal** | Data acquisition, local preprocessing, immediate actuation | Ultra-low latency, memory/energy-limited, simple models only |
| **Edge** | Aggregation, low-latency inference, device coordination | More compute than terminals; intermittent connectivity; resource contention |
| **Cloud** | Large-scale training, global model aggregation, long-term analytics | No hard latency constraint; maintains global digital twin state |

**Design principle**: Place time-critical decisions at the edge; keep heavy computation in the cloud.

### Enabling Technologies for Collaborative Intelligence
- **Containerisation**: Package AI services portably across cloud/edge; lightweight runtimes for offline edge operation.
- **Network Virtualisation / Slicing**: Abstract physical resources; support multiple AIoT services with QoS isolation.
- **Edge Orchestration Frameworks**: Manage distributed AI lifecycle; handle intermittent connectivity; enable autonomous edge operation.
  - Reference system: **EdgeAIBus** (Ali et al., IEEE TPDS 2025).
- **Software-Defined Networking (SDN)**: Joint optimization of communication + computation via centralized control.

---

### Federated Learning (FL)

#### Why FL?
- IoT data is naturally **distributed** — collecting it centrally is costly, dangerous (privacy), and often illegal.
- Devices see heterogeneous, non-IID data distributions.

#### How FL Works
```
Server initialises global model
→ Broadcasts to selected clients
→ Each client: local SGD on private data
→ Clients send model updates (not raw data) to server
→ Server aggregates (e.g., FedAvg) → new global model
→ Repeat for N rounds
```

#### Mathematical Core
- **Global objective**: weighted sum of local loss functions (each client weighted by data size).
- **Local step**: multiple SGD iterations approximate the global gradient.
- **Key challenge**: approximation error grows with data heterogeneity.

#### Real IoT Challenges in FL
| Challenge | Impact |
|-----------|--------|
| **Non-IID data** (statistical heterogeneity) | Local objectives diverge → slow/unstable convergence |
| **Device heterogeneity** | Varying compute, energy, connectivity; partial participation |
| **Communication cost** | Large model updates × limited bandwidth × frequent rounds = high energy |

#### Advanced FL Algorithms
- **FedProx**: Adds a proximal term to local objective — limits how far each client drifts from the global model; better for heterogeneous settings.
- **SCAFFOLD**: Introduces control variates — corrects client drift caused by non-IID data; faster convergence.

---

### Privacy, Security & Trust

#### Privacy Risks in FL
- **Gradient leakage**: Model updates can encode sensitive information; adversaries can reconstruct training samples from gradients.
- **Membership inference**: Determine whether a specific sample was in the training set.
- **Threat models**: Honest-but-curious server; malicious/compromised clients.

#### Privacy-Preserving Mechanisms
| Mechanism | Idea | Trade-off |
|-----------|------|-----------|
| **Differential Privacy (DP)** | Add calibrated noise to gradients | Formal privacy guarantee ↔ accuracy loss |
| **Secure Aggregation** | Server only sees the *sum* of updates, never individual ones | Communication overhead |
| **Homomorphic Encryption / SMPC** | Cryptographic privacy; compute on encrypted data | Too heavy for most edge devices |
| **Privacy-by-Design** | Minimize shared info; prefer local inference | Architectural discipline |

#### Security Threats
- **Data poisoning**: Malicious clients inject corrupted training data.
- **Model poisoning**: Directly manipulate local updates; can implant backdoors.
- **Robust aggregation**: Use median / trimmed mean instead of simple average; anomaly detection.

---

## 🧠 Mental Model
> Think of FL like a study group: each student (device) studies their own textbook (private data), then only shares their notes (model updates). The teacher (server) combines all the notes into a shared understanding (global model) — without ever seeing what books anyone read.

---

## 🔗 Connections to Other Weeks
- Week 2: Individual TinyML devices are the *terminals* in this 3-layer system.
- Week 4–5: Connectivity determines how reliably model updates are transmitted.
- Week 6: Security mechanisms in FL (secure aggregation, DP) tie directly to IoT security.
- Week 7: FL is one of the major open research problems in IoT.

---

## 🛠 Practical Tools
| Tool | Use |
|------|-----|
| **Flower (flwr)** | General-purpose FL framework |
| **PySyft** | Privacy-focused FL; differential privacy |
| **TensorFlow Federated (TFF)** | FL research with TF models |

---

## 📚 Key References
- McMahan et al. (2017). *Communication-efficient learning of deep networks from decentralized data*, AISTATS. (FedAvg)
- Wu et al. (2025). *A Survey on Cloud-Edge-Terminal Collaborative Intelligence*, arXiv:2508.18803.
- Ali et al. (2025). *EdgeAIBus*, IEEE TPDS, vol. 36, no. 11.
