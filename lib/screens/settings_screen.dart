
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/widgets/bottom_nav_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF9F4),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildSettingsList(),
              const SizedBox(height: 32),
              _buildSellProductCard(context),
               const SizedBox(height: 24),
              _buildLogoutSection(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentRoute: '/settings'),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFBF9F4),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color(0xFF4A4A4A)),
        onPressed: () => context.go('/'), // Kembali ke home
      ),
      title: const Text(
        'Settings',
        style: TextStyle(
          color: Color(0xFF4D5D42),
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildSettingsList() {
    return Column(
      children: [
        _buildSettingsItem(icon: Icons.notifications_none_outlined, title: 'Notification'),
        _buildSettingsItem(icon: Icons.help_outline, title: 'Help Center'),
        _buildSettingsItem(icon: Icons.privacy_tip_outlined, title: 'Privacy Policy'),
        _buildSettingsItem(icon: Icons.language_outlined, title: 'Language'),
        _buildSettingsItem(icon: Icons.dark_mode_outlined, title: 'Turn dark Theme', isSwitch: true),
      ],
    );
  }

  Widget _buildSettingsItem({required IconData icon, required String title, bool isSwitch = false}) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF4D5D42)),
      title: Text(title, style: const TextStyle(fontSize: 16, color: Color(0xFF4A4A4A))),
      trailing: isSwitch
          ? Switch(
              value: false,
              onChanged: (value) {},
              activeColor: const Color(0xFF4D5D42),
            )
          : const Icon(Icons.arrow_forward_ios, color: Color(0xFF4D5D42), size: 16),
      onTap: () {},
    );
  }

   Widget _buildSellProductCard(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () => context.go('/login'), // Arahkan ke login/signup penjual
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.storefront_outlined, color: Color(0xFF4D5D42), size: 28),
              SizedBox(width: 16),
              Text(
                'Jual Produk Anda',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF4D5D42),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutSection(BuildContext context) {
    return Column(
      children: [
        ListTile(
           leading: const Icon(Icons.logout, color: Color(0xFFD9534F)),
           title: const Text('Log Out', style: TextStyle(color: Color(0xFFD9534F), fontSize: 16, fontWeight: FontWeight.w500)),
           onTap: () => context.go('/login'),
        ),
        ListTile(
           leading: const Icon(Icons.delete_outline, color: Color(0xFFD9534F)),
           title: const Text('Delete Account', style: TextStyle(color: Color(0xFFD9534F), fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () {},
        ),
      ],
    );
  }
}
