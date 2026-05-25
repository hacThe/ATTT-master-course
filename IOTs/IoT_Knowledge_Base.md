# Advanced Internet of Things Technology — Master Knowledge Base
**Course**: Advanced IoT Technology (M.Sc. level) | **Lecturer**: TS. Huỳnh Văn Đặng, UIT-VNUHCM

> This document synthesizes all 7 weeks of course material into a unified, structured knowledge base. Each week builds on the previous one to construct a complete picture of modern IoT systems — from architecture and edge intelligence, through connectivity, to security and open research frontiers.

---

## 📐 The Big Picture: Course Architecture

The course follows a **"vertical slice"** philosophy — every topic is a layer of the same complete IoT system:

```
┌──────────────────────────────────────────────────────────────┐
│  WEEK 7 — Open Research Directions & Open-Source Platforms   │
├──────────────────────────────────────────────────────────────┤
│  WEEK 6 — IoT Security (entire stack)                        │
├────────────────────────┬─────────────────────────────────────┤
│  WEEK 5 — 6G & NTN     │  WEEK 4 — Matter, Thread, MQTT/CoAP │
│  (Wide-Area Layer)     │  (Local Network Layer)               │
├────────────────────────┴─────────────────────────────────────┤
│  WEEK 3 — Federated Learning & Collaborative Intelligence    │
├──────────────────────────────────────────────────────────────┤
│  WEEK 2 — TinyML & Edge Intelligence (Device Layer)         │
├──────────────────────────────────────────────────────────────┤
│  WEEK 1 — Digital Twins & IoT Architecture (Foundation)     │
└──────────────────────────────────────────────────────────────┘
```

**Project progression levels:**
- **Level 1**: Connected and observable (sensing + data pipeline)
- **Level 2**: Intelligent edge or enriched digital twin
- **Level 3**: Cognitive system with AI-driven reasoning

---

## 📅 Week-by-Week Summary

| Week | Topic | Core Idea in One Sentence |
|------|-------|--------------------------|
| 1 | Modern IoT Stack & Digital Twins | IoT has evolved into a Digital Twin era where physical systems have AI-enhanced virtual replicas. |
| 2 | TinyML for IoT Devices | Deployment constraints drive every decision; bring ML directly onto microcontrollers. |
| 3 | Federated Learning & Privacy | Intelligence must be collaborative; FL trains across devices without sharing raw data. |
| 4 | Matter, Thread & Messaging | Solve the "Tower of Babel" with IP-first standards (Matter + Thread) and lightweight messaging. |
| 5 | 6G & Non-Terrestrial Networks | 6G (IMT-2030) creates AI-native, globally-covered networks via terrestrial + satellite layers. |
| 6 | IoT Security | IoT security spans the entire stack; hardware roots of trust and lifecycle management are foundational. |
| 7 | Open Research & Open-Source | IoT has unsolved frontiers (FL, DT, 6G, ZTA, Green IoT) and a rich open-source ecosystem. |

---

## 🏗️ Part 1: Foundations — Digital Twins & IoT Architecture (Week 1)

### IoT Evolution Timeline
| Era | Period | Key Characteristic |
|-----|--------|-------------------|
| **IoT 1.0** Connectivity | Early | Basic sensing/actuation, centralized servers |
| **IoT 2.0** Cloud-Centric | 2010s | Analytics dashboards, high latency, privacy concerns |
| **IoT 3.0** Digital Twin | Now / Future | Continuous sync with virtual replicas, AI-integrated, closed-loop autonomous |

### Digital Twin Fundamentals
A **Digital Twin** is a living virtual model of a physical asset that:
1. Receives real-time data from the physical world.
2. Runs simulation, prediction, and optimisation models.
3. Feeds decisions/commands back to the physical world.

**Types**:
- By structure: Discrete (single asset) → Composite (system of systems) → Hierarchical
- By function: Product-level, Facility-level, Lifecycle-oriented

**Data it manages**:
- *Time-series*: sensor readings, real-time and historical measurements
- *Master/transactional*: asset metadata, configuration, business records

