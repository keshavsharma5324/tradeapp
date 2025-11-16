import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradewatch/blocs/market_watch_bloc/market_watch_bloc.dart';
import 'package:tradewatch/models/market_data_model.dart';
import 'package:tradewatch/widgets/bottom_nav_bar.dart';
import 'package:tradewatch/widgets/center_docked_fab.dart';
import 'package:tradewatch/widgets/market_list_item.dart';

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
                icon: Image.asset('assets/images/indian_market.png', width: 24, height: 24),
                text: 'Indian Market',
              ),
              Tab(
                icon: Image.asset('assets/images/international.png', width: 24, height: 24),
                text: 'International',
              ),
              Tab(
                icon: Image.asset('assets/images/forex_futures.png', width: 24, height: 24),
                text: 'Forex Futures',
              ),
              Tab(
                icon: Image.asset('assets/images/crypto_futures.png', width: 24, height: 24),
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
                onTap: (index) {
                  context
                      .read<MarketWatchBloc>()
                      .add(const MarketWatchEvent.shuffleMarketData());
                },
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
                  Tab(child: Padding(padding: EdgeInsets.all(12.0), child: Text('NSE Futures'))),
                  Tab(child: Padding(padding: EdgeInsets.all(12.0), child: Text('NSE Option'))),
                  Tab(child: Padding(padding: EdgeInsets.all(12.0), child: Text('MCX Futures'))),
                  Tab(child: Padding(padding: EdgeInsets.all(12.0), child: Text('MCX Option'))),
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

        return MarketListItem(priceColor: priceColor, data: data, theme: theme);
      },
    );
  }
}

