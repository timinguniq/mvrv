/// NUPL 시장 심리 구간
///
/// 일반적인 온체인 분석 기준:
///  - capitulation: NUPL < 0
///  - hopeFear:     0   ≤ NUPL < 0.25
///  - optimism:     0.25 ≤ NUPL < 0.5
///  - belief:       0.5 ≤ NUPL < 0.75
///  - euphoria:     NUPL ≥ 0.75
enum NuplZone {
  capitulation('Capitulation', double.negativeInfinity, 0),
  hopeFear('Hope / Fear', 0, 0.25),
  optimism('Optimism / Anxiety', 0.25, 0.5),
  belief('Belief / Denial', 0.5, 0.75),
  euphoria('Euphoria / Greed', 0.75, double.infinity);

  const NuplZone(this.label, this.min, this.max);

  final String label;
  final double min;
  final double max;

  static NuplZone fromValue(double value) {
    for (final zone in values) {
      if (value >= zone.min && value < zone.max) return zone;
    }
    return value < 0 ? capitulation : euphoria;
  }

  /// 구간별 인사이트 메시지
  String get insight => switch (this) {
    NuplZone.capitulation =>
      '시장 전체가 미실현 손실 구간에 있어 항복(Capitulation) 국면입니다.',
    NuplZone.hopeFear => '미실현 수익이 미미해 희망과 공포가 교차하는 국면입니다.',
    NuplZone.optimism => '낙관과 불안이 공존하는 회복 국면입니다.',
    NuplZone.belief => '강한 확신과 부정이 교차하는 상승 후반 국면입니다.',
    NuplZone.euphoria => '시장 전체가 큰 미실현 수익을 보유한 과열(Euphoria) 국면입니다.',
  };
}
