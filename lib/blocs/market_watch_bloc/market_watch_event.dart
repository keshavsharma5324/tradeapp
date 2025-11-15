part of 'market_watch_bloc.dart';

@freezed
class MarketWatchEvent with _$MarketWatchEvent {
  const factory MarketWatchEvent.loadMarketData() = _LoadMarketData;
  const factory MarketWatchEvent.updateMarketData(
      List<MarketDataModel> marketData) = _UpdateMarketData;
}
