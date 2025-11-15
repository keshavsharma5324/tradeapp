import 'package:tradewatch/models/market_data_model.dart';

abstract class MarketSocketDataSource {
  Stream<List<MarketDataModel>> getMarketDataStream();
}
