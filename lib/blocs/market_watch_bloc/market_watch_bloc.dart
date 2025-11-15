import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tradewatch/domain/usecases/get_market_data_socket.dart';
import 'package:tradewatch/domain/usecases/get_market_data_stream.dart';
import 'package:tradewatch/models/market_data_model.dart';

part 'market_watch_event.dart';
part 'market_watch_state.dart';
part 'market_watch_bloc.freezed.dart';

class MarketWatchBloc extends Bloc<MarketWatchEvent, MarketWatchState> {
  final GetMarketDataStream _getMarketDataStream;
  final GetMarketDataSocket _getMarketDataSocket;
  StreamSubscription? _marketDataSubscription;

  MarketWatchBloc({
    required GetMarketDataStream getMarketDataStream,
    required GetMarketDataSocket getMarketDataSocket,
  })  : _getMarketDataStream = getMarketDataStream,
        _getMarketDataSocket = getMarketDataSocket,
        super(const MarketWatchState.initial()) {
    on<_LoadMarketData>(_onLoadMarketData);
    on<_UpdateMarketData>(((event, emit) {
      emit(MarketWatchState.loaded(event.marketData));
    }));
  }

  void _onLoadMarketData(
    _LoadMarketData event,
    Emitter<MarketWatchState> emit,
  ) {
    emit(const MarketWatchState.loading());
    _marketDataSubscription?.cancel();
    _marketDataSubscription = _getMarketDataStream.buildUseCaseStream().listen(
      (marketData) {
        add(MarketWatchEvent.updateMarketData(marketData));
      },
      onError: (error) {
        emit(MarketWatchState.error(error.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    _marketDataSubscription?.cancel();
    return super.close();
  }
}
