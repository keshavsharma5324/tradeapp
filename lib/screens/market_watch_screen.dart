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
              child: const Row(
                children: [
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
              icon: const Badge(
                label: Text('10'),
                child: Icon(Icons.notifications_none_outlined),
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Indian Market'),
              Tab(text: 'International'),
              Tab(text: 'Forex Futures'),
              Tab(text: 'Crypto Futures'),
            ],
          ),
        ),
        body: const IndianMarketView(),
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
            child:
                BlocBuilder<MarketWatchBloc, MarketWatchState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const Center(child: Text('Initializing...')),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      loaded: (marketData) =>
                          MarketList(marketData: marketData),
                      error: (message) => Center(child: Text('Error: $message')),
                    );
                  },
            ),
          ),
        ],
      ),
    );
  }
}

class MarketList extends StatelessWidget {
  final List<MarketDataModel> marketData;

  const MarketList({super.key, required this.marketData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: marketData.length,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final data = marketData[index];
        final theme = Theme.of(context);
        final priceColor = data.isPositiveChange ? Colors.green : Colors.red;

        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: priceColor.withOpacity(0.1),
                      child: Text(data.symbol[0], style: TextStyle(color: priceColor, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.symbol, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        const Text('31-07-2025', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Icon(
                          data.isPositiveChange ? Icons.arrow_upward : Icons.arrow_downward,
                          color: priceColor,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${data.change.toStringAsFixed(2)}%',
                          style: TextStyle(color: priceColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    TextButton.icon(
                      onPressed: (){},
                      icon: const Icon(Icons.bar_chart, color: Colors.grey),
                      label: const Text('Chart', style: TextStyle(color: Colors.grey)),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.red.shade300),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Column(
                        children: [
                          Text('Sell', style: TextStyle(color: Colors.red.shade700, fontSize: 12)),
                          Text('3426.03', style: TextStyle(color: Colors.red.shade700, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Column(
                        children: const [
                          Text('Buy', style: TextStyle(color: Colors.white, fontSize: 12)),
                          Text('3428.03', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
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
