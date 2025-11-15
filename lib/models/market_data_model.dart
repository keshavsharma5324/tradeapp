import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_data_model.freezed.dart';

@freezed
abstract class MarketDataModel with _$MarketDataModel {
  const factory MarketDataModel({
    required String symbol,
    required double price,
    required double change,
    required bool isPositiveChange,
    required double ltp,
    required double pl,
  }) = _MarketDataModel;

  factory MarketDataModel.fromJson(Map<String, dynamic> json) {
    // Map the JSON fields to the model fields
    return _MarketDataModel(
      symbol: json['symbol'] as String,
      price: (json['buyPrice'] as num).toDouble(),
      change: (json['change'] as num).toDouble(),
      isPositiveChange: json['isUp'] as bool,
      ltp: (json['sellPrice'] as num).toDouble(),
      pl: (json['change'] as num).toDouble(),
    );
  }
}
