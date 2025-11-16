import 'package:flutter/material.dart';
import 'package:tradewatch/models/market_data_model.dart';
import 'market_list_item.dart';

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