### Data Modeling Standards
| Standard | Origin | Used For |
|----------|--------|----------|
| **AAS** (Asset Administration Shell) | Industry 4.0 / IEC | Industrial asset description |
| **DTDL** (Digital Twin Definition Language) | Microsoft / Azure | General-purpose IoT twins |
| **NGSI-LD** | ETSI / W3C | Smart cities, linked data, semantics |

### AI Placement in IoT Systems
| Tier | Where | Best For |
|------|-------|---------|
| Edge intelligence | On devices/gateways | Low latency, privacy, offline operation |
| Cloud intelligence | Data center | Heavy compute, global visibility, history |
| Hybrid | Both | Practical balance — most deployed systems |

**AI roles**: Predictive (forecasting, fault detection) | Prescriptive/Autonomous (optimal actions, automated control)

---

## 🧠 Part 2: Edge Intelligence — TinyML (Week 2)

### Why Push Intelligence to the Edge?
| Driver | Cloud Problem | Edge Solution |
|--------|---------------|---------------|
| Latency | Unpredictable round-trip (100ms+) | Local inference (< 1ms–10ms) |
| Bandwidth | Raw data streams overwhelm networks | Only events/features transmitted |
| Energy | Radio TX dominates power budget | Reduce transmissions with local inference |
| Privacy | Sensitive data leaves device | Data stays on-device |
| Resilience | Cloud outage = broken system | Operates offline |

### TinyML End-to-End Workflow
```
1. Problem Definition    → Set task, latency, memory, energy budgets
2. Data Collection       → Real-world, representative; temporal splits
3. Preprocessing         → Denoise, normalize; must be reproducible at inference
4. Feature Extraction    → Frequency-domain, statistics; reduces complexity
5. Model Development     → Small architectures; peak SRAM is key metric
6. Training              → Off-device; track accuracy + memory + latency
7. Optimisation          → Quantization (float32→int8) + Pruning + combined
8. Firmware Integration  → Inference loop: Sense → Preprocess → Infer → Act
```

### Key Optimisation Techniques
| Technique | What It Does | Trade-off |
|-----------|-------------|-----------|
| **Quantization** | Reduces numeric precision (e.g., FP32 → INT8) | Slight accuracy drop, major memory reduction |
| **Pruning** | Removes near-zero / redundant weights | Accuracy drop if too aggressive |
| **Co-design** | Jointly optimise model architecture + runtime | More complex but unlocks best results |

### MCUNet (MIT) — The Key Case Study
- **TinyNAS**: Neural Architecture Search constrained to MCU budget → finds optimal architecture.
- **TinyEngine**: Memory-efficient inference runtime → reduces peak SRAM significantly.
- **Insight**: Improving the runtime enables better architectures; co-design > model-only compression.

---

## 🤝 Part 3: Collaborative Intelligence — Federated Learning (Week 3)

### 3-Layer Intelligence Architecture
```
[Terminal Layer] ←→ [Edge Layer] ←→ [Cloud Layer]
  - Acquisition       - Aggregation    - Global training
  - Actuation         - Low-latency    - Long-term analytics
  - Ultra-low lat.      inference      - Digital twin state
```

### Federated Learning (FL)
**Core principle**: Models come to the data; data never leaves the device.

```
Round r:
  Server  → broadcasts global model W_r
  Clients → each runs local SGD on private data D_k
  Clients → send ΔW_k (gradient/model update) to server
  Server  → aggregates: W_{r+1} = Σ (n_k/n) * W_k_r   [FedAvg]
  Repeat for R rounds
```

### IoT Challenges in FL
| Challenge | Cause | Algorithm Response |
|-----------|-------|-------------------|
| **Non-IID data** | Devices see different environments | FedProx (proximal term), SCAFFOLD (control variates) |
| **System heterogeneity** | Different MCU power, connectivity | Partial participation, resource-aware client selection |
| **Communication cost** | Large models × many rounds × low BW | Gradient compression, fewer local steps, sparse updates |

