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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Handle drawer opening
            },
          ),
          title: const Text('Market Watch'),
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: const [
                  Icon(Icons.account_balance_wallet, color: Colors.deepPurple),
                  SizedBox(width: 8),
                  Text(
                    '122200',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: Badge(
                label: const Text('10'),
                child: const Icon(Icons.notifications_none_outlined),
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: const [
              Tab(text: 'Indian Market'),
              Tab(text: 'International'),
              Tab(text: 'Forex Futures'),
              Tab(text: 'Crypto Futures'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const IndianMarketView(),
            const Center(child: Text('International')),
            const Center(child: Text('Forex Futures')),
            const Center(child: Text('Crypto Futures')),
          ],
        ),
        floatingActionButton: const CenterDockedFAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}

class IndianMarketView extends StatelessWidget {
  const IndianMarketView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'NSE Futures'),
              Tab(text: 'NSE Option'),
              Tab(text: 'MCX Futures'),
              Tab(text: 'MCX Option'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                BlocBuilder<MarketWatchBloc, MarketWatchState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const Center(child: Text('Initializing...')),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      loaded: (marketData) =>
                          MarketDataTable(marketData: marketData),
                      error: (message) => Center(child: Text('Error: $message')),
                    );
                  },
                ),
                const Center(child: Text('NSE Option')),
                const Center(child: Text('MCX Futures')),
                const Center(child: Text('MCX Option')),
              ],
            ),
          ),
        ],
      ),
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
