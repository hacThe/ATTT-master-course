# Ôn Thi — Câu Chuyện Đằng Sau 7 Tuần IoT

> **Cách dùng tài liệu này**: Đây không phải danh sách định nghĩa.
> Mỗi tuần được kể theo dạng: *vấn đề cũ → tại sao nó tệ → giải pháp mới → insight cốt lõi*.
> Nắm được câu chuyện này, bạn có thể tự suy ra phần lớn chi tiết kỹ thuật trong kỳ thi.

---

## 🧭 Mạch chung của cả khoá

Toàn bộ 7 tuần là một câu hỏi duy nhất:

> *"Làm sao để xây một hệ thống IoT **thông minh, bảo mật, và kết nối toàn cầu** trong khi thiết bị thì nhỏ, pin thì ít, dữ liệu thì nhạy cảm, và mạng thì không phủ hết?"*

Mỗi tuần giải quyết một mặt của câu hỏi đó:

```
W1: Kiến trúc tổng thể là gì?
W2: Trí tuệ chạy trên thiết bị nhỏ thế nào?
W3: Nhiều thiết bị học cùng nhau mà không chia sẻ dữ liệu thế nào?
W4: Thiết bị giao tiếp với nhau thế nào mà không phụ thuộc cloud?
W5: Kết nối ra ngoài thế giới (kể cả vùng xa) thế nào?
W6: Bảo vệ hệ thống đó thế nào?
W7: Những gì vẫn chưa giải được là gì?
```

---

## 📦 Week 1 — Kiến trúc IoT & Digital Twin

### Vấn đề cũ
IoT ban đầu (IoT 1.0) chỉ là: **cảm biến gửi số lên server, người nhìn dashboard**.
Rồi IoT 2.0 cải tiến: **đẩy lên cloud, phân tích, vẽ đồ thị đẹp hơn**.

Nhưng cả hai đều có chung một điểm yếu chết người:
- **Phản ứng sau khi sự việc đã xảy ra** — bạn thấy máy hỏng *sau khi* nó hỏng
- **Không có vòng lặp kín** — hệ thống không tự ra quyết định, người vẫn phải can thiệp
- **Cloud là trung tâm** — mất mạng là mất kiểm soát

### IoT 1.0 vs 2.0 — không chỉ khác ở presentation
Câu trả lời ngắn: **đúng, paradigm không thay đổi**. Cả hai đều là: data chạy lên → người nhìn → người quyết định.

Thứ thực sự thay đổi ở 2.0:
- Server → Cloud: scale lớn hơn, compute nhiều hơn
- Analytics phong phú hơn (ML, trend, correlation)
- **Và quan trọng hơn**: scale lớn mới bộc lộ pain point mới — latency, privacy, bandwidth

Bước nhảy thật sự là **2.0 → 3.0**, không phải 1.0 → 2.0:

| | 1.0 & 2.0 | 3.0 (Digital Twin) |
|---|---|---|
| Ai quyết định? | Con người nhìn dashboard | Hệ thống tự quyết định |
| Phản ứng khi nào? | Sau khi xảy ra | Trước khi xảy ra |
| Cloud có bắt buộc? | Có | Không |
| Vòng lặp | Mở | Kín |

### Giải pháp: Digital Twin (IoT 3.0)
Thay vì chỉ lưu dữ liệu, tạo ra một **bản sao ảo liên tục đồng bộ** với thiết bị thật.
Bản sao đó chứa AI, có thể **dự đoán** (cái gì sắp hỏng?) và **tự ra quyết định** (tắt máy trước khi hỏng).

### Digital Twin là đích, không phải mảng
Digital Twin không phải một "tính năng" của IoT — nó là **kết quả cuối cùng** mà toàn bộ khoá học hướng đến.

```
W2: TinyML        → thiết bị có trí tuệ
W3: Fed. Learning → nhiều thiết bị học cùng nhau
W4: Matter/Thread → thiết bị kết nối được với nhau
W5: 6G/NTN        → kết nối ra toàn thế giới
W6: Security      → hệ thống đáng tin cậy
                          ↓
                  → tất cả để nuôi Digital Twin
```

> Khi thi, mọi câu hỏi về công nghệ bất kỳ đều có thể kết thúc bằng: *"...và đây là một trong những tầng cần thiết để hiện thực hoá Digital Twin."*

### Insight cốt lõi
> **Mục tiêu của IoT không phải thu thập dữ liệu — mà là tạo ra hành động tự động từ dữ liệu đó.**
> Digital Twin là cái "não" ảo nằm giữa dữ liệu và hành động.

### Tại sao cần chuẩn hoá dữ liệu (AAS, DTDL, NGSI-LD)?
Dữ liệu thô không đủ để xây Digital Twin — cần **ngữ nghĩa**: thiết bị này là gì, `t` là nhiệt độ hay thời gian, đơn vị là gì, ngưỡng nguy hiểm là bao nhiêu.

Ba chuẩn đến từ ba cộng đồng khác nhau, giải quyết cùng vấn đề từ góc nhìn khác nhau:

| Chuẩn | Đến từ | Câu hỏi trung tâm |
|-------|--------|------------------|
| **AAS** | Industry 4.0 / Đức | Tài sản này là gì, vòng đời ra sao? |
| **DTDL** | Microsoft / Azure | Thiết bị có interface gì để tôi kết nối? |
| **NGSI-LD** | ETSI / Smart City châu Âu | Thực thể này quan hệ với thế giới xung quanh thế nào? |

- **AAS**: "Hồ sơ số" đầy đủ — không chỉ real-time mà cả thiết kế, bảo trì, thanh lý
- **DTDL**: Schema ngôn ngữ — định nghĩa thiết bị có property gì, telemetry gì, nhận lệnh gì
- **NGSI-LD**: Linked Data — mô tả quan hệ giữa entities (sensor nằm ở phòng, phòng thuộc toà nhà...)

