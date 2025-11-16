
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:tradewatch/models/market_data_model.dart';

import 'market_socket_data_source.dart';

class MarketSocketDataSourceImpl implements MarketSocketDataSource {
  late final StreamController<List<MarketDataModel>> _controller;
  Timer? _timer;
  List<MarketDataModel> _marketData = [];

  MarketSocketDataSourceImpl() {
    _controller = StreamController<List<MarketDataModel>>.broadcast(
      onListen: _startStreaming,
      onCancel: _stopStreaming,
    );
  }

  Future<void> _loadInitialData() async {
    final String response =
        await rootBundle.loadString('assets/data/market_data.json');
    final data = await json.decode(response) as List;
    _marketData =
        data.map((item) => MarketDataModel.fromJson(item)).toList();
    _controller.add(_marketData);
  }

  void _startStreaming() {
    if (_timer != null) {
      return;
    }
    _loadInitialData().then((_) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        final random = Random();
        _marketData = _marketData.map((item) {
          final change = (random.nextDouble() * 2 - 1) * 0.01;
          final newPrice = item.price * (1 + change);
          final isPositive = newPrice >= item.price;
          final newSellPrice = item.sellPrice * (1 + (random.nextDouble() * 2 - 1) * 0.01);
          final newBuyPrice = item.buyPrice * (1 + (random.nextDouble() * 2 - 1) * 0.01);

          return item.copyWith(
            price: newPrice,
            ltp: newPrice,
            pl: newPrice - item.price,
            change: (newPrice - item.price) / item.price * 100,
            isPositiveChange: isPositive,
            sellPrice: newSellPrice,
            buyPrice: newBuyPrice,
          );
        }).toList();
        _controller.add(_marketData);
      });
    });
  }

  void _stopStreaming() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Stream<List<MarketDataModel>> getMarketDataStream() {
    return _controller.stream;
  }
}
