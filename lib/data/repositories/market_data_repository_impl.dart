import 'package:tradewatch/data/datasources/market_data_source.dart';
import 'package:tradewatch/domain/repositories/market_data_repository.dart';
import 'package:tradewatch/models/market_data_model.dart';

class MarketDataRepositoryImpl implements MarketDataRepository {
  final MarketDataSource _dataSource;

  MarketDataRepositoryImpl(this._dataSource);

  @override
  Stream<List<MarketDataModel>> getMarketData() {
    return _dataSource.getMarketData();
  }
}