### Privacy & Security in FL
| Attack | Description | Defence |
|--------|-------------|---------|
| Gradient leakage | Reconstruct training samples from gradients | Differential Privacy, Secure Aggregation |
| Membership inference | Detect if a sample was in training data | DP noise, model generalisation |
| Data poisoning | Corrupt local training data | Byzantine-robust aggregation (median, trimmed mean) |
| Model poisoning | Directly manipulate updates / inject backdoors | Anomaly detection on updates |

**Key privacy tools**:
- **Differential Privacy (DP)**: Adds calibrated Gaussian/Laplace noise → formal privacy guarantee at cost of accuracy
- **Secure Aggregation**: Cryptographic protocol where server only learns the *sum*, not individual updates
- **Privacy-by-design**: Minimize shared information; prefer local inference; layer defences

### Enabling Technologies
- **Containerisation** (Docker/OCI): Portable AI services across cloud and edge
- **Network slicing** (SDN/NFV): QoS-isolated virtual networks per IoT service class
- **Edge orchestration** (EdgeAIBus): Lifecycle management of distributed AI services

---

## 🌐 Part 4: Local Connectivity — Matter, Thread, MQTT, CoAP (Week 4)

### The Interoperability Problem
Early IoT fragmented into protocol islands (Zigbee, Z-Wave, Bluetooth, Wi-Fi). Root causes:
- Non-IP design required hub-based translation
- No shared application-layer language
- Incompatible security/onboarding models

### Matter: Unified Application Layer
**Origin**: Project CHIP / Connectivity Standards Alliance (Apple, Google, Amazon, Samsung, etc.)

| Principle | Detail |
|-----------|--------|
| IP-first | Built on IPv6; no proprietary hub |
| Local-first | Cloud is optional; devices speak directly |
| Security baseline | Device attestation + encrypted commissioning |
| Interoperability | Standardised device models across all vendors |
| Multi-Admin | One device can belong to multiple controller ecosystems simultaneously |

**Transports**: Ethernet/Wi-Fi + Thread (mesh) + Bluetooth LE (commissioning only)

### Thread: Low-Power IPv6 Mesh
| Property | Detail |
|----------|--------|
| Type | Self-healing mesh network |
| Protocol | IPv6 native (no translation needed) |
| Power | Ultra-low (battery-friendly) |
| Scale | Hundreds of nodes |
| SPOF | None — multiple Border Routers auto-failover |
| Encryption | AES |

**Node Roles** (dynamic, auto-assigned):
- **Leader**: Network manager
- **Router**: Multi-hop forwarder
- **End Device (Sleepy)**: Wakes up to transmit, sleeps otherwise

**Matter + Thread = local-first smart network**: Thread handles the bytes; Matter handles the meaning.

### Messaging Protocols
| Protocol | Pattern | Transport | Best For |
|----------|---------|-----------|---------|
| **MQTT** | Pub/Sub via broker | TCP | Cloud telemetry, fan-out to many subscribers |
| **CoAP** | Request/Response (REST) | UDP | Device-to-device, constrained sensors, low energy |

- MQTT QoS levels: 0 (at most once), 1 (at least once), 2 (exactly once)
- CoAP security: DTLS (transport) or OSCORE (end-to-end, application level)

---

## 📡 Part 5: Wide-Area Connectivity — 6G & Non-Terrestrial Networks (Week 5)

### 5G→6G Motivation
- 5G left coverage gaps for remote/maritime/rural IoT
- 5G couldn't deliver true AI-native networking
- Fragmented satellite ecosystems needed unification

### IMT-2030 (6G) Framework
**Evolution**: IMT-2000 (3G) → IMT-Advanced (4G) → IMT-2020 (5G) → **IMT-2030 (6G)**

| Capability Dimension | IoT Impact |
|---------------------|------------|
| Extreme connection density | City-scale sensor fabrics |
| Ultra-low latency | Industrial automation, robotics |
| Ultra-high reliability | Safety-critical infrastructure |
| Energy efficiency | Energy-harvesting, battery-less sensors |
| AI-native networking | Self-optimising IoT systems |
| Integrated sensing & communication | Network-as-sensor paradigm |
| 3D global coverage | Rural, maritime, aerial IoT |