Ba chuẩn vẫn cùng tồn tại vì chúng ra đời từ các cộng đồng không phối hợp nhau.

---

## 🧠 Week 2 — TinyML (Trí tuệ trên thiết bị nhỏ)

### Vấn đề cũ
Cách truyền thống: **thiết bị thu thập raw data → gửi lên cloud → cloud chạy AI → trả kết quả về**.

Pain points rất cụ thể:
- **Latency**: Cloud round-trip mất hàng trăm ms → không dùng được cho hệ thống cần phản xạ tức thì
- **Bandwidth**: Gửi 10,000 cảm biến liên tục lên cloud → tốn băng thông khổng lồ
- **Privacy**: Raw data rời khỏi thiết bị → ai đó có thể đọc được
- **Resilience**: Mất mạng → hệ thống "mù"

### Giải pháp: TinyML
Đưa **model AI chạy thẳng trên chip nhỏ** (MCU — thứ có vài trăm KB RAM).
Thiết bị tự phân loại, tự phát hiện bất thường, **chỉ gửi lên cloud kết quả** thay vì raw data.

### Tại sao khó? — Peak SRAM là bottleneck thật sự
MCU không phải máy tính. Hai loại bộ nhớ cần phân biệt:
- **Flash**: lưu model weights → còn chịu được
- **SRAM**: lưu intermediate activations khi đang inference → cực kỳ nhỏ, vài trăm KB

→ Phải **nén model** bằng Quantization (FP32 → INT8) và Pruning (cắt trọng số gần 0).
→ MCUNet (MIT) giải quyết bằng cách **thiết kế model và runtime cùng nhau** — không nén model có sẵn mà thiết kế lại từ đầu cho phần cứng cụ thể.

### ⚠️ Trap holes

**Trap 1 — TinyML ≠ nén model cho nhỏ lại**
Insight thật: co-design model + runtime từ đầu cho hardware cụ thể. Nén model có sẵn cho kết quả tệ hơn nhiều.

**Trap 2 — TinyML chỉ làm inference, không làm training**
Training vẫn ở cloud/server. MCU chỉ chạy inference (dùng model đã train sẵn).
```
Cloud:  Thu thập data → Train → Compress → Flash lên MCU
MCU:                                       Inference (không train gì cả)
```
→ Khác hoàn toàn với Federated Learning (W3) — nơi training xảy ra trên thiết bị.

**Trap 3 — "Model tốt nhất = chính xác nhất"**
Trong TinyML: model 88% accuracy + fit trong SRAM **thắng** model 95% accuracy + không fit.

**Trap 4 — TinyML không loại bỏ cloud**
Kết cục thực tế là hybrid: MCU làm inference nhanh, cloud làm analytics dài hạn và train model mới.
> *"TinyML giảm sự phụ thuộc vào cloud, không loại bỏ nó."*

**Trap 5 — TinyML và FL là cặp đôi, không phải đối thủ**
```
TinyML (W2): Thiết bị chạy inference          ← dùng model
FL (W3):     Thiết bị tham gia training        ← tạo ra model
Kết hợp:     Thiết bị vừa học (FL) vừa dùng những gì học được (TinyML)
```

### Insight cốt lõi
> **Model tốt nhất không phải model chính xác nhất — mà là model có thể deploy được.**
> Mọi quyết định trong TinyML đều bị chi phối bởi constraint: bộ nhớ, năng lượng, latency.

---

## 🤝 Week 3 — Federated Learning (Học cộng tác không chia sẻ dữ liệu)

### Vấn đề cũ
TinyML giải được inference. Nhưng để train model AI tốt cần nhiều data — và data nằm rải rác ở hàng triệu thiết bị, không thể gom về:
- **Privacy**: Vi phạm GDPR, bí mật kinh doanh, thông tin cá nhân
- **Bandwidth**: Data raw khổng lồ, tốn kém để truyền
- **Không thực tế**: Nhiều thiết bị offline hoặc trong mạng cô lập

### Cơ chế FL — góc nhìn kỹ thuật (cho SE)
Model AI = một mảng khổng lồ các số thực (weights).
Training = tìm bộ weights tốt nhất bằng cách tính gradient (hướng thay đổi weights).

```
FL Round:
  Server gửi W_global cho các clients
  Mỗi client:
    W_local = copy(W_global)          ← fork
    Train W_local trên data riêng
    delta = W_local - W_global        ← tính diff
    Gửi delta về server               ← push patch
  Server: W_global_mới = W_global + average(tất cả delta)
  Lặp lại
```

> Giống Git merge — mỗi thiết bị "đọc tài liệu nội bộ", tạo patch, server merge tất cả patch lại. Tài liệu không bao giờ rời thiết bị.

### FL trong IoT thực tế — MCU không train được
MCU không đủ RAM để backpropagation (cần gấp 3–10 lần so với inference).

**"Client" trong FL = Edge Gateway, không phải sensor:**
```
[Sensor] → raw data → [Edge Gateway] → model update → [Cloud]
                             ↑                              ↑
                      training xảy ra ở đây        aggregation ở đây
```
Sensor chỉ thu thập data cho Edge. Edge là nơi training xảy ra và là ranh giới privacy thực sự.

(Smartphone đủ mạnh để train — đó là lý do Google dùng FL cho keyboard prediction. Nhưng IoT sensor ≠ smartphone.)

### ⚠️ Trap holes

**Trap 1 — FL = Privacy đảm bảo ✗**
FL chỉ là tầng 1 trong privacy stack:
```
Tầng 1: FL              → data không rời thiết bị
Tầng 2: Secure Aggregation → server chỉ thấy TỔNG, không thấy update riêng lẻ
Tầng 3: Differential Privacy → thêm nhiễu, chặn gradient inversion attack
```
Thiếu tầng 2 và 3 → gradient vẫn có thể bị reverse-engineer ra data gốc.

