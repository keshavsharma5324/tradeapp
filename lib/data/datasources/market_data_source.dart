import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:tradewatch/models/market_data_model.dart';

abstract class MarketDataSource {
  Stream<List<MarketDataModel>> getMarketData();
}
