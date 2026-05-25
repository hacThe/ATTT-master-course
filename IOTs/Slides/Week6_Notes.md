# Week 6 – IoT Security

## 🎯 Core Idea
IoT security is **fundamentally different** from traditional IT security. Resource constraints, massive scale, heterogeneity, physical accessibility, and decade-long lifecycles create unique challenges. Security must span the **entire stack** — from hardware roots of trust up through protocols, application layer, and lifecycle management — and engineering trade-offs are unavoidable.

---

## 📌 Key Concepts

### Why IoT Security ≠ Traditional IT Security

| Dimension | Traditional IT | IoT |
|-----------|----------------|-----|
| Hardware | Powerful servers/PCs | Microcontrollers (limited CPU/RAM) |
| Connectivity | Stable, high-bandwidth | Lossy, intermittent, low data-rate |
| Deployment | Controlled, indoor environments | Public, unattended, physically accessible |
| Lifecycle | 3–5 years, regular patching | 10–20+ years, often never updated |
| Inventory | Centrally managed | Millions of diverse heterogeneous devices |
| Consequences of failure | Data breach | Physical safety risk (actuators cause harm) |

---

### Part I: IoT Attack Surface & Architecture

#### Layered IoT Architecture (Attack Propagation)
```
[Device Layer]  →  sensors/actuators, firmware
       ↓
[Network/Edge]  →  gateways, edge analytics
       ↓
[Cloud/App]     →  storage, APIs, dashboards
```
- Compromised device → can attack the network.
- Network breach → can expose the cloud.
- Weak authentication / poor segmentation amplifies cascading failures.

#### Heterogeneity Challenges
- Multiple radio protocols (BLE, Zigbee, Wi-Fi, LoRa, 5G).
- Different hardware architectures and firmware stacks.
- Interaction with cloud APIs, mobile apps, gateways — each a potential attack vector.

---

### Part II: Threat Modelling

#### STRIDE Framework
| Letter | Threat | Description |
|--------|--------|-------------|
| **S** | Spoofing | Impersonate a legitimate device or user |
| **T** | Tampering | Modify data, firmware, or commands |
| **R** | Repudiation | Deny having performed an action |
| **I** | Information Disclosure | Expose private data |
| **D** | Denial of Service | Exhaust resources; disrupt availability |
| **E** | Elevation of Privilege | Gain unauthorized higher-level access |

---

### Part III: Protocols & Security Mechanisms

#### Communication Security Layers
- **Link layer**: IEEE 802.15.4 AES-based encryption (Thread/Zigbee).
- **Transport layer**: **TLS** (TCP) / **DTLS** (UDP) — session resumption reduces overhead; Connection ID supports mobility.
- **Application layer**: **OSCORE** (Object Security for CoAP, RFC 8613) — end-to-end, hop-by-hop independent.

#### MQTT Security
- TLS for transport encryption.
- Client authentication: X.509 certificates, PSK, username/password.
- Broker-side authorisation: **Access Control Lists (ACLs)**, topic isolation and permissions.

#### Identity & Authentication
| Mechanism | Use Case |
|-----------|----------|
| X.509 certificates | Strong mutual authentication |
| Pre-shared keys (PSK) | Constrained devices with pre-provisioning |
| JWT tokens | Stateless application-level auth |
| OAuth 2.0 | Delegated authorisation |

#### Authorisation Models
- **RBAC** (Role-Based): Roles define permissions.
- **ABAC** (Attribute-Based): Fine-grained, context-aware.
- **Capability tokens**: Delegatable, scope-limited credentials.
- Principle: **Least privilege** always.

#### Cryptography for Constrained Devices
- Symmetric encryption (AES) for efficiency.
- **Elliptic Curve Cryptography (ECC)** for key exchange (smaller keys vs RSA).
- **AEAD** (Authenticated Encryption with Associated Data).
- **Lightweight crypto**: Ascon (NIST standardised for IoT).

---

### Part IV: Hardware Roots of Trust & Lifecycle Security

#### Hardware Root of Trust (HRoT)
- Hardware-anchored foundation for system trust.
- Secure storage of cryptographic keys.
- Prevents unauthorized firmware execution.
- Enables **Secure Boot** chain.

#### Secure Boot Chain
```
Boot ROM → (verifies) → Bootloader → (verifies) → Firmware → (verifies) → Application
```
Each stage cryptographically signed; chain breaks if tampering occurs.

#### Trusted Hardware Technologies
| Technology | Role |
|------------|------|
| **TEE** (Trusted Execution Environment, e.g., ARM TrustZone) | Isolated secure execution region alongside the normal OS |
| **Secure Element / TPM** | Dedicated hardware for key storage; resistant to physical extraction |
| **PUF** (Physical Unclonable Function) | Unique device fingerprint from manufacturing variation; anti-cloning, authentication |

#### Key Management Lifecycle
- **Provisioning**: Secure key injection during manufacturing.
- **Storage**: Hardware-protected (secure element).
- **Rotation**: Periodic renewal to limit exposure window.
- **Revocation**: Handle compromised devices at scale.

---

## 🔑 Summary: 5 Engineering Principles
1. IoT security is **categorically different** from traditional IT security.
2. Security must be considered **across the entire stack** (hardware → protocol → application → lifecycle).
3. **Strong identity, authentication, and access control** are foundational — not optional.
4. **Hardware trust and lifecycle management** determine long-term security posture.
5. **Engineering trade-offs are unavoidable** — balance security with constraints.

---

## 🔗 Connections to Other Weeks
- Week 2: TinyML on-device inference is itself a privacy mechanism (raw data stays local).
- Week 3: FL privacy (DP, secure aggregation) extends IoT security to collaborative learning.
- Week 4: MQTT security (TLS + ACLs) is the direct application of Week 6 principles.
- Week 5: NTN/6G introduces new attack vectors (satellite link spoofing, large remote attack surface).
- Week 7: Zero Trust Architecture and blockchain for IoT are open research extensions.

---

## 📚 Key References
- Butun et al. (2020). *Security of the Internet of Things: Vulnerabilities, Attacks, and Countermeasures*, IEEE Communications Surveys & Tutorials, vol. 22, no. 1.
- OSCORE RFC 8613: https://www.rfc-editor.org/rfc/pdfrfc/rfc8613.txt.pdf
