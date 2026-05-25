<div align="center">
  <img src="asset/icon/app_icon.png" width="120" alt="MVRV App Icon" />
  <h1>MVRV Z-Score Dashboard</h1>
  <p>비트코인 온체인 지표를 한눈에 — MVRV Z-Score · NUPL · Delta Cap</p>

  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter" alt="Flutter" />
  <img src="https://img.shields.io/badge/Firebase-enabled-FFCA28?logo=firebase&logoColor=black" alt="Firebase" />
  <img src="https://img.shields.io/badge/Platform-iOS%20%7C%20Android-lightgrey" alt="Platform" />
</div>

---

## 소개

**MVRV Z-Score Dashboard**는 비트코인 투자자를 위한 온체인 분석 앱입니다.
시장 과열·저평가 구간을 실시간으로 파악할 수 있는 핵심 지표를 깔끔한 다크 UI로 제공합니다.

---

## 주요 기능

### 비트코인 현재가 (Market Price)
- 실시간 BTC/USD 가격
- 24시간 등락률 (상승 / 하락 색상 구분)

### MVRV Z-Score
비트코인의 시가총액과 실현 가치 사이의 표준 편차를 시각화합니다.

| 구간 | 범위 | 의미 |
|---|---|---|
| Capitulation Zone | Z < 0 | 극단적 공포, 역사적 저점 근처 |
| Accumulation Zone | 0 ≤ Z < 2 | 저평가 누적 구간 |
| Neutral Zone | 2 ≤ Z < 5 | 적정 가격 |
| Distribution Zone | 5 ≤ Z < 7 | 고평가 분배 구간 |
| Euphoria Zone | Z ≥ 7 | 과열, 역사적 고점 근처 |

### MVRV Index Trend Chart
- 1M / 6M / 1Y / ALL 기간 필터
- 커스텀 라인 차트 (그래디언트 글로우 + 점선 베이스라인)

### Delta Cap
- 비트코인 전체 공급량 기준 시장 기반 지지선 추정치 (USD)

### NUPL (Net Unrealized Profit/Loss)
비트코인 홀더 전체의 미실현 손익 비율로 시장 심리를 나타냅니다.

| 구간 | 범위 | 심리 |
|---|---|---|
| Capitulation | NUPL < 0 | 항복 국면 |
| Hope / Fear | 0 ≤ NUPL < 0.25 | 희망과 공포 교차 |
| Optimism / Anxiety | 0.25 ≤ NUPL < 0.5 | 낙관과 불안 공존 |
| Belief / Denial | 0.5 ≤ NUPL < 0.75 | 강한 확신 구간 |
| Euphoria / Greed | NUPL ≥ 0.75 | 시장 과열 |

### 홈 화면 위젯 (Android)
앱을 열지 않아도 홈 화면에서 MVRV Z-Score를 바로 확인할 수 있습니다.

---

## 기술 스택

| 영역 | 사용 기술 |
|---|---|
| 프레임워크 | Flutter 3.x |
| 상태 관리 | Riverpod · Provider |
| 라우팅 | go_router |
| 네트워크 | Retrofit · Dio |
| 직렬화 | Freezed · json_serializable |
| 백엔드 | Firebase (Firestore, Remote Config, Analytics, Crashlytics) |
| 광고 | Google Mobile Ads (AdMob) — 배너 + 전면 광고 |
| 홈 위젯 | home_widget |
| 폰트 | Pretendard |

### 아키텍처

Clean Architecture 기반의 레이어드 구조입니다.

```
lib/
├── entity/          # 순수 데이터 모델 (Freezed)
├── domain/          # Use Case · Repository 인터페이스
├── data/            # Repository 구현체 · API
├── presentation/    # Page · ViewModel · Widget
├── core/            # DI · 공통 베이스 클래스
└── theme/           # 컬러 팔레트 · 텍스트 스타일
```

---

## 시작하기

### 사전 요구사항

- Flutter SDK `>=3.11.0`
- Firebase 프로젝트 및 `google-services.json` / `GoogleService-Info.plist`
- `.env` 파일 (API 키 등 환경 변수)

### 설치

```bash
# 의존성 설치
flutter pub get

# 코드 생성 (Freezed / Retrofit)
dart run build_runner build --delete-conflicting-outputs

# 실행
flutter run
```

---

## 라이선스

This project is private and not licensed for public distribution.
