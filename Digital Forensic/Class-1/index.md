# Digital Forensics

## Định nghĩa

Digital Forensics là quá trình điều tra và phân tích bằng chứng kỹ thuật số nhằm tìm ra nguồn gốc và mục đích của các tội phạm kỹ thuật số. Về bản chất, nó tương tự với điều tra hiện trường hình sự (CSI), nhưng trong không gian số:

| Thực tế | Kỹ thuật số |
|---|---|
| Dấu vân tay | Hash / Artifact |
| Camera an ninh | Logs / Network capture |
| ADN | Metadata |
| Hiện trường vụ án | Filesystem / RAM |

> **Digital Forensics là cầu nối giữa tấn công, phát hiện và truy tố.**

---

## 5 Chức năng cốt lõi

1. Tái tạo chính xác timeline sự kiện
2. Thu thập bằng chứng có giá trị pháp lý
3. Hỗ trợ Incident Response và Threat Hunting thời gian thực
4. Xác định trách nhiệm khi AI Agent thực hiện hành vi xấu
5. Xây dựng Forensic Readiness cho tổ chức

---

## Quy trình điều tra

### 4 Giai đoạn cơ bản

```
Collection → Examination → Analysis → Reporting
```

### 6 Giai đoạn cốt lõi (đầy đủ)

```
Identification → Preservation → Collection → Examination → Analysis → Presentation
```

### 10 Bước triển khai Forensic Readiness

> *(To be filled)*

---

## Công cụ

### Thu thập & Triage

| Công cụ | Mục đích |
|---|---|
| FTK Imager, `dd` | Tạo disk image |
| Magnet RAM Capture | Memory dump |
| KAPE | Triage nhanh trên Windows |
| Write-blocker (Tableau, WiebeTech) | Bảo toàn tính toàn vẹn bằng chứng (phần cứng) |

### Phân tích sâu

| Công cụ | Mục đích |
|---|---|
| Autopsy / Sleuth Kit | Disk forensics |
| Volatility 3 & Rekall | Memory forensics |

### Công cụ then chốt

- **LangurTrace**
- **OpenClaw Artifact Examiner**

### Enterprise & Law Enforcement

- Cellebrite UFED
- Magnet Axiom
- EnCase Forensics

---

## Xu hướng 2026: Agentic AI Forensics

### Local LLM & Hybrid Forensics

- Phân tích artifacts sinh ra từ các công cụ AI local (Ollama, LM Studio, ...)
- Khôi phục chat history, generated files, model download history kể cả sau khi đã bị xóa
- Xử lý các trường hợp hybrid cloud-local thông qua API keys và stateless sessions

### Sử dụng AI để hỗ trợ điều tra

> *(To be filled)*
