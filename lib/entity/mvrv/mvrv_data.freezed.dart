// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mvrv_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MvrvData {

/// 날짜
 DateTime get date;/// BTC 가격 (USD)
 double get btcPrice;/// MVRV 비율
 double get mvrvRatio;
/// Create a copy of MvrvData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MvrvDataCopyWith<MvrvData> get copyWith => _$MvrvDataCopyWithImpl<MvrvData>(this as MvrvData, _$identity);

  /// Serializes this MvrvData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MvrvData&&(identical(other.date, date) || other.date == date)&&(identical(other.btcPrice, btcPrice) || other.btcPrice == btcPrice)&&(identical(other.mvrvRatio, mvrvRatio) || other.mvrvRatio == mvrvRatio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,btcPrice,mvrvRatio);

@override
String toString() {
  return 'MvrvData(date: $date, btcPrice: $btcPrice, mvrvRatio: $mvrvRatio)';
}


}

/// @nodoc
abstract mixin class $MvrvDataCopyWith<$Res>  {
  factory $MvrvDataCopyWith(MvrvData value, $Res Function(MvrvData) _then) = _$MvrvDataCopyWithImpl;
@useResult
$Res call({
 DateTime date, double btcPrice, double mvrvRatio
});




}
/// @nodoc
class _$MvrvDataCopyWithImpl<$Res>
    implements $MvrvDataCopyWith<$Res> {
  _$MvrvDataCopyWithImpl(this._self, this._then);

  final MvrvData _self;
  final $Res Function(MvrvData) _then;

/// Create a copy of MvrvData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? btcPrice = null,Object? mvrvRatio = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,btcPrice: null == btcPrice ? _self.btcPrice : btcPrice // ignore: cast_nullable_to_non_nullable
as double,mvrvRatio: null == mvrvRatio ? _self.mvrvRatio : mvrvRatio // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MvrvData].
extension MvrvDataPatterns on MvrvData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MvrvData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MvrvData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MvrvData value)  $default,){
final _that = this;
switch (_that) {
case _MvrvData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MvrvData value)?  $default,){
final _that = this;
switch (_that) {
case _MvrvData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  double btcPrice,  double mvrvRatio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MvrvData() when $default != null:
return $default(_that.date,_that.btcPrice,_that.mvrvRatio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  double btcPrice,  double mvrvRatio)  $default,) {final _that = this;
switch (_that) {
case _MvrvData():
return $default(_that.date,_that.btcPrice,_that.mvrvRatio);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  double btcPrice,  double mvrvRatio)?  $default,) {final _that = this;
switch (_that) {
case _MvrvData() when $default != null:
return $default(_that.date,_that.btcPrice,_that.mvrvRatio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MvrvData implements MvrvData {
  const _MvrvData({required this.date, required this.btcPrice, required this.mvrvRatio});
  factory _MvrvData.fromJson(Map<String, dynamic> json) => _$MvrvDataFromJson(json);

/// 날짜
@override final  DateTime date;
/// BTC 가격 (USD)
@override final  double btcPrice;
/// MVRV 비율
@override final  double mvrvRatio;

/// Create a copy of MvrvData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MvrvDataCopyWith<_MvrvData> get copyWith => __$MvrvDataCopyWithImpl<_MvrvData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MvrvDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MvrvData&&(identical(other.date, date) || other.date == date)&&(identical(other.btcPrice, btcPrice) || other.btcPrice == btcPrice)&&(identical(other.mvrvRatio, mvrvRatio) || other.mvrvRatio == mvrvRatio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,btcPrice,mvrvRatio);

@override
String toString() {
  return 'MvrvData(date: $date, btcPrice: $btcPrice, mvrvRatio: $mvrvRatio)';
}


}

/// @nodoc
abstract mixin class _$MvrvDataCopyWith<$Res> implements $MvrvDataCopyWith<$Res> {
  factory _$MvrvDataCopyWith(_MvrvData value, $Res Function(_MvrvData) _then) = __$MvrvDataCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, double btcPrice, double mvrvRatio
});




}
/// @nodoc
class __$MvrvDataCopyWithImpl<$Res>
    implements _$MvrvDataCopyWith<$Res> {
  __$MvrvDataCopyWithImpl(this._self, this._then);

  final _MvrvData _self;
  final $Res Function(_MvrvData) _then;

/// Create a copy of MvrvData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? btcPrice = null,Object? mvrvRatio = null,}) {
  return _then(_MvrvData(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,btcPrice: null == btcPrice ? _self.btcPrice : btcPrice // ignore: cast_nullable_to_non_nullable
as double,mvrvRatio: null == mvrvRatio ? _self.mvrvRatio : mvrvRatio // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
