import 'dart:async';
import 'package:tradewatch/domain/repositories/market_data_repository.dart';

class GetMarketDataStream  {
  final MarketDataRepository _marketDataRepository;

  GetMarketDataStream(this._marketDataRepository);

  Stream<dynamic> buildUseCaseStream() {
    final controller = StreamController();
    try {
      final marketDataStream = _marketDataRepository.getMarketData();
      marketDataStream.listen((data) {
        controller.add(data);
      }, onError: (e) {
        controller.addError(e);
      }, onDone: () {
        controller.close();
      });
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}