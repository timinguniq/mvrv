// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mvrv_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MvrvAlert _$MvrvAlertFromJson(Map<String, dynamic> json) => _MvrvAlert(
  id: json['id'] as String,
  targetValue: (json['targetValue'] as num).toDouble(),
  direction: $enumDecode(_$MvrvAlertDirectionEnumMap, json['direction']),
  enabled: json['enabled'] as bool? ?? true,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$MvrvAlertToJson(_MvrvAlert instance) =>
    <String, dynamic>{
      'id': instance.id,
      'targetValue': instance.targetValue,
      'direction': _$MvrvAlertDirectionEnumMap[instance.direction]!,
      'enabled': instance.enabled,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$MvrvAlertDirectionEnumMap = {
  MvrvAlertDirection.above: 'above',
  MvrvAlertDirection.below: 'below',
};
