import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tradewatch/models/market_data_model.dart';

class MarketDataSource {
  Future<List<MarketDataModel>> getMarketData() async {
    final response = await rootBundle.loadString('assets/data/market_data.json');
    final data = json.decode(response) as List;
    return data.map((item) => MarketDataModel.fromJson(item)).toList();
  }
}
