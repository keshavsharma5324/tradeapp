import 'package:tradewatch/domain/repositories/market_socket_repository.dart';
import 'package:tradewatch/models/market_data_model.dart';

class GetMarketDataSocket {
  final MarketSocketRepository repository;

  GetMarketDataSocket(this.repository);

  Stream<List<MarketDataModel>> call() {
    return repository.getMarketDataStream();
  }
}
