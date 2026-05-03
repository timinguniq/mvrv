import 'package:freezed_annotation/freezed_annotation.dart';

part 'mvrv_data.freezed.dart';
part 'mvrv_data.g.dart';

/// MVRV Z-Score 데이터 포인트
@freezed
abstract class MvrvData with _$MvrvData {
  const factory MvrvData({
    /// 데이터 기준일
    required DateTime date,

    /// MVRV Z-Score 값
    required double mvrvZscore,
  }) = _MvrvData;

  factory MvrvData.fromJson(Map<String, dynamic> json) =>
      _$MvrvDataFromJson(json);
}
