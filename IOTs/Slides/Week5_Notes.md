# Week 5 – 6G Connectivity and Non-Terrestrial Networks (NTN)

## 🎯 Core Idea
5G left critical IoT gaps: coverage in remote areas, ultra-reliable low-latency for industrial control, and fragmented satellite ecosystems. **6G (IMT-2030)** redefines networks as **intelligent, sensing, AI-native platforms** with **global 3D coverage** via terrestrial + non-terrestrial layers. The 3GPP release roadmap shows the engineering pathway from today's 5G to tomorrow's 6G.

---

## 📌 Key Concepts

### Why 5G Wasn't Enough for IoT
- Coverage **gaps** for remote / rural / maritime IoT.
- Latency and reliability limits for critical IoT control loops.
- Fragmented satellite and terrestrial ecosystems (no unified architecture).

---

### IMT-2030 (6G Vision Framework)

**Progression**: IMT-2000 (3G) → IMT-Advanced (4G) → IMT-2020 (5G) → **IMT-2030 (6G)**

#### IMT-2030 Usage Scenarios
| Scenario | IoT Relevance |
|----------|---------------|
| Massive Ubiquitous Connectivity | City-scale / national IoT fabrics |
| Hyper-Reliable Low Latency | Industrial robotics, critical control loops |
| AI-Native Services | Autonomous IoT systems |
| Integrated Sensing & Communication | Network as sensor (joint radar + comms) |
| Immersive Communication | XR-assisted remote IoT operations |

#### IMT-2030 Capability Dimensions → IoT Interpretation
| Dimension | IoT Meaning |
|-----------|-------------|
| Extreme connection density | Massive smart-city sensor grids |
| Ultra-low latency | Industrial automation feedback loops |
| Ultra-high reliability | Safety-critical remote infrastructure |
| Energy efficiency | Battery/energy-harvesting field sensors |
| AI-native networking | Self-optimising IoT systems |
| Integrated sensing | Environment-aware networks |
| 3D global coverage | Rural, maritime, aerial IoT |

---

### 5G vs 6G IoT Comparison

| Feature | 5G IoT (NB-IoT/RedCap) | 6G Ambient IoT | 6G NTN (Satellite) |
|---------|------------------------|----------------|---------------------|
| Power | Battery (years) | Energy harvesting (infinite) | Solar/Battery (high power) |
| Range | ~10 km terrestrial | < 100 m (reader-dependent) | Global (LEO/GEO) |
| Cost/node | $5–$20 | < $0.10–$1.00 | $50+ |
| Latency | 10ms–seconds | Variable (harvest-dependent) | 20ms (LEO) – 600ms (GEO) |
| Primary use | Smart metering, wearables | Logistics, retail, inventory | Maritime, rural, transport |

---

### 3GPP Release Roadmap

| Release | Milestone |
|---------|-----------|
| **Rel-15** | 5G NR foundation; initial massive IoT; edge computing support |
| **Rel-16** | Improved URLLC; industrial IoT; time-sensitive networking |
| **Rel-17** | ⭐ **First NTN integration**: NB-IoT over satellite; direct device-to-satellite |
| **Rel-18** | Enhanced NTN; AI/ML for radio optimisation; reduced-capability IoT class |
| **Rel-19** | Pre-6G bridge; AI-native radio studies; integrated sensing & communication |

> **Key checkpoint**: Release 17 is the milestone that first enabled practical satellite IoT within cellular standards.

---

### Non-Terrestrial Networks (NTN)

#### NTN Layers
1. **LEO satellite constellations** (low latency ~20ms; global coverage)
2. **High-Altitude Platform Stations (HAPS)** (quasi-stationary; regional coverage)
3. **UAV base stations** (on-demand; disaster/event coverage)
4. **Terrestrial macro/small cells** (dense urban; indoor)

#### NTN Payload Models
- **Transparent payload (bent-pipe relay)**: Satellite relays signal; base station logic stays on ground.
- **Regenerative payload**: Satellite acts as a full base station; lower latency.

#### Multi-Layer Connectivity
- Terrestrial + satellite **dual connectivity** → path diversity for reliability.
- **Cross-domain handover**: Delay-aware mobility control; service continuity across layers.

---

### AI-Native Networking & IoT Slicing

#### AI-Native Control
- **Traffic prediction** for IoT load patterns.
- **Satellite resource scheduling** (beam management, interference).
- **Closed-loop optimisation**: Telemetry → Learning → Automatic parameter adjustment.

#### IoT-Oriented Network Slicing (6G)
| Slice | Priority |
|-------|----------|
| Massive IoT slice | Scale & efficiency (millions of sensors) |
| Critical IoT slice | Ultra-reliability & low latency |
| Global NTN IoT slice | Coverage first (remote/maritime) |

---

## 🔑 Design Principles
- **Multi-layer connectivity**: Terrestrial + aerial + satellite for full coverage.
- **Slice-based service isolation**: Different IoT services get isolated resources.
- **Edge-assisted processing**: Reduce NTN latency by processing at the edge.
- **Standards-aligned deployment**: Use 3GPP Release levels as deployment checkpoints.

---

## 🔗 Connections to Other Weeks
- Week 4: Matter/Thread handles *local* IoT networks; 6G/NTN extends coverage globally.
- Week 3: FL model updates travel over 6G/NTN connectivity in wide-area deployments.
- Week 6: NTN introduces new security challenges (satellite link attacks, large attack surface).
- Week 7: 6G (THz, RIS, ISAC, SWIPT) is listed as a major open research direction.

---

## 📚 Key References
- Lin (2025). *The Bridge Toward 6G: 3GPP Release 19*, IEEE Communications Standards Magazine.
- Wu et al. (2022). *AI-Native Network Slicing for 6G Networks*, IEEE Wireless Communications.
- ITU-R Recommendation M.2160-0 (IMT-2030 Framework).