**Trap 2 — Secure Aggregation ≠ Differential Privacy**

| | Secure Aggregation | Differential Privacy |
|---|---|---|
| Bảo vệ khỏi | Server tò mò nhìn update từng client | Attacker reconstruct data từ aggregate |
| Cơ chế | Cryptographic — server chỉ giải mã được tổng | Thêm nhiễu toán học vào gradient |
| Trade-off | Communication overhead | Accuracy giảm |

**Trap 3 — Non-IID là vấn đề cốt lõi chưa giải**
Data thực tế không bao giờ IID. Mỗi client drift về local optimum → model toàn cục không hội tụ tốt.
FedProx và SCAFFOLD cải thiện nhưng vẫn còn gap lớn so với centralized training.

**Trap 4 — FL ≠ Distributed Training**

| | Distributed Training | Federated Learning |
|---|---|---|
| Mục đích | Train **nhanh hơn** | Train **mà không lộ data** |
| Data | Tập trung, chia nhau xử lý | Phân tán, không bao giờ gom |
| Vấn đề chính | Performance | Privacy + constraint |

### Insight cốt lõi
> **Chia sẻ tri thức (model), không chia sẻ dữ liệu.**
> FL không chỉ là kỹ thuật ML — nó là câu trả lời kiến trúc cho bài toán privacy trong hệ thống phân tán.

---

## 🔌 Week 4 — Matter, Thread, MQTT, CoAP (Kết nối cục bộ)

### Vấn đề cũ: "Tháp Babel" của IoT
Ẩn dụ từ Kinh Thánh: người xây tháp bị trừng phạt bằng cách mỗi người nói một ngôn ngữ khác → không ai hiểu ai → công trình sụp đổ.

Trước 2020, IoT y chang: Zigbee / Z-Wave / Wi-Fi / SmartThings / HAP — mỗi hãng một protocol. Không phải vô tình — đây là chiến lược **lock-in** có chủ đích. Hệ quả:
- Không thiết bị nào nói chuyện được với thiết bị hãng khác
- Tất cả **phụ thuộc cloud** — mất internet là mất điều khiển
- User: 5 thiết bị = 5 app, 5 hub, 5 tài khoản

### Giải pháp 1: Matter (tầng ứng dụng)
Apple + Google + Amazon + Samsung đồng ý dùng **một protocol chung**.
- **IP-first**: IPv6, không cần gateway dịch
- **Local-first**: Thiết bị nói chuyện trực tiếp, cloud là tuỳ chọn
- **Multi-Admin**: Một thiết bị thuộc nhiều fabric (HomeKit + Google Home cùng lúc)

### Bluetooth LE trong Matter — chỉ dùng cho commissioning
Bluetooth được nhắc đến **hai lần** trong W4:
1. Như một phần **vấn đề** — Bluetooth truyền thống point-to-point, mesh đến muộn, không phù hợp whole-home networking
2. Như **giải pháp bootstrap** trong Matter — BLE chỉ dùng để setup lần đầu (commissioning), sau đó tắt hoàn toàn

**Luồng commissioning đầy đủ:**
```
1. Thiết bị mới → BLE advertising ("tôi cần được setup")
2. Bạn quét QR code → app lấy discriminator + passcode
3. PASE handshake → kênh BLE được mã hoá (dùng passcode)
4. Device Attestation → xác minh certificate từ nhà sản xuất (hàng thật?)
5. Gửi WiFi/Thread credentials qua kênh đã mã hoá
6. Thiết bị kết nối vào network
7. BLE ngắt → Thread/WiFi từ đây
8. Fabric assignment → thiết bị có Node ID trong hệ thống
```

**Tại sao dùng BLE chứ không dùng WiFi để setup?**
Chicken-and-egg problem: để vào WiFi cần biết password, nhưng làm sao truyền password cho thiết bị chưa kết nối WiFi? → BLE là radio độc lập để bootstrap credentials.

> BLE = "cửa vào" duy nhất cho bước setup, rồi biến mất. Thiết kế đúng tool cho đúng bước.

### Giải pháp 2: Thread (tầng mạng)
**IPv6 mesh** tự vá — node chết, mạng tự định tuyến lại. Không có single point of failure.

Node roles (dynamic): Leader / Router / End Device (ngủ hầu hết thời gian).
Thread Border Router: kết nối mesh Thread ra ngoài WiFi/Internet.

### MQTT vs CoAP — hai triết lý khác nhau
| | MQTT | CoAP |
|---|---|---|
| Mô hình | Pub/Sub qua broker | Request/Response trực tiếp |
| Transport | TCP (tin cậy) | UDP (nhẹ) |
| Dùng cho | Nhiều thiết bị → cloud | Thiết bị ↔ thiết bị, constrained |

### Insight cốt lõi
> **Interoperability không tự nhiên mà có — phải được thiết kế từ đầu thông qua chuẩn.**
> "Local-first" không phải bước lùi — cloud nên là phần mở rộng, không phải điểm phụ thuộc.

---

## 📡 Week 5 — 6G & Non-Terrestrial Networks (Kết nối toàn cầu)

### Tại sao W5 nằm trong khoá IoT?
W5 trông như môn viễn thông — nhưng nó trả lời một câu hỏi rất cụ thể:

> *"Digital Twin cần đồng bộ liên tục. Matter/Thread (W4) phủ được toà nhà. Ai phủ sóng sensor ngoài đại dương, vùng núi, sa mạc?"*

W4 và W5 là **hai nửa của tầng connectivity** feeding data lên Digital Twin.

### Tiến hoá 3G → 4G → 5G → 6G
Mỗi G không phải "nhanh hơn" mà giải quyết **bài toán khác nhau**:

