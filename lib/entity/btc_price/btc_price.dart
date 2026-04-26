import 'package:freezed_annotation/freezed_annotation.dart';

part 'btc_price.freezed.dart';
part 'btc_price.g.dart';

/// 비트코인 현재가 (USD)
@freezed
abstract class BtcPrice with _$BtcPrice {
  const factory BtcPrice({
    /// USD 기준 현재가
    required double price,

    /// 24시간 가격 변동률 (%)
    required double changePercent24h,
  }) = _BtcPrice;

  factory BtcPrice.fromJson(Map<String, dynamic> json) =>
      _$BtcPriceFromJson(json);
}