### 3GPP Release Roadmap
| Release | Key IoT/NTN Feature |
|---------|-------------------|
| Rel-15 | 5G NR foundation; massive IoT; edge computing |
| Rel-16 | URLLC improvements; industrial IoT |
| **Rel-17** | ⭐ First NTN: NB-IoT over satellite |
| Rel-18 | Enhanced NTN; AI/ML for radio; RedCap IoT class |
| **Rel-19** | AI-native radio; ISAC studies; pre-6G bridge |

### Non-Terrestrial Network (NTN) Architecture
```
[ GEO/LEO Satellites ] ←→ [ HAPS ] ←→ [ UAV Base Stations ]
         ↕                                        ↕
[ Terrestrial Macro/Small Cells ] ←→ [ IoT Devices ]
```
- **Transparent payload**: Satellite relays; ground-side base station logic
- **Regenerative payload**: Satellite IS the base station; lower latency
- **Dual connectivity**: Terrestrial + satellite path diversity for reliability

### 6G IoT Slicing
| Slice Type | Priority |
|------------|----------|
| Massive IoT | Scale + efficiency |
| Critical IoT | Reliability + latency |
| Global NTN IoT | Coverage (remote/maritime) |

### 5G vs 6G IoT Quick Reference
| | 5G NB-IoT | 6G Ambient IoT | 6G NTN |
|--|-----------|----------------|--------|
| Power | Battery (years) | Energy harvesting | Solar/Battery |
| Range | ~10 km | < 100 m | Global |
| Latency | 10ms–s | Variable | 20ms(LEO)–600ms(GEO) |
| Cost/node | $5–$20 | < $1 | $50+ |

---

## 🔒 Part 6: IoT Security (Week 6)

### Why IoT Security Is Different
| Dimension | IT | IoT |
|-----------|----|----|
| Compute | Server-grade CPU | Microcontroller (MHz, KB RAM) |
| Connectivity | Stable, always-on | Lossy, intermittent |
| Lifecycle | 3–5 yr + patches | 10–20+ yr, often unpatched |
| Deployment | Controlled rooms | Public, physically accessible |
| Failure impact | Data breach | Physical harm (actuators) |

### STRIDE Threat Model
| Letter | Threat | Mitigation |
|--------|--------|-----------|
| **S** Spoofing | Impersonate device/user | Strong authentication, certificates |
| **T** Tampering | Modify data/firmware | Signatures, integrity checks |
| **R** Repudiation | Deny actions | Audit logs, non-repudiation mechanisms |
| **I** Info Disclosure | Expose private data | Encryption, data minimisation |
| **D** Denial of Service | Exhaust resources | Rate limiting, resilient design |
| **E** Privilege Escalation | Gain higher access | Least privilege, role separation |

### Security Mechanisms by Layer
```
Application Layer:  OSCORE (CoAP), JWT/OAuth, ACLs
       ↕
Transport Layer:    TLS (TCP) / DTLS (UDP)
       ↕
Network Layer:      IPv6 with IPsec
       ↕
Link Layer:         IEEE 802.15.4 AES (Thread/Zigbee)
       ↕
Hardware Layer:     Secure Element, TEE, PUF, Secure Boot
```

### Authentication & Authorisation
| Mechanism | Use Case |
|-----------|---------|
| X.509 certificates | Mutual TLS device authentication |
| Pre-shared keys (PSK) | Constrained, pre-provisioned devices |
| JWT tokens | Stateless API auth |
| OAuth 2.0 | Delegated authorisation |
| RBAC | Role-based permissions |
| ABAC | Attribute/context-based fine-grained control |

