import 'package:tradewatch/models/market_data_model.dart';

abstract class MarketDataRepository {
  Stream<List<MarketDataModel>> getMarketData();
}
