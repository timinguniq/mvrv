import 'package:freezed_annotation/freezed_annotation.dart';

part 'nupl_data.freezed.dart';
part 'nupl_data.g.dart';

/// NUPL (Net Unrealized Profit/Loss) 데이터 포인트
@freezed
abstract class NuplData with _$NuplData {
  const factory NuplData({
    /// 데이터 기준일
    required DateTime date,

    /// NUPL 값 (일반적으로 -0.25 ~ 0.75 범위)
    required double nupl,
  }) = _NuplData;

  factory NuplData.fromJson(Map<String, dynamic> json) =>
      _$NuplDataFromJson(json);
}