### Hardware Security
| Technology | Function |
|------------|---------|
| **TEE** (TrustZone) | Isolated secure execution; protects keys and crypto operations |
| **Secure Element / TPM** | Dedicated tamper-resistant hardware key storage |
| **PUF** | Manufacturing-unique device fingerprint; anti-cloning; keygen |
| **Secure Boot** | Cryptographic chain: ROM → Bootloader → Firmware → App |

### Cryptography for IoT
- **AES** (symmetric): Efficient bulk encryption on constrained devices
- **ECC** (elliptic curve): Key agreement with small key sizes vs RSA
- **AEAD**: Authenticated Encryption with Associated Data — confidentiality + integrity in one
- **Ascon**: NIST-selected lightweight cipher standard for IoT (2023)

---

## 🔭 Part 7: Open Research & Open-Source Ecosystem (Week 7)

### Active Research Frontiers

| Research Area | Key Open Problems |
|---------------|------------------|
| **AI/ML for IoT** | Hardware-aware design at scale; adaptive/continual learning; fleet model management |
| **Federated Learning** | Non-IID convergence; communication overhead; partial participation |
| **Digital Twins** | Accurate physics modeling; real-time sync at scale; twin scalability |
| **IoT Security / ZTA** | Scalable machine identity; secure OTA at scale; Zero Trust for constrained devices |
| **Blockchain & Privacy** | Decentralised trust; ZKP for IoT; homomorphic encryption efficiency |
| **Green IoT** | Energy harvesting diversity; carbon-aware routing; perpetual operation |
| **Advanced Wireless** | THz propagation; RIS channel control; ISAC; SWIPT energy harvesting |

### Open-Source Hardware Ecosystem
| Category | Key Platforms |
|----------|--------------|
| MCU (RISC-V) | BL602/608/808 (Bouffalo), GD32V, CH32V |
| MCU (ESP32) | S3 (edge AI), C3 (RISC-V BLE/Wi-Fi), C6 (Wi-Fi 6 + Thread + Zigbee) |
| Edge SBC | Raspberry Pi, Orange Pi, Rock Pi, BeagleBone AI |
| AI hardware | NVIDIA Jetson Nano/Orin, Google Coral Edge TPU |

### Open-Source Software Stack
```
[Application]   Node-RED (flow programming), ThingsBoard, Mainflux
[Middleware]    MQTT + Sparkplug, Matter, NGSI-LD brokers
[OS/RTOS]       Zephyr RTOS, FreeRTOS, Mbed OS
[ML]            TensorFlow Lite Micro, Edge Impulse, MCUNet/TinyEngine
[Security]      Mbed TLS, wolfSSL, OpenSSL (gateway/edge)
[FL]            Flower, PySyft, TensorFlow Federated
```

---

## 🔗 Cross-Week Concept Map

```
Digital Twin (W1) ←── real data ──── Matter/Thread (W4) ──── 6G/NTN (W5)
       │                                      │
       │ AI models                      local-first net
       │                                      │
  TinyML (W2) ──── model sharing ──── Fed. Learning (W3)
       │                                      │
       └──── privacy by design ────── IoT Security (W6)
                                             │
                             Open Problems (W7): DT, FL, ZTA, Green, THz/RIS
```

### Key Recurring Themes Across All Weeks
1. **Constraint-driven design**: Every decision (model, protocol, security mechanism) must respect the device's resource budget.
2. **Local-first intelligence**: Push computation to the edge; reduce cloud dependency for latency, privacy, and resilience.
3. **Privacy as architecture**: Data minimisation, FL, DP, and TEEs are design choices, not add-ons.
4. **Standards matter**: AAS, DTDL, Matter, Thread, 3GPP Releases — interoperability is engineered, not assumed.
5. **Security spans the stack**: From hardware PUF to application-layer OSCORE; no single layer is enough.
6. **Co-design thinking**: Algorithm + runtime (TinyML), model + network (FL), compute + communication (6G slicing).

---

## 📚 Consolidated Reference List

