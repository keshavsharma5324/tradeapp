import 'package:tradewatch/models/market_data_model.dart';

abstract class MarketSocketRepository {
  Stream<List<MarketDataModel>> getMarketDataStream();
}
