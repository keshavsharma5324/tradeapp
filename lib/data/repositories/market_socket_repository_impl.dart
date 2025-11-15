import 'package:tradewatch/data/datasources/market_socket_data_source.dart';
import 'package:tradewatch/domain/repositories/market_socket_repository.dart';
import 'package:tradewatch/models/market_data_model.dart';

class MarketSocketRepositoryImpl implements MarketSocketRepository {
  final MarketSocketDataSource _dataSource;

  MarketSocketRepositoryImpl(this._dataSource);

  @override
  Stream<List<MarketDataModel>> getMarketDataStream() {
    return _dataSource.getMarketDataStream();
  }
}
