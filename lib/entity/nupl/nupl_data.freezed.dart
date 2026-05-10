// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nupl_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NuplData {

/// 데이터 기준일
 DateTime get date;/// NUPL 값 (일반적으로 -0.25 ~ 0.75 범위)
 double get nupl;
/// Create a copy of NuplData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NuplDataCopyWith<NuplData> get copyWith => _$NuplDataCopyWithImpl<NuplData>(this as NuplData, _$identity);

  /// Serializes this NuplData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NuplData&&(identical(other.date, date) || other.date == date)&&(identical(other.nupl, nupl) || other.nupl == nupl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,nupl);

@override
String toString() {
  return 'NuplData(date: $date, nupl: $nupl)';
}


}

/// @nodoc
abstract mixin class $NuplDataCopyWith<$Res>  {
  factory $NuplDataCopyWith(NuplData value, $Res Function(NuplData) _then) = _$NuplDataCopyWithImpl;
@useResult
$Res call({
 DateTime date, double nupl
});




}
/// @nodoc
class _$NuplDataCopyWithImpl<$Res>
    implements $NuplDataCopyWith<$Res> {
  _$NuplDataCopyWithImpl(this._self, this._then);

  final NuplData _self;
  final $Res Function(NuplData) _then;

/// Create a copy of NuplData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? nupl = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,nupl: null == nupl ? _self.nupl : nupl // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [NuplData].
extension NuplDataPatterns on NuplData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NuplData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NuplData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NuplData value)  $default,){
final _that = this;
switch (_that) {
case _NuplData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NuplData value)?  $default,){
final _that = this;
switch (_that) {
case _NuplData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  double nupl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NuplData() when $default != null:
return $default(_that.date,_that.nupl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  double nupl)  $default,) {final _that = this;
switch (_that) {
case _NuplData():
return $default(_that.date,_that.nupl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  double nupl)?  $default,) {final _that = this;
switch (_that) {
case _NuplData() when $default != null:
return $default(_that.date,_that.nupl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NuplData implements NuplData {
  const _NuplData({required this.date, required this.nupl});
  factory _NuplData.fromJson(Map<String, dynamic> json) => _$NuplDataFromJson(json);

/// 데이터 기준일
@override final  DateTime date;
/// NUPL 값 (일반적으로 -0.25 ~ 0.75 범위)
@override final  double nupl;

/// Create a copy of NuplData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NuplDataCopyWith<_NuplData> get copyWith => __$NuplDataCopyWithImpl<_NuplData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NuplDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NuplData&&(identical(other.date, date) || other.date == date)&&(identical(other.nupl, nupl) || other.nupl == nupl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,nupl);

@override
String toString() {
  return 'NuplData(date: $date, nupl: $nupl)';
}


}

/// @nodoc
abstract mixin class _$NuplDataCopyWith<$Res> implements $NuplDataCopyWith<$Res> {
  factory _$NuplDataCopyWith(_NuplData value, $Res Function(_NuplData) _then) = __$NuplDataCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, double nupl
});




}
/// @nodoc
class __$NuplDataCopyWithImpl<$Res>
    implements _$NuplDataCopyWith<$Res> {
  __$NuplDataCopyWithImpl(this._self, this._then);

  final _NuplData _self;
  final $Res Function(_NuplData) _then;

/// Create a copy of NuplData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? nupl = null,}) {
  return _then(_NuplData(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,nupl: null == nupl ? _self.nupl : nupl // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
