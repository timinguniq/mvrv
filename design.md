# BTC MVRV Tracker - 기술 설계 문서

## 1. 개요

Bitcoin MVRV(Market Value to Realized Value) 지표를 직관적으로 시각화하여 투자자가 시장 과대평가/과소평가 구간을 식별할 수 있도록 돕는 모바일 앱.

---

## 2. 아키텍처

Clean Architecture 4계층 구조를 따름.

```
┌─────────────────────────────────────┐
│         Presentation Layer          │
│  (Pages, Widgets, Providers)        │
├─────────────────────────────────────┤
│           Domain Layer              │
│  (Repository Interface, UseCases)   │
├─────────────────────────────────────┤
│            Data Layer               │
│  (API Client, Storage)              │
├─────────────────────────────────────┤
│           Entity Layer              │
│  (Freezed Models)                   │
└─────────────────────────────────────┘
```

---

## 3. Entity (데이터 모델)

### 3.1. MvrvData
MVRV 차트의 개별 데이터 포인트.

```dart
@freezed
class MvrvData {
  DateTime date;        // 날짜
  double btcPrice;      // BTC 가격 (USD)
  double mvrvRatio;     // MVRV 비율
}
```

### 3.2. MvrvAlert
사용자 커스텀 알림 설정.

```dart
@freezed
class MvrvAlert {
  String id;                // 고유 ID
  double targetValue;       // 목표 MVRV 값
  MvrvAlertDirection direction; // above(초과) / below(미만)
  bool enabled;             // 활성화 여부
  DateTime createdAt;       // 생성 시각
}
```

### 3.3. MvrvAlertDirection (Enum)
```dart
enum MvrvAlertDirection { above, below }
```

### 3.4. MvrvTimeframe (Enum)
차트 기간 필터.

```dart
enum MvrvTimeframe { oneWeek, oneMonth, threeMonths, oneYear, all }
```

### 3.5. MvrvZone (Enum)
현재 MVRV 구간 판별.

```dart
enum MvrvZone { overvalued, neutral, undervalued }
// overvalued: MVRV > 3.7 (Red Zone)
// undervalued: MVRV < 1.0 (Green Zone)
// neutral: 1.0 <= MVRV <= 3.7
```

---

## 4. Data Layer

### 4.1. MvrvApi
온체인 데이터 API 클라이언트. Dio 기반 CHttpClient 활용.

| Method | Endpoint | 설명 |
|--------|----------|------|
| `getMvrvHistory(MvrvTimeframe)` | `GET /v1/mvrv/history` | 기간별 MVRV 히스토리 조회 |
| `getCurrentMvrv()` | `GET /v1/mvrv/current` | 현재 MVRV 값 조회 |

### 4.2. MvrvAlertStorage
LocalStorage(FlutterSecureStorage) 기반 알림 설정 로컬 저장소.

| Method | 설명 |
|--------|------|
| `saveAlerts(List<MvrvAlert>)` | 알림 목록 저장 |
| `getAlerts()` | 저장된 알림 목록 조회 |
| `deleteAlert(String id)` | 특정 알림 삭제 |

---

## 5. Domain Layer

### 5.1. MvrvRepository (Interface)

```dart
abstract class MvrvRepository {
  Future<Result<List<MvrvData>>> getMvrvHistory(MvrvTimeframe timeframe);
  Future<Result<MvrvData>> getCurrentMvrv();
  Future<List<MvrvAlert>> getAlerts();
  Future<void> saveAlert(MvrvAlert alert);
  Future<void> deleteAlert(String id);
}
```

### 5.2. MvrvRepositoryImpl
MvrvApi + MvrvAlertStorage를 조합하여 Repository 구현.

---

## 6. Presentation Layer

### 6.1. 상태 관리 (Riverpod)

| Provider | 타입 | 설명 |
|----------|------|------|
| `mvrvTimeframeProvider` | `StateProvider<MvrvTimeframe>` | 선택된 기간 필터 |
| `mvrvHistoryProvider` | `FutureProvider<List<MvrvData>>` | 차트 데이터 |
| `currentMvrvProvider` | `FutureProvider<MvrvData>` | 현재 MVRV 값 |
| `mvrvAlertsProvider` | `StateNotifierProvider<MvrvAlertsNotifier>` | 알림 목록 관리 |

### 6.2. 페이지 구성

#### DashboardPage (메인 대시보드)
- **MVRV 차트**: BTC 가격 + MVRV 비율 오버레이 라인 차트
  - 빨간 배경: MVRV > 3.7 (과대평가 구간)
  - 초록 배경: MVRV < 1.0 (과소평가 구간)
- **기간 필터**: 1W / 1M / 3M / 1Y / ALL 탭
- **툴팁**: 터치 시 해당 날짜의 BTC 가격, MVRV 값 표시
- **일일 인사이트**: 현재 MVRV 기반 텍스트 요약

#### AlertSettingPage (알림 설정)
- 알림 목록 표시 (활성/비활성 토글)
- 새 알림 추가 (목표 MVRV 값 + 방향 설정)
- 알림 삭제 (스와이프)

### 6.3. 라우팅

```dart
enum RoutePath {
  splash('/splash'),
  dashboard('/dashboard'),
  alertSetting('/alert-setting'),
}
```

---

## 7. 의존성 추가

```yaml
fl_chart: ^0.70.2  # 차트 라이브러리
```

---

## 8. MVRV 구간 판별 로직

```
if (mvrvRatio > 3.7) → 과대평가 (Red Zone)
  인사이트: "비트코인이 실현 가치 대비 과대평가 구간에 진입했습니다."

if (mvrvRatio < 1.0) → 과소평가 (Green Zone)
  인사이트: "비트코인이 실현 가치 대비 과소평가 구간에 진입했습니다."

else → 중립 (Neutral)
  인사이트: "비트코인이 실현 가치 대비 적정 가격 구간에 있습니다."
```

---

## 9. 데이터 플로우

```
[온체인 API] → MvrvApi → MvrvRepositoryImpl → Riverpod Provider → UI
                              ↑
[LocalStorage] → MvrvAlertStorage ─┘
```
