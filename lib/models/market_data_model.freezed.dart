// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MarketDataModel {

 String get symbol; double get price; double get change; bool get isPositiveChange; double get ltp; double get pl; double get buyPrice; double get sellPrice;
/// Create a copy of MarketDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketDataModelCopyWith<MarketDataModel> get copyWith => _$MarketDataModelCopyWithImpl<MarketDataModel>(this as MarketDataModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketDataModel&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.price, price) || other.price == price)&&(identical(other.change, change) || other.change == change)&&(identical(other.isPositiveChange, isPositiveChange) || other.isPositiveChange == isPositiveChange)&&(identical(other.ltp, ltp) || other.ltp == ltp)&&(identical(other.pl, pl) || other.pl == pl)&&(identical(other.buyPrice, buyPrice) || other.buyPrice == buyPrice)&&(identical(other.sellPrice, sellPrice) || other.sellPrice == sellPrice));
}


@override
int get hashCode => Object.hash(runtimeType,symbol,price,change,isPositiveChange,ltp,pl,buyPrice,sellPrice);

@override
String toString() {
  return 'MarketDataModel(symbol: $symbol, price: $price, change: $change, isPositiveChange: $isPositiveChange, ltp: $ltp, pl: $pl, buyPrice: $buyPrice, sellPrice: $sellPrice)';
}


}

/// @nodoc
abstract mixin class $MarketDataModelCopyWith<$Res>  {
  factory $MarketDataModelCopyWith(MarketDataModel value, $Res Function(MarketDataModel) _then) = _$MarketDataModelCopyWithImpl;
@useResult
$Res call({
 String symbol, double price, double change, bool isPositiveChange, double ltp, double pl, double buyPrice, double sellPrice
});




}
/// @nodoc
class _$MarketDataModelCopyWithImpl<$Res>
    implements $MarketDataModelCopyWith<$Res> {
  _$MarketDataModelCopyWithImpl(this._self, this._then);

  final MarketDataModel _self;
  final $Res Function(MarketDataModel) _then;

/// Create a copy of MarketDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? price = null,Object? change = null,Object? isPositiveChange = null,Object? ltp = null,Object? pl = null,Object? buyPrice = null,Object? sellPrice = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as double,isPositiveChange: null == isPositiveChange ? _self.isPositiveChange : isPositiveChange // ignore: cast_nullable_to_non_nullable
as bool,ltp: null == ltp ? _self.ltp : ltp // ignore: cast_nullable_to_non_nullable
as double,pl: null == pl ? _self.pl : pl // ignore: cast_nullable_to_non_nullable
as double,buyPrice: null == buyPrice ? _self.buyPrice : buyPrice // ignore: cast_nullable_to_non_nullable
as double,sellPrice: null == sellPrice ? _self.sellPrice : sellPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketDataModel].
extension MarketDataModelPatterns on MarketDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketDataModel value)  $default,){
final _that = this;
switch (_that) {
case _MarketDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _MarketDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  double price,  double change,  bool isPositiveChange,  double ltp,  double pl,  double buyPrice,  double sellPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketDataModel() when $default != null:
return $default(_that.symbol,_that.price,_that.change,_that.isPositiveChange,_that.ltp,_that.pl,_that.buyPrice,_that.sellPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  double price,  double change,  bool isPositiveChange,  double ltp,  double pl,  double buyPrice,  double sellPrice)  $default,) {final _that = this;
switch (_that) {
case _MarketDataModel():
return $default(_that.symbol,_that.price,_that.change,_that.isPositiveChange,_that.ltp,_that.pl,_that.buyPrice,_that.sellPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  double price,  double change,  bool isPositiveChange,  double ltp,  double pl,  double buyPrice,  double sellPrice)?  $default,) {final _that = this;
switch (_that) {
case _MarketDataModel() when $default != null:
return $default(_that.symbol,_that.price,_that.change,_that.isPositiveChange,_that.ltp,_that.pl,_that.buyPrice,_that.sellPrice);case _:
  return null;

}
}

}

/// @nodoc


class _MarketDataModel implements MarketDataModel {
  const _MarketDataModel({required this.symbol, required this.price, required this.change, required this.isPositiveChange, required this.ltp, required this.pl, required this.buyPrice, required this.sellPrice});
  

@override final  String symbol;
@override final  double price;
@override final  double change;
@override final  bool isPositiveChange;
@override final  double ltp;
@override final  double pl;
@override final  double buyPrice;
@override final  double sellPrice;

/// Create a copy of MarketDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketDataModelCopyWith<_MarketDataModel> get copyWith => __$MarketDataModelCopyWithImpl<_MarketDataModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketDataModel&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.price, price) || other.price == price)&&(identical(other.change, change) || other.change == change)&&(identical(other.isPositiveChange, isPositiveChange) || other.isPositiveChange == isPositiveChange)&&(identical(other.ltp, ltp) || other.ltp == ltp)&&(identical(other.pl, pl) || other.pl == pl)&&(identical(other.buyPrice, buyPrice) || other.buyPrice == buyPrice)&&(identical(other.sellPrice, sellPrice) || other.sellPrice == sellPrice));
}


@override
int get hashCode => Object.hash(runtimeType,symbol,price,change,isPositiveChange,ltp,pl,buyPrice,sellPrice);

@override
String toString() {
  return 'MarketDataModel(symbol: $symbol, price: $price, change: $change, isPositiveChange: $isPositiveChange, ltp: $ltp, pl: $pl, buyPrice: $buyPrice, sellPrice: $sellPrice)';
}


}

/// @nodoc
abstract mixin class _$MarketDataModelCopyWith<$Res> implements $MarketDataModelCopyWith<$Res> {
  factory _$MarketDataModelCopyWith(_MarketDataModel value, $Res Function(_MarketDataModel) _then) = __$MarketDataModelCopyWithImpl;
@override @useResult
$Res call({
 String symbol, double price, double change, bool isPositiveChange, double ltp, double pl, double buyPrice, double sellPrice
});




}
/// @nodoc
class __$MarketDataModelCopyWithImpl<$Res>
    implements _$MarketDataModelCopyWith<$Res> {
  __$MarketDataModelCopyWithImpl(this._self, this._then);

  final _MarketDataModel _self;
  final $Res Function(_MarketDataModel) _then;

/// Create a copy of MarketDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? price = null,Object? change = null,Object? isPositiveChange = null,Object? ltp = null,Object? pl = null,Object? buyPrice = null,Object? sellPrice = null,}) {
  return _then(_MarketDataModel(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as double,isPositiveChange: null == isPositiveChange ? _self.isPositiveChange : isPositiveChange // ignore: cast_nullable_to_non_nullable
as bool,ltp: null == ltp ? _self.ltp : ltp // ignore: cast_nullable_to_non_nullable
as double,pl: null == pl ? _self.pl : pl // ignore: cast_nullable_to_non_nullable
as double,buyPrice: null == buyPrice ? _self.buyPrice : buyPrice // ignore: cast_nullable_to_non_nullable
as double,sellPrice: null == sellPrice ? _self.sellPrice : sellPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
