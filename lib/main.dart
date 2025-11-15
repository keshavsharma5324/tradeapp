import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradewatch/blocs/market_watch_bloc/market_watch_bloc.dart';
import 'package:tradewatch/blocs/theme_bloc/theme_bloc.dart';
import 'package:tradewatch/domain/usecases/get_market_data_socket.dart';
import 'package:tradewatch/domain/usecases/get_market_data_stream.dart';
import 'package:tradewatch/screens/market_watch_screen.dart';
import 'package:tradewatch/service_locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<MarketWatchBloc>(
          create: (context) => MarketWatchBloc(
            getMarketDataStream: locator<GetMarketDataStream>(),
            getMarketDataSocket: locator<GetMarketDataSocket>(),
          )..add(const MarketWatchEvent.loadMarketData()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'TradeWatch',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: state.themeMode,
            home: const MarketWatchScreen(),
          );
        },
      ),
    );
  }
}
