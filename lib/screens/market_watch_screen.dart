import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradewatch/blocs/market_watch_bloc/market_watch_bloc.dart';
import 'package:tradewatch/models/market_data_model.dart';
import 'package:tradewatch/widgets/bottom_nav_bar.dart';
import 'package:tradewatch/widgets/center_docked_fab.dart';

class MarketWatchScreen extends StatefulWidget {
  const MarketWatchScreen({super.key});

  @override
  State<MarketWatchScreen> createState() => _MarketWatchScreenState();
}

class _MarketWatchScreenState extends State<MarketWatchScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MarketWatchBloc>().add(
      const MarketWatchEvent.loadMarketData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TradeWatch')),
      body: BlocBuilder<MarketWatchBloc, MarketWatchState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Initializing...')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (marketData) => MarketDataTable(marketData: marketData),
            error: (message) => Center(child: Text('Error: $message')),
          );
        },
      ),
      floatingActionButton: const CenterDockedFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

class MarketDataTable extends StatelessWidget {
  final List<MarketDataModel> marketData;

  const MarketDataTable({super.key, required this.marketData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DataTable(
      columns: const [
        DataColumn(label: Text('Symbol')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Change')),
      ],
      rows: marketData.map((data) {
        final priceColor = data.isPositiveChange ? Colors.green : Colors.red;

        return DataRow(
          cells: [
            DataCell(Text(data.symbol, style: theme.textTheme.bodyMedium)),
            DataCell(
              Text(
                data.price.toStringAsFixed(2),
                style: theme.textTheme.bodyMedium?.copyWith(color: priceColor),
              ),
            ),
            DataCell(
              Text(
                data.change.toStringAsFixed(2),
                style: theme.textTheme.bodyMedium?.copyWith(color: priceColor),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
