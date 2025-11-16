import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // Handle drawer opening
            },
          ),
          title: const Text('Market Watch', style: TextStyle(color: Colors.white)),
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.account_balance_wallet, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    '122200',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Badge(
                label: Text('10'),
                child: Icon(Icons.notifications_none_outlined, color: Colors.white),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notifications Clicked')),
                );
              },
            ),
            const SizedBox(width: 8),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF436EDD),
                  Color(0xFFAF7CE3),
                  Color(0xFFAF69C7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: SvgPicture.asset('assets/images/indian_market.svg', width: 24, height: 24),
                text: 'Indian Market',
              ),
              Tab(
                icon: SvgPicture.asset('assets/images/international.svg', width: 24, height: 24),
                text: 'International',
              ),
              Tab(
                icon: SvgPicture.asset('assets/images/forex_futures.svg', width: 24, height: 24),
                text: 'Forex Futures',
              ),
              Tab(
                icon: SvgPicture.asset('assets/images/crypto_futures.svg', width: 24, height: 24),
                text: 'Crypto Futures',
              ),
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
    return Container(
      color: Colors.white,
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
              color: Colors.grey[200],
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black87,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF436EDD),
                      Color(0xFFAF7CE3),
                      Color(0xFFAF69C7),
                    ],
                  ),
                ),
                tabs: const [
                  Tab(text: 'NSE Futures'),
                  Tab(text: 'NSE Option'),
                  Tab(text: 'MCX Futures'),
                  Tab(text: 'MCX Option'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for stocks, futures, options, etc.',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.grey.shade200, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Color(0xFF436EDD), width: 2.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                ),
              ),
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
          elevation: 0,
          color: Colors.grey[200],
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
                      onPressed: () {
                        print('SELL: ${data.symbol}');
                      },
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
                      onPressed: () {
                        print('BUY: ${data.symbol}');
                      },
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
