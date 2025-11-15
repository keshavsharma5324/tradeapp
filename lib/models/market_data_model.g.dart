// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarketDataModel _$MarketDataModelFromJson(Map<String, dynamic> json) =>
    _MarketDataModel(
      symbol: json['symbol'] as String,
      price: (json['buyPrice'] as num).toDouble(),
      change: (json['change'] as num).toDouble(),
      isPositiveChange: json['isUp'] as bool,
      ltp: (json['sellPrice'] as num).toDouble(),
      pl: (json['change'] as num).toDouble(),
    );

Map<String, dynamic> _$MarketDataModelToJson(_MarketDataModel instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'buyPrice': instance.price,
      'change': instance.change,
      'isUp': instance.isPositiveChange,
      'sellPrice': instance.ltp,
      'pl': instance.pl,
    };
