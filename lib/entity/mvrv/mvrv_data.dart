import 'package:freezed_annotation/freezed_annotation.dart';

part 'mvrv_data.freezed.dart';
part 'mvrv_data.g.dart';

/// MVRV 차트 데이터 포인트
@freezed
abstract class MvrvData with _$MvrvData {
  const factory MvrvData({
    /// 날짜
    required DateTime date,

    /// BTC 가격 (USD)
    required double btcPrice,

    /// MVRV 비율
    required double mvrvRatio,
  }) = _MvrvData;

  factory MvrvData.fromJson(Map<String, dynamic> json) =>
      _$MvrvDataFromJson(json);
}
