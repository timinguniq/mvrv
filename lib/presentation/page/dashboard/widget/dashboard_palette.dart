import 'package:flutter/material.dart';

/// 대시보드 전용 다크 팔레트 (Splash 화면 컬러 참고)
abstract class DashboardPalette {
  /// 페이지 배경
  static const Color background = Color(0xFF0A0E1A);

  /// 카드 배경
  static const Color card = Color(0xFF1A2035);

  /// 카드 보조 배경 (약간 밝은 톤)
  static const Color cardAlt = Color(0xFF1E2537);

  /// 활성 세그먼트 배경
  static const Color segmentActive = Color(0xFF2A3350);

  /// 구분선
  static const Color divider = Color(0xFF242B42);

  /// 텍스트 – 메인
  static const Color textPrimary = Color(0xFFF4F5F7);

  /// 텍스트 – 보조
  static const Color textSecondary = Color(0xFF9AA5BF);

  /// 텍스트 – 옅은
  static const Color textMuted = Color(0xFF6B7A99);

  /// 액센트 – 주 (오렌지 → Splash 와 동일)
  static const Color accent = Color(0xFFFF9500);

  /// 액센트 – 강조
  static const Color accentStrong = Color(0xFFFF6A13);

  /// 상승 (긍정)
  static const Color positive = Color(0xFF00E676);
}
