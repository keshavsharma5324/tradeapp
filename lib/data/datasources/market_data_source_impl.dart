import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:tradewatch/data/datasources/market_data_source.dart';
import 'package:tradewatch/models/market_data_model.dart';


class MarketDataSourceImpl implements MarketDataSource {
  final _random = Random();
  Timer? _timer;
  List<MarketDataModel> _marketData = [];

  @override
  Stream<List<MarketDataModel>> getMarketData() {
    final controller = StreamController<List<MarketDataModel>>();

    _loadInitialData().then((_) {
      if (controller.isClosed) return;
      controller.add(_marketData);

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _updatePrices();
        if (controller.isClosed) {
          timer.cancel();
        } else {
          controller.add(_marketData);
        }
      });
    });

    controller.onCancel = () {
      _timer?.cancel();
      controller.close();
    };

    return controller.stream;
  }

  Future<void> _loadInitialData() async {
    final jsonString = await rootBundle.loadString('assets/data/market_data.json');
    final jsonList = json.decode(jsonString) as List;
    _marketData = jsonList.map((json) => MarketDataModel.fromJson(json)).toList();
  }

  void _updatePrices() {
    _marketData = _marketData.map((data) {
      final random = Random();
      final change = (_random.nextDouble() * 2 - 1) / 10; // smaller change
      final newPrice = data.price * (1 + change);
      final newSellPrice = data.sellPrice * (1 + (random.nextDouble() * 2 - 1) * 0.01);
      final newBuyPrice = data.buyPrice * (1 + (random.nextDouble() * 2 - 1) * 0.01);
      return data.copyWith(
          price: newPrice,
          change: change * 100,
          isPositiveChange: change >= 0,
          sellPrice: newSellPrice,
          buyPrice: newBuyPrice
      );
    }).toList();
  }
}


/*class MarketDataSourceImpl implements MarketDataSource {
  final Random _random = Random();

  @override
  Stream<List<MarketDataModel>> getMarketData() {
    return Stream.periodic(const Duration(seconds: 1), (_) {
      return List.generate(10, (index) => _generateRandomMarketData(index));
    });
  }

  MarketDataModel _generateRandomMarketData(int index) {
    final symbol = 'STOCK$index';
    final price = _random.nextDouble() * 1000;
    final change = (_random.nextDouble() * 100) - 50;
    final isPositive = change >= 0;

    return MarketDataModel(
      symbol: symbol,
      price: price,
      ltp: price,
      pl: change,
      change: change,
      isPositiveChange: isPositive,
    );
  }
}*/