| | Bài toán giải | Cho ai |
|---|---|---|
| **3G** | Internet lần đầu trên mobile | Con người |
| **4G** | Đủ nhanh cho smartphone (video, app) | Con người |
| **5G** | Ba nhu cầu khác nhau cùng lúc | Người + máy |
| **6G** | Phủ sóng toàn cầu + tự thông minh | Máy móc là chính |

**5G = 3 mạng trong 1:**
- **eMBB**: tốc độ cao, cho người dùng (8K, AR/VR)
- **mMTC**: hàng triệu IoT cùng lúc, pin nhiều năm
- **URLLC**: latency < 1ms, cho robot, xe tự lái

**5G vẫn thiếu:**
- Coverage gaps (vùng xa, biển, không trung)
- Vệ tinh và mạng mặt đất là hai hệ thống riêng biệt
- Chưa AI-native

### Giải pháp: 6G (IMT-2030) = Mạng 3 chiều
```
Tầng 1: Vệ tinh LEO    (~500-2000km, latency ~20ms, phủ toàn cầu)
Tầng 2: HAPS           (~20km tầng bình lưu, quasi-stationary, khu vực)
Tầng 3: UAV            (~100m-5km, linh hoạt, on-demand)
Tầng 4: Mặt đất        (dày đặc, đô thị)
```

**HAPS** = High-Altitude Platform Station: khinh khí cầu/máy bay solar ở ~20km.
- Trên hết mây và máy bay thương mại
- Quasi-stationary (không cần handover liên tục như LEO)
- Phủ vùng rộng (hàng trăm km bán kính) — lý tưởng cho vùng hẻo lánh

**UAV trong mạng — hai vai trò:**
1. **UAV là user** — bay cao, kết nối như điện thoại nhưng gặp vấn đề interference (line-of-sight đến nhiều trạm cùng lúc)
2. **UAV là base station** — bay lên làm trạm phát sóng tạm thời, backhaul qua vệ tinh, phủ sóng cho IoT bên dưới (dùng cho thiên tai, vùng xa, sự kiện lớn)

6G cũng **AI-native**: mạng tự tối ưu, không cần người cấu hình.

### 3GPP Release — tại sao quan trọng?
- **Rel-17**: Milestone — lần đầu tích hợp vệ tinh vào chuẩn cellular
- **Rel-19**: Cầu nối sang 6G — AI radio, integrated sensing

### Insight cốt lõi
> **Kết nối IoT toàn cầu không thể chỉ dựa vào cơ sở hạ tầng mặt đất.**
> 6G = AI-native + phủ sóng 3D. NTN không phải "thêm vào" — nó là kiến trúc chính.

---

## 🔒 Week 6 — IoT Security (Bảo mật toàn stack)

### Tại sao IoT security khác IT security truyền thống?

| Yếu tố | IT truyền thống | IoT |
|--------|----------------|-----|
| Vòng đời | 3–5 năm, vá thường xuyên | 10–20 năm, thường không bao giờ vá |
| Vị trí | Phòng server có khoá | Ngoài trời, không ai canh gác |
| Hậu quả bị hack | Mất dữ liệu | Thiết bị vật lý hoạt động sai → nguy hiểm tính mạng |
| Tài nguyên | Thoải mái chạy TLS, RSA | MCU không đủ CPU cho crypto nặng |

### Các hình thức tấn công — lý do phải bảo vệ TẤT CẢ các tầng

**Tầng Hardware:**
- **Firmware dump**: cắm JTAG/UART → đọc firmware → tìm hardcoded keys, lỗ hổng logic
- **Device cloning**: đọc được identity + key → tạo hàng nghìn thiết bị giả mạo
- **Side-channel attack**: đo điện tiêu thụ/bức xạ EM khi chip đang tính crypto → reverse-engineer private key

**Tầng Firmware/OTA:**
- **Fake OTA update**: push firmware giả → kiểm soát toàn bộ fleet

**Tầng Network:**
- **MITM**: chặn giữa sensor và gateway, đọc/sửa data
- **Replay attack**: bắt gói "mở cửa" → replay lại sau
- **Spoofing**: giả địa chỉ sensor → gửi data giả lên Digital Twin

**Tầng Application:**
- **Data poisoning**: gửi sensor readings giả → Digital Twin ra quyết định sai → máy nổ
- **Command injection**: xâm nhập qua auth yếu → gửi lệnh tắt hệ thống

**Scale attacks — đặc thù IoT:**
> **Mirai Botnet 2016**: 600,000 camera/router IoT dùng default password "admin/admin" → script tự quét toàn internet, login hàng loạt → DDoS lớn nhất lịch sử → Twitter, Netflix, Reddit sập hàng giờ.

Tấn công **cascade** qua các tầng:
```
Hardware bị xâm nhập → lấy WiFi credentials → vào local network
→ tấn công thiết bị khác → inject data giả → Digital Twin ra lệnh sai → physical harm
```

### Giải pháp: Bảo mật theo tầng

**Tầng Hardware — "Tôi có thể tin thiết bị này không?"**

**Secure Boot** — chuỗi tin cậy từ lúc bật nguồn:
```
Boot ROM (burn vào chip, bất biến)
    ↓ verify chữ ký
Bootloader → nếu sai: dừng
    ↓ verify chữ ký
Firmware  → nếu sai: dừng
    ↓ verify chữ ký
Application
```
> Giống CI/CD pipeline: mỗi bước verify artifact — nếu bị tamper ở bất kỳ đâu, pipeline dừng.

**PUF** (Physical Unclonable Function) — dấu vân tay vật lý:
- Khai thác sai lệch sản xuất ngẫu nhiên của chip → mỗi chip có "fingerprint" duy nhất
- Key được **sinh ra từ vật lý**, không lưu trong bộ nhớ → không thể đọc ra, không thể clone
- Dùng để: xác thực thiết bị thật, chống clone
> Giống vân tay người — không ai giống ai, không cần "lưu" ở đâu vì nó là một phần của chip.

