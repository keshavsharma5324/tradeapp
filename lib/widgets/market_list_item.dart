import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tradewatch/models/market_data_model.dart';

class MarketListItem extends StatelessWidget {
  const MarketListItem({
    super.key,
    required this.priceColor,
    required this.data,
    required this.theme,
  });

  final MaterialColor priceColor;
  final MarketDataModel data;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
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
            Flexible(
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: priceColor.withOpacity(0.1),
                        child: Text(
                          data.symbol[0],
                          style: TextStyle(
                            color: priceColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.symbol,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            '31-07-2025',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            data.isPositiveChange
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            color: priceColor,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${data.change.toStringAsFixed(2)}%',
                            style: TextStyle(
                              color: priceColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.bar_chart, color: Colors.grey),
                        label: const Text(
                          'Chart',
                          style: TextStyle(color: Colors.grey),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              child: Wrap(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      print('SELL: ${data.symbol}');
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.red.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Sell',
                          style: TextStyle(
                            color: Colors.red.shade700,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '3426.03',
                          style: TextStyle(
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (kDebugMode) {
                        print('BUY: ${data.symbol}');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'Buy',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Text(
                          '3428.03',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
