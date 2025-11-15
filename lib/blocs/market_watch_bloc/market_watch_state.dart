
part of 'market_watch_bloc.dart';

@freezed
class MarketWatchState with _$MarketWatchState {
  const factory MarketWatchState.initial() = _Initial;
  const factory MarketWatchState.loading() = _Loading;
  const factory MarketWatchState.loaded(List<MarketDataModel> marketData) = _Loaded;
  const factory MarketWatchState.error(String message) = _Error;
}