**TEE** (Trusted Execution Environment / ARM TrustZone) — vùng thực thi bí mật:
```
┌─────────────────────────────┐
│  NORMAL WORLD               │
│  Android / Linux (có thể bị hack) │
├─────────────────────────────┤  ← hardware barrier
│  SECURE WORLD (TEE)         │
│  Key storage, crypto ops    │
│  Normal World KHÔNG vào được│
└─────────────────────────────┘
```
Dù OS bị compromise hoàn toàn → key trong TEE vẫn an toàn.
Normal World muốn dùng key → gọi vào TEE → TEE trả kết quả, không trả key ra ngoài.
> Giống HSM trên cloud — bạn không lấy được private key ra, chỉ gửi data vào nhận kết quả đã ký về.

**Ba cái làm việc cùng nhau:**
```
PUF          → "Tôi là thiết bị thật" (identity)
Secure Boot  → "Firmware của tôi là hàng thật"
TEE          → "Keys của tôi an toàn dù OS bị hack"
```

**Tầng Network**

**Thread AES** — mã hoá hop-by-hop trong mesh:
- AES-128 ở link layer, network key chia sẻ khi commissioning qua BLE (W4)
- Bảo vệ trong local mesh, chống radio scanner nghe lén

**DTLS** — TLS cho UDP:
- TLS yêu cầu TCP (quá nặng cho IoT, CoAP dùng UDP) → DTLS = TLS security trên UDP
- Xử lý thêm: sequence number (reorder), retransmission, Connection ID (session sống qua IP change)
- Bảo vệ từng đoạn kết nối (device ↔ gateway, gateway ↔ cloud)

**Tại sao cần cả Thread AES và DTLS?**
```
[Sensor] ──Thread AES──► [Gateway] ──DTLS──► [Cloud]
        hop-by-hop local          từng đoạn internet
```
- Chỉ Thread AES → traffic lộ trên internet sau gateway
- Chỉ DTLS → traffic trong mesh bị nghe lén bằng radio scanner

**Tầng Application**

**OSCORE** — mã hoá end-to-end kể cả qua proxy:

Vấn đề: DTLS bị **terminate tại mỗi proxy** → proxy đọc được plaintext.

OSCORE mã hoá **message** thay vì channel:
```
[Sensor] → {message đã mã hoá} → [Proxy] → {vẫn mã hoá} → [Cloud]
                                   proxy forward mà không đọc được
```

**OSCORE vs TLS/DTLS:**
- TLS/DTLS = mã hoá kênh truyền (tunnel/VPN)
- OSCORE = mã hoá nội dung message (giống Signal E2E encryption)
- Cả hai dùng crypto tương tự nhưng OSCORE mới là true end-to-end

**Full security stack:**
```
[Hardware]    PUF → Secure Boot → TEE
[Link]        Thread AES
[Transport]   DTLS
[Application] OSCORE
```

### STRIDE — framework tư duy threat modeling
**S**poofing / **T**ampering / **R**epudiation / **I**nformation Disclosure / **D**enial of Service / **E**levation of Privilege

### Insight cốt lõi
> **Bảo mật không phải tính năng thêm vào sau — phải là quyết định kiến trúc từ tầng hardware.**
> Một tầng bị thủng → toàn bộ hệ thống có thể bị compromise theo cascade.

---

## 🔭 Week 7 — Open Research (Biên giới của những gì chưa giải được)

Week 7 không dạy giải pháp — nó dạy **bạn đang đứng ở đâu trên bản đồ tri thức**.

### Tại sao quan trọng khi thi?
Câu trả lời hoàn chỉnh cho bất kỳ câu hỏi tự luận nào cần kết thúc bằng open challenges. Thầy muốn thấy bạn hiểu **giới hạn của giải pháp**, không chỉ cách nó hoạt động.

### Open challenges chi tiết

**W1 — Digital Twin chưa sync được real-time ở scale lớn:**
```
1 sensor → 10 updates/giây
1,000,000 sensor → 10,000,000 updates/giây
→ chưa có hệ thống nào xử lý được mà vẫn đảm bảo consistency + real-time
```
Thêm vào đó: mô hình vật lý phức tạp (fluid dynamics, nhiệt học, rung động cùng lúc) phải trade-off giữa accuracy và speed.

**W2 — TinyML chưa quản lý được fleet hàng triệu model:**
- Thiết bị đời 2019/2021/2023 có hardware khác nhau → model version khác nhau
- Model drift (môi trường thay đổi, model cũ không còn chính xác) → detect và fix tự động thế nào?
- OTA update model an toàn, rollback khi model mới tệ hơn?
- Chưa có MLOps framework nào giải tốt cho IoT scale

**W3 — FL non-IID vẫn còn gap lớn:**
```
Centralized training:        accuracy 95%
FedAvg với IID data:         accuracy 93%  ← chấp nhận được
FedAvg với non-IID data:     accuracy 78%  ← gap lớn
FedProx / SCAFFOLD:          accuracy 84%  ← cải thiện, vẫn còn gap
```
Khi scale lên hàng triệu thiết bị: chọn subset tham gia mỗi round thế nào? Thiết bị yếu train chậm → bỏ qua hay đợi? → bias về thiết bị mạnh.

**W4 — Matter/Thread vẫn còn gaps:**
- Hàng tỉ thiết bị Zigbee/Z-Wave cũ không upgrade lên Matter được → phải dùng bridge → thêm latency, complexity, attack vector mới
- Industrial IoT (Modbus, PROFINET, OPC-UA) hoàn toàn nằm ngoài Matter
- Certification process chậm và tốn kém → hãng nhỏ không làm được

