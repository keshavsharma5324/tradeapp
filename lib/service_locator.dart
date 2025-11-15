import 'package:get_it/get_it.dart';
import 'package:tradewatch/blocs/market_watch_bloc/market_watch_bloc.dart';
import 'package:tradewatch/data/datasources/market_data_source.dart';
import 'package:tradewatch/data/datasources/market_data_source_impl.dart';
import 'package:tradewatch/data/datasources/market_socket_data_source.dart';
import 'package:tradewatch/data/datasources/market_socket_data_source_impl.dart';
import 'package:tradewatch/data/repositories/market_data_repository_impl.dart';
import 'package:tradewatch/data/repositories/market_socket_repository_impl.dart';
import 'package:tradewatch/domain/repositories/market_data_repository.dart';
import 'package:tradewatch/domain/repositories/market_socket_repository.dart';
import 'package:tradewatch/domain/usecases/get_market_data_socket.dart';
import 'package:tradewatch/domain/usecases/get_market_data_stream.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // Use cases
  locator.registerLazySingleton(
    () => GetMarketDataStream(locator<MarketDataRepository>()),
  );
  locator.registerLazySingleton(
    () => GetMarketDataSocket(locator<MarketSocketRepository>()),
  );

  // Data sources
  locator.registerLazySingleton<MarketDataSource>(() => MarketDataSourceImpl());
  locator.registerLazySingleton<MarketSocketDataSource>(
    () => MarketSocketDataSourceImpl(),
  );

  // Repositories
  locator.registerLazySingleton<MarketDataRepository>(
    () => MarketDataRepositoryImpl(locator<MarketDataSource>()),
  );
  locator.registerLazySingleton<MarketSocketRepository>(
    () => MarketSocketRepositoryImpl(locator<MarketSocketDataSource>()),
  );

  // BLoCs
  locator.registerFactory(
    () => MarketWatchBloc(
      getMarketDataStream: locator<GetMarketDataStream>(),
      getMarketDataSocket: locator<GetMarketDataSocket>(),
    ),
  );
}
