// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nupl_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NuplData _$NuplDataFromJson(Map<String, dynamic> json) => _NuplData(
  date: DateTime.parse(json['date'] as String),
  nupl: (json['nupl'] as num).toDouble(),
);

Map<String, dynamic> _$NuplDataToJson(_NuplData instance) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'nupl': instance.nupl,
};
