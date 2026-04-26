// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'btc_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BtcPrice {

/// USD 기준 현재가
 double get price;/// 24시간 가격 변동률 (%)
 double get changePercent24h;
/// Create a copy of BtcPrice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BtcPriceCopyWith<BtcPrice> get copyWith => _$BtcPriceCopyWithImpl<BtcPrice>(this as BtcPrice, _$identity);

  /// Serializes this BtcPrice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BtcPrice&&(identical(other.price, price) || other.price == price)&&(identical(other.changePercent24h, changePercent24h) || other.changePercent24h == changePercent24h));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,changePercent24h);

@override
String toString() {
  return 'BtcPrice(price: $price, changePercent24h: $changePercent24h)';
}


}

/// @nodoc
abstract mixin class $BtcPriceCopyWith<$Res>  {
  factory $BtcPriceCopyWith(BtcPrice value, $Res Function(BtcPrice) _then) = _$BtcPriceCopyWithImpl;
@useResult
$Res call({
 double price, double changePercent24h
});




}
/// @nodoc
class _$BtcPriceCopyWithImpl<$Res>
    implements $BtcPriceCopyWith<$Res> {
  _$BtcPriceCopyWithImpl(this._self, this._then);

  final BtcPrice _self;
  final $Res Function(BtcPrice) _then;

/// Create a copy of BtcPrice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? price = null,Object? changePercent24h = null,}) {
  return _then(_self.copyWith(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,changePercent24h: null == changePercent24h ? _self.changePercent24h : changePercent24h // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BtcPrice].
extension BtcPricePatterns on BtcPrice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BtcPrice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BtcPrice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BtcPrice value)  $default,){
final _that = this;
switch (_that) {
case _BtcPrice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BtcPrice value)?  $default,){
final _that = this;
switch (_that) {
case _BtcPrice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double price,  double changePercent24h)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BtcPrice() when $default != null:
return $default(_that.price,_that.changePercent24h);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double price,  double changePercent24h)  $default,) {final _that = this;
switch (_that) {
case _BtcPrice():
return $default(_that.price,_that.changePercent24h);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double price,  double changePercent24h)?  $default,) {final _that = this;
switch (_that) {
case _BtcPrice() when $default != null:
return $default(_that.price,_that.changePercent24h);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BtcPrice implements BtcPrice {
  const _BtcPrice({required this.price, required this.changePercent24h});
  factory _BtcPrice.fromJson(Map<String, dynamic> json) => _$BtcPriceFromJson(json);

/// USD 기준 현재가
@override final  double price;
/// 24시간 가격 변동률 (%)
@override final  double changePercent24h;

/// Create a copy of BtcPrice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BtcPriceCopyWith<_BtcPrice> get copyWith => __$BtcPriceCopyWithImpl<_BtcPrice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BtcPriceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BtcPrice&&(identical(other.price, price) || other.price == price)&&(identical(other.changePercent24h, changePercent24h) || other.changePercent24h == changePercent24h));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,changePercent24h);

@override
String toString() {
  return 'BtcPrice(price: $price, changePercent24h: $changePercent24h)';
}


}

/// @nodoc
abstract mixin class _$BtcPriceCopyWith<$Res> implements $BtcPriceCopyWith<$Res> {
  factory _$BtcPriceCopyWith(_BtcPrice value, $Res Function(_BtcPrice) _then) = __$BtcPriceCopyWithImpl;
@override @useResult
$Res call({
 double price, double changePercent24h
});




}
/// @nodoc
class __$BtcPriceCopyWithImpl<$Res>
    implements _$BtcPriceCopyWith<$Res> {
  __$BtcPriceCopyWithImpl(this._self, this._then);

  final _BtcPrice _self;
  final $Res Function(_BtcPrice) _then;

/// Create a copy of BtcPrice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? price = null,Object? changePercent24h = null,}) {
  return _then(_BtcPrice(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,changePercent24h: null == changePercent24h ? _self.changePercent24h : changePercent24h // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
