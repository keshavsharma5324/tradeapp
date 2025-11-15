import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: const Color(0xFF083876),
      child: SizedBox(
        height: 60,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context,
                icon: Icons.star_border,
                label: 'My Favorites',
              ),
              _buildNavItem(context, icon: Icons.receipt_long, label: 'Order'),
              _buildNavItem(
                context,
                icon: Icons.wysiwyg_rounded,
                label: 'Watchlist',
                isActive: true,
              ),
              _buildNavItem(
                context,
                icon: Icons.show_chart,
                label: 'Positions',
              ),
              _buildNavItem(
                context,
                icon: Icons.account_balance_wallet_outlined,
                label: 'Wallet',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    bool isActive = false,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (label == 'Watchlist')
              const SizedBox.shrink()
            else
              Icon(icon, color: isActive ? Colors.white : Colors.white70),
            const SizedBox(height: 4),
            Padding(
              padding: EdgeInsetsGeometry.only(
                top: label == 'Watchlist' ? 24 : 0,
              ),
              child: Text(
                label,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.white70,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
