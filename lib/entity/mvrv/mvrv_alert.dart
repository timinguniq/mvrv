import 'package:freezed_annotation/freezed_annotation.dart';

part 'mvrv_alert.freezed.dart';
part 'mvrv_alert.g.dart';

/// 알림 방향: 목표값 초과 / 미만
enum MvrvAlertDirection {
  /// MVRV가 목표값을 초과할 때
  above,

  /// MVRV가 목표값 미만일 때
  below,
}

/// 사용자 커스텀 MVRV 알림 설정
@freezed
abstract class MvrvAlert with _$MvrvAlert {
  const factory MvrvAlert({
    /// 고유 ID
    required String id,

    /// 목표 MVRV 값
    required double targetValue,

    /// 알림 방향 (초과/미만)
    required MvrvAlertDirection direction,

    /// 활성화 여부
    @Default(true) bool enabled,

    /// 생성 시각
    required DateTime createdAt,
  }) = _MvrvAlert;

  factory MvrvAlert.fromJson(Map<String, dynamic> json) =>
      _$MvrvAlertFromJson(json);
}
