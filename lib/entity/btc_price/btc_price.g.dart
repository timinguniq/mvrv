// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'btc_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BtcPrice _$BtcPriceFromJson(Map<String, dynamic> json) => _BtcPrice(
  price: (json['price'] as num).toDouble(),
  changePercent24h: (json['changePercent24h'] as num).toDouble(),
);

Map<String, dynamic> _$BtcPriceToJson(_BtcPrice instance) => <String, dynamic>{
  'price': instance.price,
  'changePercent24h': instance.changePercent24h,
};