**W5 — 6G frontiers vẫn là research:**
- **THz**: băng thông khổng lồ nhưng bị hấp thụ bởi không khí, range vài chục mét, không xuyên tường → cần antenna dày đặc → chi phí khổng lồ
- **RIS**: cần biết chính xác vị trí thiết bị để định hướng phản xạ, môi trường thay đổi liên tục → tính toán lại liên tục, chưa có standard tích hợp
- **ISAC**: signal processing cực phức tạp để tách sensing khỏi communication signal, interference khó manage, chưa có chip commercial nào làm tốt cả hai

**W6 — Zero Trust chưa chạy được trên MCU:**
Zero Trust = không tin tưởng ai, luôn verify mọi request. Trên server làm được. Trên MCU:
- Continuous authentication → crypto liên tục → pin cạn nhanh
- Behaviour monitoring → cần lưu history → không đủ RAM
- Certificate validation → PKI chain nặng cho MCU
- Real-time policy enforcement → cần kết nối liên tục → không offline được

Hiện tại chỉ có thể partial Zero Trust — không phải continuous verification thực sự.

### Insight cốt lõi
> **IoT chưa phải ngành đã giải xong.** Mỗi tuần học là một giải pháp tốt nhất hiện tại — không phải hoàn hảo. Week 7 là lời nhắc: bạn đang đứng ở biên giới, không phải ở cuối đường.

---

## 🗺️ Bản đồ kết nối giữa các tuần

```
[W1: Digital Twin] ← cần dữ liệu từ ← [W4: Matter/Thread] ← mở rộng ra ← [W5: 6G/NTN]
        |                                        |
        | cần AI                          kết nối cho
        ↓                                        ↓
[W2: TinyML] ──── nhiều thiết bị cùng học ──→ [W3: Federated Learning]
        |                                        |
        └──────────────── cả hai cần ───────────→ [W6: Security]
                                                 |
                                       tất cả đều có gaps
                                                 ↓
                                          [W7: Open Research]
```

---

## ✍️ Framework trả lời tự luận

Với **bất kỳ câu hỏi nào**, cấu trúc sau sẽ cho bạn điểm cao:

```
1. VẤN ĐỀ:   Trước X ra đời, người ta đang gặp pain point gì?
2. GIẢI PHÁP: X giải quyết bằng cách nào?
3. ĐÁNH ĐỔI: X có trade-off gì? Khi nào thì X không phù hợp?
4. KẾT NỐI:  X liên quan đến khái niệm nào khác trong khoá?
5. OPEN:     Vấn đề gì X chưa giải được? (W7)
```

**Ví dụ — "Tại sao cần Federated Learning?":**
1. **Vấn đề**: Data IoT phân tán, không thể centralise vì privacy + bandwidth + legal
2. **Giải pháp**: Train cục bộ tại Edge Gateway, chỉ share model update (gradient diff), server FedAvg aggregate
3. **Đánh đổi**: Non-IID data làm model không hội tụ; gradient vẫn có thể leak (cần DP + SecAgg); MCU không train được → Edge Gateway là client thực sự
4. **Kết nối**: FL dùng TinyML model (W2) ở terminal; cần connectivity (W4/W5) để truyền update; cần DP + Secure Aggregation từ security (W6)
5. **Open**: Non-IID convergence gap, fleet model management, communication overhead — vẫn là open problems (W7)

**Ví dụ — "Tại sao cần bảo mật nhiều tầng trong IoT?":**
1. **Vấn đề**: Thiết bị IoT ngoài trời không ai canh, vòng đời 20 năm, không đủ tài nguyên cho crypto nặng — IT security truyền thống không áp dụng được
2. **Giải pháp**: Stack bảo mật từ hardware (PUF, Secure Boot, TEE) → network (Thread AES, DTLS) → application (OSCORE)
3. **Đánh đổi**: Mỗi tầng thêm overhead; TEE cần hardware support; OSCORE thêm complexity
4. **Kết nối**: TinyML (W2) tự nó là privacy mechanism (data không rời thiết bị); FL (W3) cần Secure Aggregation + DP; BLE commissioning (W4) truyền network key qua kênh mã hoá
5. **Open**: Zero Trust cho constrained devices vẫn chưa có giải pháp nhẹ (W7)

---

## 🔬 Phân tích chuyên sâu theo chủ đề

---

### Kiến trúc 4 tầng IoT — Nhìn kỹ hơn vào từng tầng

Khi nói về "hệ thống IoT", người ta thường vẽ 4 tầng chồng lên nhau. Nhưng quan trọng hơn là hiểu **tại sao cần 4 tầng** thay vì 2 (device + cloud).

```
┌─────────────────────────────────┐
│     User Application Layer      │
├─────────────────────────────────┤
│       Cloud Server Layer        │
├─────────────────────────────────┤
│    Edge Server / Gateway Layer  │  ← tầng thêm vào so với mô hình cũ
├─────────────────────────────────┤
│      Device / Sensor Layer      │
└─────────────────────────────────┘
```

**Tầng 1 — Device/Sensor**: thu thập và tác động vật lý
- Nguồn dữ liệu gốc (nhiệt độ, hình ảnh, chuyển động...)
- Thực thi lệnh qua actuator
- Tài nguyên cực hạn: RAM vài trăm KB, pin, CPU yếu
- Protocol: Zigbee, BLE, Thread, LoRa — tất cả đều thiết kế cho low-power

**Tầng 2 — Edge/Gateway**: bộ não cục bộ
- Lý do tồn tại: device quá yếu để xử lý, cloud quá xa để phản xạ nhanh
- Tổng hợp data từ nhiều sensor, lọc, chuẩn hoá
- Dịch protocol (Zigbee → IP/MQTT)
- Ra quyết định real-time mà không cần cloud
- FL client thực sự (W3) — nơi training xảy ra

