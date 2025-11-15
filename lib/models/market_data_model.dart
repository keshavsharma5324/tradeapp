import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_data_model.freezed.dart';
part 'market_data_model.g.dart';

@freezed
abstract class MarketDataModel with _$MarketDataModel {
  @JsonSerializable(explicitToJson: true)
  const factory MarketDataModel({
    @JsonKey(name: 'symbol') required String symbol,
    @JsonKey(name: 'buyPrice') required double price,
    @JsonKey(name: 'change') required double change,
    @JsonKey(name: 'isUp') required bool isPositiveChange,
    @JsonKey(name: 'sellPrice') required double ltp,
    @JsonKey(name: 'pl') required double pl,
  }) = _MarketDataModel;

  factory MarketDataModel.fromJson(Map<String, dynamic> json) =>
      _$MarketDataModelFromJson(json);
}
