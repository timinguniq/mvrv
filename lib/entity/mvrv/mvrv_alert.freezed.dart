// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mvrv_alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MvrvAlert {

/// 고유 ID
 String get id;/// 목표 MVRV 값
 double get targetValue;/// 알림 방향 (초과/미만)
 MvrvAlertDirection get direction;/// 활성화 여부
 bool get enabled;/// 생성 시각
 DateTime get createdAt;
/// Create a copy of MvrvAlert
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MvrvAlertCopyWith<MvrvAlert> get copyWith => _$MvrvAlertCopyWithImpl<MvrvAlert>(this as MvrvAlert, _$identity);

  /// Serializes this MvrvAlert to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MvrvAlert&&(identical(other.id, id) || other.id == id)&&(identical(other.targetValue, targetValue) || other.targetValue == targetValue)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,targetValue,direction,enabled,createdAt);

@override
String toString() {
  return 'MvrvAlert(id: $id, targetValue: $targetValue, direction: $direction, enabled: $enabled, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MvrvAlertCopyWith<$Res>  {
  factory $MvrvAlertCopyWith(MvrvAlert value, $Res Function(MvrvAlert) _then) = _$MvrvAlertCopyWithImpl;
@useResult
$Res call({
 String id, double targetValue, MvrvAlertDirection direction, bool enabled, DateTime createdAt
});




}
/// @nodoc
class _$MvrvAlertCopyWithImpl<$Res>
    implements $MvrvAlertCopyWith<$Res> {
  _$MvrvAlertCopyWithImpl(this._self, this._then);

  final MvrvAlert _self;
  final $Res Function(MvrvAlert) _then;

/// Create a copy of MvrvAlert
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? targetValue = null,Object? direction = null,Object? enabled = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,targetValue: null == targetValue ? _self.targetValue : targetValue // ignore: cast_nullable_to_non_nullable
as double,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as MvrvAlertDirection,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MvrvAlert].
extension MvrvAlertPatterns on MvrvAlert {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MvrvAlert value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MvrvAlert() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MvrvAlert value)  $default,){
final _that = this;
switch (_that) {
case _MvrvAlert():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MvrvAlert value)?  $default,){
final _that = this;
switch (_that) {
case _MvrvAlert() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double targetValue,  MvrvAlertDirection direction,  bool enabled,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MvrvAlert() when $default != null:
return $default(_that.id,_that.targetValue,_that.direction,_that.enabled,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double targetValue,  MvrvAlertDirection direction,  bool enabled,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _MvrvAlert():
return $default(_that.id,_that.targetValue,_that.direction,_that.enabled,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double targetValue,  MvrvAlertDirection direction,  bool enabled,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MvrvAlert() when $default != null:
return $default(_that.id,_that.targetValue,_that.direction,_that.enabled,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MvrvAlert implements MvrvAlert {
  const _MvrvAlert({required this.id, required this.targetValue, required this.direction, this.enabled = true, required this.createdAt});
  factory _MvrvAlert.fromJson(Map<String, dynamic> json) => _$MvrvAlertFromJson(json);

/// 고유 ID
@override final  String id;
/// 목표 MVRV 값
@override final  double targetValue;
/// 알림 방향 (초과/미만)
@override final  MvrvAlertDirection direction;
/// 활성화 여부
@override@JsonKey() final  bool enabled;
/// 생성 시각
@override final  DateTime createdAt;

/// Create a copy of MvrvAlert
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MvrvAlertCopyWith<_MvrvAlert> get copyWith => __$MvrvAlertCopyWithImpl<_MvrvAlert>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MvrvAlertToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MvrvAlert&&(identical(other.id, id) || other.id == id)&&(identical(other.targetValue, targetValue) || other.targetValue == targetValue)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,targetValue,direction,enabled,createdAt);

@override
String toString() {
  return 'MvrvAlert(id: $id, targetValue: $targetValue, direction: $direction, enabled: $enabled, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MvrvAlertCopyWith<$Res> implements $MvrvAlertCopyWith<$Res> {
  factory _$MvrvAlertCopyWith(_MvrvAlert value, $Res Function(_MvrvAlert) _then) = __$MvrvAlertCopyWithImpl;
@override @useResult
$Res call({
 String id, double targetValue, MvrvAlertDirection direction, bool enabled, DateTime createdAt
});




}
/// @nodoc
class __$MvrvAlertCopyWithImpl<$Res>
    implements _$MvrvAlertCopyWith<$Res> {
  __$MvrvAlertCopyWithImpl(this._self, this._then);

  final _MvrvAlert _self;
  final $Res Function(_MvrvAlert) _then;

/// Create a copy of MvrvAlert
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? targetValue = null,Object? direction = null,Object? enabled = null,Object? createdAt = null,}) {
  return _then(_MvrvAlert(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,targetValue: null == targetValue ? _self.targetValue : targetValue // ignore: cast_nullable_to_non_nullable
as double,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as MvrvAlertDirection,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