**Tầng 3 — Cloud**: trí tuệ toàn cục
- Lịch sử dài hạn, analytics nâng cao, train ML
- Quản lý fleet thiết bị
- Host Digital Twin
- Không bị giới hạn tài nguyên

**Tầng 4 — User Application**: giao diện con người
- Dashboard, mobile app, alert
- Điểm can thiệp khi hệ thống cần human judgment

**Điều thú vị về luồng dữ liệu**: không phải mọi thứ đều đi lên cloud.
```
Device → Edge → Cloud → App   (analytics path)
Device → Edge → Device         (real-time control path, cloud không tham gia)
```
Edge là nơi hai luồng này tách ra.

---

### Edge Computing — Tại sao không để cloud làm hết?

Câu hỏi thực tế: *nếu cloud mạnh hơn edge, sao không đẩy tất cả lên cloud?*

Vấn đề là **4 constraint không thể vượt qua bằng compute mạnh hơn**:

**Latency vật lý**: tốc độ ánh sáng có giới hạn. Round-trip đến cloud server cách 1000km tối thiểu ~10ms, thực tế 50–200ms. Robot dừng khẩn cấp cần < 5ms — không bao giờ đạt được qua cloud.

**Bandwidth kinh tế**: 1000 camera HD stream liên tục = ~4Gbps. Chi phí bandwidth đó là bao nhiêu mỗi tháng? Edge extract events → chỉ gửi "phát hiện người lúc 14:32" thay vì toàn bộ video.

**Privacy pháp lý**: dữ liệu bệnh nhân, dữ liệu sản xuất — nhiều trường hợp luật cấm gửi ra ngoài cơ sở.

**Resilience**: cloud là single point of failure. Mất internet → hệ thống mù. Edge cho phép hoạt động độc lập.

| Tiêu chí | Cloud-only | Edge + Cloud |
|----------|-----------|-------------|
| Latency | 50–200ms | < 5ms (local) |
| Bandwidth | Raw data toàn bộ | Chỉ kết quả/events |
| Offline | Không hoạt động | Hoạt động bình thường |
| Privacy | Data rời cơ sở | Data ở lại local |

---

### Chọn công nghệ truyền thông — Phụ thuộc vào yêu cầu

Một trong những nhầm lẫn phổ biến là nghĩ MQTT/CoAP là "IoT protocol" cho mọi trường hợp. Thực ra **không có một protocol nào phù hợp cho tất cả** — phải chọn dựa trên đặc tính của dữ liệu.

**Framework chọn protocol:**

```
Dữ liệu nhỏ, không thường xuyên, vùng xa?  → LoRaWAN, NB-IoT
Dữ liệu nhỏ, local mesh, pin thấp?          → Thread + CoAP
Nhiều thiết bị gửi telemetry lên cloud?      → MQTT
Device ↔ device trực tiếp, constrained?      → CoAP
Video, hình ảnh, băng thông cao, local?      → WiFi 6
Video, băng thông cao, wide-area?            → 5G eMBB
Latency cực thấp, critical control?         → 5G URLLC
```

**Tại sao Thread/MQTT/CoAP không phù hợp cho video:**
- Thread: ~250Kbps — một frame HD đã vượt quá
- MQTT/CoAP chạy trên mạng nào thì bandwidth của mạng đó quyết định, không phải protocol
- Video cần **WiFi 6** (local) hoặc **5G eMBB** (wide-area)

**5G eMBB trong bức tranh lớn hơn**: Đây là lý do 5G không chỉ là "4G nhanh hơn" mà phân tách thành 3 slices hoàn toàn khác nhau (W5). Mỗi slice tối ưu cho một loại traffic — không thể tối ưu cho tất cả cùng lúc.

---

### MQTT vs CoAP — Không phải đối thủ mà là cặp đôi

| Tiêu chí | MQTT | CoAP |
|----------|------|------|
| Mô hình | Pub/Sub qua broker | Request/Response trực tiếp |
| Transport | TCP | UDP |
| Broker | Bắt buộc | Không cần |
| Overhead | Cao hơn | Thấp hơn |
| QoS | 3 mức (0/1/2) | Confirmable / Non-confirmable |
| Bảo mật | TLS | DTLS + OSCORE |
| Tốt cho | Nhiều device → cloud, fan-out | Device ↔ device, mạng lossy |

Hệ thống thực tế thường dùng cả hai:
```
Sensor →[CoAP]→ Edge Gateway →[MQTT]→ Cloud
          device-to-edge         edge-to-cloud
```

CoAP nhẹ hơn cho đoạn constrained, MQTT scale tốt hơn cho đoạn cloud.

**OSCORE chỉ chạy với CoAP** — nếu cần end-to-end security qua proxy (W6), phải dùng CoAP.

---

### Edge vs Cloud — Framework ra quyết định

Bất kỳ hệ thống IoT nào cũng phải trả lời: *xử lý thứ này ở đâu?*

Phân tích theo 3 chiều:

**Latency**: quyết định có cần phản ứng ngay không?
- < 100ms: bắt buộc ở edge (safety, control loop)
- Vài giây đến vài phút: edge hoặc cloud đều được
- Batch/daily: cloud

**Bandwidth**: dữ liệu có tốn băng thông để gửi lên không?
- Video, audio, lidar: xử lý ở edge, chỉ gửi kết quả
- Sensor text nhỏ (nhiệt độ, trạng thái): gửi cloud được

**Computation**: edge có đủ sức xử lý không?
- Threshold đơn giản: device/edge dễ dàng
- TinyML inference: edge được (nếu model đã compress)
- Train model mới: cloud
- Heavy analytics: cloud

**Ví dụ phân tích — hệ thống nông nghiệp thông minh:**

