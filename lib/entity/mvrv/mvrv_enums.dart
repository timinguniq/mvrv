/// 차트 기간 필터
enum MvrvTimeframe {
  /// 1주
  oneWeek('1W'),

  /// 1개월
  oneMonth('1M'),

  /// 3개월
  threeMonths('3M'),

  /// 1년
  oneYear('1Y'),

  /// 전체
  all('ALL');

  const MvrvTimeframe(this.label);

  final String label;

  /// API 쿼리 파라미터용 일수 반환
  int? get days => switch (this) {
        MvrvTimeframe.oneWeek => 7,
        MvrvTimeframe.oneMonth => 30,
        MvrvTimeframe.threeMonths => 90,
        MvrvTimeframe.oneYear => 365,
        MvrvTimeframe.all => null,
      };
}

/// MVRV 구간 판별
enum MvrvZone {
  /// 과대평가: MVRV > 3.7
  overvalued,

  /// 적정 가격: 1.0 <= MVRV <= 3.7
  neutral,

  /// 과소평가: MVRV < 1.0
  undervalued;

  static MvrvZone fromRatio(double mvrvRatio) {
    if (mvrvRatio > 3.7) return MvrvZone.overvalued;
    if (mvrvRatio < 1.0) return MvrvZone.undervalued;
    return MvrvZone.neutral;
  }

  /// 구간별 인사이트 메시지
  String get insight => switch (this) {
        MvrvZone.overvalued =>
          '비트코인이 실현 가치 대비 과대평가 구간에 진입했습니다.',
        MvrvZone.undervalued =>
          '비트코인이 실현 가치 대비 과소평가 구간에 진입했습니다.',
        MvrvZone.neutral =>
          '비트코인이 실현 가치 대비 적정 가격 구간에 있습니다.',
      };
}
