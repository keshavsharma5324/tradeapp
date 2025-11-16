// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_watch_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MarketWatchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketWatchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MarketWatchEvent()';
}


}

/// @nodoc
class $MarketWatchEventCopyWith<$Res>  {
$MarketWatchEventCopyWith(MarketWatchEvent _, $Res Function(MarketWatchEvent) __);
}


/// Adds pattern-matching-related methods to [MarketWatchEvent].
extension MarketWatchEventPatterns on MarketWatchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadMarketData value)?  loadMarketData,TResult Function( _UpdateMarketData value)?  updateMarketData,TResult Function( _ShuffleMarketData value)?  shuffleMarketData,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadMarketData() when loadMarketData != null:
return loadMarketData(_that);case _UpdateMarketData() when updateMarketData != null:
return updateMarketData(_that);case _ShuffleMarketData() when shuffleMarketData != null:
return shuffleMarketData(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadMarketData value)  loadMarketData,required TResult Function( _UpdateMarketData value)  updateMarketData,required TResult Function( _ShuffleMarketData value)  shuffleMarketData,}){
final _that = this;
switch (_that) {
case _LoadMarketData():
return loadMarketData(_that);case _UpdateMarketData():
return updateMarketData(_that);case _ShuffleMarketData():
return shuffleMarketData(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadMarketData value)?  loadMarketData,TResult? Function( _UpdateMarketData value)?  updateMarketData,TResult? Function( _ShuffleMarketData value)?  shuffleMarketData,}){
final _that = this;
switch (_that) {
case _LoadMarketData() when loadMarketData != null:
return loadMarketData(_that);case _UpdateMarketData() when updateMarketData != null:
return updateMarketData(_that);case _ShuffleMarketData() when shuffleMarketData != null:
return shuffleMarketData(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadMarketData,TResult Function( List<MarketDataModel> marketData)?  updateMarketData,TResult Function()?  shuffleMarketData,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadMarketData() when loadMarketData != null:
return loadMarketData();case _UpdateMarketData() when updateMarketData != null:
return updateMarketData(_that.marketData);case _ShuffleMarketData() when shuffleMarketData != null:
return shuffleMarketData();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadMarketData,required TResult Function( List<MarketDataModel> marketData)  updateMarketData,required TResult Function()  shuffleMarketData,}) {final _that = this;
switch (_that) {
case _LoadMarketData():
return loadMarketData();case _UpdateMarketData():
return updateMarketData(_that.marketData);case _ShuffleMarketData():
return shuffleMarketData();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadMarketData,TResult? Function( List<MarketDataModel> marketData)?  updateMarketData,TResult? Function()?  shuffleMarketData,}) {final _that = this;
switch (_that) {
case _LoadMarketData() when loadMarketData != null:
return loadMarketData();case _UpdateMarketData() when updateMarketData != null:
return updateMarketData(_that.marketData);case _ShuffleMarketData() when shuffleMarketData != null:
return shuffleMarketData();case _:
  return null;

}
}

}

/// @nodoc


class _LoadMarketData implements MarketWatchEvent {
  const _LoadMarketData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadMarketData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MarketWatchEvent.loadMarketData()';
}


}




/// @nodoc


class _UpdateMarketData implements MarketWatchEvent {
  const _UpdateMarketData(final  List<MarketDataModel> marketData): _marketData = marketData;
  

 final  List<MarketDataModel> _marketData;
 List<MarketDataModel> get marketData {
  if (_marketData is EqualUnmodifiableListView) return _marketData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_marketData);
}


/// Create a copy of MarketWatchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateMarketDataCopyWith<_UpdateMarketData> get copyWith => __$UpdateMarketDataCopyWithImpl<_UpdateMarketData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateMarketData&&const DeepCollectionEquality().equals(other._marketData, _marketData));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_marketData));

@override
String toString() {
  return 'MarketWatchEvent.updateMarketData(marketData: $marketData)';
}


}

/// @nodoc
abstract mixin class _$UpdateMarketDataCopyWith<$Res> implements $MarketWatchEventCopyWith<$Res> {
  factory _$UpdateMarketDataCopyWith(_UpdateMarketData value, $Res Function(_UpdateMarketData) _then) = __$UpdateMarketDataCopyWithImpl;
@useResult
$Res call({
 List<MarketDataModel> marketData
});




}
/// @nodoc
class __$UpdateMarketDataCopyWithImpl<$Res>
    implements _$UpdateMarketDataCopyWith<$Res> {
  __$UpdateMarketDataCopyWithImpl(this._self, this._then);

  final _UpdateMarketData _self;
  final $Res Function(_UpdateMarketData) _then;

/// Create a copy of MarketWatchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? marketData = null,}) {
  return _then(_UpdateMarketData(
null == marketData ? _self._marketData : marketData // ignore: cast_nullable_to_non_nullable
as List<MarketDataModel>,
  ));
}


}

/// @nodoc


class _ShuffleMarketData implements MarketWatchEvent {
  const _ShuffleMarketData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShuffleMarketData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MarketWatchEvent.shuffleMarketData()';
}


}




/// @nodoc
mixin _$MarketWatchState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketWatchState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MarketWatchState()';
}


}

/// @nodoc
class $MarketWatchStateCopyWith<$Res>  {
$MarketWatchStateCopyWith(MarketWatchState _, $Res Function(MarketWatchState) __);
}


/// Adds pattern-matching-related methods to [MarketWatchState].
extension MarketWatchStatePatterns on MarketWatchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<MarketDataModel> marketData)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.marketData);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<MarketDataModel> marketData)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.marketData);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<MarketDataModel> marketData)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.marketData);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements MarketWatchState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MarketWatchState.initial()';
}


}




/// @nodoc


class _Loading implements MarketWatchState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MarketWatchState.loading()';
}


}




/// @nodoc


class _Loaded implements MarketWatchState {
  const _Loaded(final  List<MarketDataModel> marketData): _marketData = marketData;
  

 final  List<MarketDataModel> _marketData;
 List<MarketDataModel> get marketData {
  if (_marketData is EqualUnmodifiableListView) return _marketData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_marketData);
}


/// Create a copy of MarketWatchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._marketData, _marketData));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_marketData));

@override
String toString() {
  return 'MarketWatchState.loaded(marketData: $marketData)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $MarketWatchStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<MarketDataModel> marketData
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of MarketWatchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? marketData = null,}) {
  return _then(_Loaded(
null == marketData ? _self._marketData : marketData // ignore: cast_nullable_to_non_nullable
as List<MarketDataModel>,
  ));
}


}

/// @nodoc


class _Error implements MarketWatchState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of MarketWatchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MarketWatchState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $MarketWatchStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of MarketWatchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