| Tác vụ | Latency | Bandwidth | Computation | → |
|--------|---------|-----------|-------------|---|
| Phát hiện sâu bệnh → phun thuốc | Cần ngay | Camera nặng | TinyML vừa | **Edge** |
| Tưới theo lịch | Không gấp | Nhỏ | Đơn giản | Cloud |
| Train model sâu bệnh mới | Không gấp | Lịch sử lớn | Nặng | **Cloud** |
| Dự báo năng suất mùa vụ | Không gấp | Nhiều năm data | Rất nặng | **Cloud** |

→ Kết luận luôn là **hybrid**: edge cho real-time + data nặng, cloud cho analytics + training.

---

### Trade-off trong thiết kế IoT — Latency vs Accuracy

Đây là một trong những trade-off hay gặp nhất khi thiết kế hệ thống IoT có AI.

**Bản chất của trade-off:**
```
Model lớn, chính xác hơn → cần cloud → latency cao
Model nhỏ, deploy ở edge → latency thấp → accuracy thấp hơn
```

**Khi nào ưu tiên latency:**
- Safety-critical: phát hiện sương giá, rò rỉ khí, dừng khẩn cấp
- Thiệt hại do phản ứng chậm > thiệt hại do phán đoán sai đôi lần
- Model edge 88% accuracy + phản ứng 50ms có thể tốt hơn model cloud 95% + phản ứng 2 giây

**Khi nào ưu tiên accuracy:**
- Không time-critical: chẩn đoán bệnh, dự báo bảo trì
- Sai một lần có hậu quả lớn hơn phản ứng chậm

**Cách cải thiện accuracy mà không hi sinh latency:**

*Federated Learning (W3)*: nhiều edge node cùng train → model toàn cục dần tốt hơn mà inference vẫn ở edge, latency không đổi.

*MCUNet co-design (W2)*: thay vì nén model generic, thiết kế model riêng cho hardware cụ thể → accuracy tốt hơn trong cùng memory budget.

*Hierarchical inference*:
```
Edge: model nhỏ → xử lý cases rõ ràng (confidence cao)
         ↓ nếu không chắc
Cloud: model lớn → xử lý edge cases
```
Latency trung bình thấp vì phần lớn cases được xử lý ở edge.

---

### Điểm yếu của kiến trúc IoT 4 tầng — Nhìn từ góc độ security

Kiến trúc 4 tầng giải quyết được bài toán latency và scalability, nhưng tạo ra 3 điểm yếu về security mà IT truyền thống không gặp.

**Điểm yếu 1 — Device tầng dưới cùng: không bảo vệ được vật lý**

Server nằm trong data center có khoá và camera. IoT device nằm ngoài đường, trong rừng, trên tàu biển. Kẻ tấn công có thể cầm tay thiết bị → firmware dump, side-channel attack, device clone. Và vì vòng đời 10–20 năm, lỗ hổng phát hiện sau không có cơ chế vá.

> Attack surface này không tồn tại trong IT — toàn bộ security model IT assume thiết bị nằm trong môi trường kiểm soát.

**Điểm yếu 2 — Gateway là điểm hội tụ nguy hiểm**

Gateway biết credentials của tất cả device bên dưới VÀ credentials của cloud bên trên — nó là nơi hai thế giới gặp nhau. Nếu bị compromise, kẻ tấn công có được cả hai hướng:
```
Gateway bị hack
    ↓              ↑
tất cả device  toàn bộ cloud
```
Đây là single point of failure không có trong kiến trúc IT phân tán.

**Điểm yếu 3 — Attack path dọc qua tất cả tầng**

Các tầng kết nối trực tiếp, không có isolation đủ mạnh → một tầng bị thủng là có thể leo lên tầng trên:
```
Device yếu → Gateway → Cloud → toàn bộ fleet
```
Mirai botnet 2016 là ví dụ: device yếu (camera default password) → botnet 600K thiết bị → DDoS toàn internet.

**Hệ quả**: security không thể chỉ ở một tầng. Phải bảo vệ từng tầng độc lập (PUF/Secure Boot ở device, hardening ở gateway, Zero Trust ở cloud) và mã hoá xuyên suốt (DTLS + OSCORE).

---

### IoT Security vs IT Security — Tại sao không thể áp dụng lại nguyên si

Khi xây hệ thống IT, có một bộ công cụ đã proven: TLS, PKI, patch management, intrusion detection. Vấn đề là **mỗi công cụ đó đều assume một thứ không đúng với IoT**.

| Assumption của IT security | Thực tế IoT |
|---------------------------|-------------|
| Thiết bị đủ mạnh chạy TLS/RSA | MCU vài KB RAM, TLS quá nặng → phải dùng DTLS, ECC, Ascon |
| Thiết bị được vá thường xuyên | Vòng đời 15–20 năm, thường không ai vá → phải thiết kế đúng từ đầu |
| Thiết bị nằm trong môi trường kiểm soát | Device ngoài trời, ai cũng cầm được → cần hardware root of trust (PUF, TEE) |
| Vài nghìn thiết bị → quản lý certificate được | Hàng triệu thiết bị → key rotation, provisioning, revocation ở scale chưa giải được |
| Hậu quả tệ nhất: mất dữ liệu | Hậu quả: máy nổ, van khí mở, thiết bị y tế tắt → **tính mạng** |
| Protocol chuẩn hoá (TCP/IP) | Hàng chục protocol, mỗi cái security model khác nhau |

**Điểm mấu chốt**: mỗi sự khác biệt này là lý do tại sao một tầng trong security stack tồn tại. PUF ra đời vì thiết bị IoT có thể bị cầm tay. Secure Boot ra đời vì không ai vá firmware. DTLS ra đời vì TLS quá nặng. OSCORE ra đời vì proxy terminate DTLS.

> IoT security không phải "IT security nhẹ hơn" — đó là một bài toán thiết kế khác hoàn toàn, đòi hỏi tư duy security-by-design từ phần cứng lên.