| Week | Key Papers & Standards |
|------|----------------------|
| W1 | Hakiri et al. (2024), Computer Networks 244; Xu et al. (2023), IEEE Comm. Surveys |
| W2 | Lin et al. (2020) MCUNet, NeurIPS; Lin et al. (2022) TinyML survey, arXiv:2206.15472 |
| W3 | McMahan et al. (2017) FedAvg, AISTATS; Wu et al. (2025) arXiv:2508.18803; Ali et al. (2025) EdgeAIBus, IEEE TPDS |
| W4 | Matter spec (buildwithmatter.com); Thread UG103-11 (Silicon Labs); MQTT (mqtt.org); CoAP RFC 7252 |
| W5 | Lin (2025) 3GPP Rel-19, IEEE Comm. Standards Mag.; Wu et al. (2022) AI Slicing, IEEE Wireless Comm.; ITU-R M.2160-0 |
| W6 | Butun et al. (2020) IoT Security survey, IEEE Comm. Surveys vol.22; OSCORE RFC 8613 |
| W7 | Pan et al. (2025) DT Networks, IEEE IoT J. vol.12; Lee et al. (2024) FL for 5G+, IEEE Comm. Surveys vol.26; Nguyen et al. (2022) 6G IoT survey, IEEE IoT J. vol.9 |

---

## 🗂 Index of Key Terms

| Term | Week | Definition |
|------|------|-----------|
| AAS | 1 | Asset Administration Shell — Industry 4.0 digital twin data standard |
| AEAD | 6 | Authenticated Encryption with Associated Data |
| Ambient IoT | 5 | Battery-less, energy-harvesting IoT nodes in 6G |
| CoAP | 4 | Constrained Application Protocol — lightweight REST over UDP |
| DTDL | 1 | Digital Twin Definition Language (Microsoft/Azure) |
| Digital Twin | 1 | Virtual replica of a physical asset, continuously synchronized |
| Differential Privacy | 3, 6 | Add noise to outputs for formal privacy guarantees |
| FedAvg | 3 | Federated Averaging — the baseline FL aggregation algorithm |
| FedProx | 3 | FL algorithm with proximal term to handle heterogeneity |
| HAPS | 5 | High-Altitude Platform Station — stratospheric relay/base station |
| IMT-2030 | 5 | ITU framework defining 6G capability targets |
| ISAC | 5, 7 | Integrated Sensing and Communication |
| LEO | 5 | Low Earth Orbit satellite constellation |
| Matter | 4 | Unified smart home/IoT application layer standard (CSA) |
| MCUNet | 2 | MIT framework for TinyML: TinyNAS + TinyEngine |
| MQTT | 4 | Message Queuing Telemetry Transport — pub/sub IoT messaging |
| NGSI-LD | 1 | ETSI standard for linked-data IoT context |
| NTN | 5 | Non-Terrestrial Network (satellites, HAPS, UAVs) |
| OSCORE | 4, 6 | Object Security for CoAP — end-to-end application security (RFC 8613) |
| PUF | 6 | Physical Unclonable Function — hardware device fingerprint |
| Pruning | 2 | Remove near-zero weights to compress ML models |
| Quantization | 2 | Reduce numeric precision (e.g., FP32→INT8) to compress models |
| RIS | 7 | Reconfigurable Intelligent Surface |
| SCAFFOLD | 3 | FL algorithm with control variates to reduce client drift |
| Secure Aggregation | 3, 6 | FL protocol where server learns only the sum of updates |
| Secure Boot | 6 | Cryptographic chain verifying each boot stage |
| STRIDE | 6 | Threat modeling framework (Spoofing, Tampering, Repudiation, Info Disclosure, DoS, Elevation) |
| SWIPT | 7 | Simultaneous Wireless Information and Power Transfer |
| TEE | 3, 6 | Trusted Execution Environment (e.g., ARM TrustZone) |
| THz | 7 | Terahertz communications for ultra-high-bandwidth 6G links |
| Thread | 4 | IPv6 mesh networking protocol for low-power IoT |
| TinyML | 2 | Machine learning on microcontrollers (MCUs) |
| Zero Trust | 7 | Security model: never trust, always verify, least privilege |
