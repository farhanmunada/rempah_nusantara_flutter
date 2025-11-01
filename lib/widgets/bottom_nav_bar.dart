
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  final String currentRoute;

  const BottomNavBar({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF4D5D42),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavBarItem(context, icon: Icons.home, route: '/'),
          _buildNavBarItem(context, icon: Icons.shopping_bag, route: '/shop'),
          _buildNavBarItem(context, icon: Icons.shopping_cart, route: '/cart'),
          _buildNavBarItem(context, icon: Icons.person, route: '/settings'),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(BuildContext context, {required IconData icon, required String route}) {
    final bool isSelected = currentRoute == route;
    return IconButton(
      icon: Icon(
        icon, 
        color: isSelected ? Colors.white : Colors.white.withOpacity(0.7),
        size: 30
      ),
      onPressed: () => context.go(route),
    );
  }
}
