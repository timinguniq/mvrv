// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mvrv_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MvrvData _$MvrvDataFromJson(Map<String, dynamic> json) => _MvrvData(
  date: DateTime.parse(json['date'] as String),
  btcPrice: (json['btcPrice'] as num).toDouble(),
  mvrvRatio: (json['mvrvRatio'] as num).toDouble(),
);

Map<String, dynamic> _$MvrvDataToJson(_MvrvData instance) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'btcPrice': instance.btcPrice,
  'mvrvRatio': instance.mvrvRatio,
};
