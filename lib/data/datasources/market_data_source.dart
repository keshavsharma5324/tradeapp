import 'dart:async';

import 'package:tradewatch/models/market_data_model.dart';

abstract class MarketDataSource {
  Stream<List<MarketDataModel>> getMarketData();
}
