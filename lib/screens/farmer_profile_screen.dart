
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FarmerProfileScreen extends StatelessWidget {
  const FarmerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF9F4),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 24),
            _buildStats(),
            const SizedBox(height: 24),
            _buildProductSection(context),
          ],
        ),
      ),
       bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFBF9F4),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color(0xFF4A4A4A)),
        onPressed: () => context.pop(),
      ),
      title: const Text(
        '@Eko_susanto',
        style: TextStyle(
          color: Color(0xFF4A4A4A),
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.share_outlined, color: Color(0xFF4D5D42), size: 28),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Color(0xFF4D5D42), size: 28),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage('https://picsum.photos/150/150?random=5'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Eko Susanto',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF4A4A4A)),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Rempah terbaik lahir dari sabar menunggu matahari.',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4D5D42),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                  ),
                  child: const Text('Following'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('15', 'Produk'),
          _buildStatItem('10', 'Following'),
          _buildStatItem('250', 'Followers'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF4A4A4A))),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }

  Widget _buildProductSection(BuildContext context) {
    final products = {
      'Bunga Lawang': '15',
      'Kayu Manis': '16',
      'Kemukus': '17',
    };

    return Column(
      children: [
        const Text('Produk', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4A4A4A))),
        const Divider(indent: 16, endIndent: 16, height: 24),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final name = products.keys.elementAt(index);
            final imageId = products.values.elementAt(index);
            return GestureDetector(
              onTap: () => context.push('/product'),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 0,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.network(
                        'https://picsum.photos/600/200?random=$imageId',
                        fit: BoxFit.cover,
                        height: 150,
                        width: double.infinity,
                      ),
                      Container(
                         width: double.infinity,
                         padding: const EdgeInsets.symmetric(vertical: 16),
                         decoration: BoxDecoration(
                           color: Colors.white.withOpacity(0.9),
                           borderRadius: const BorderRadius.only(
                             bottomLeft: Radius.circular(20),
                             bottomRight: Radius.circular(20),
                           )
                         ),
                         child: Text(
                           name,
                           textAlign: TextAlign.center,
                           style: const TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 18,
                             color: Color(0xFF4A4A4A)
                           ),
                         ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
   Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF4D5D42),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(icon: const Icon(Icons.home_outlined, color: Colors.white), onPressed: () => context.go('/')),
          IconButton(icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white), onPressed: () => context.go('/cart')),
          IconButton(icon: const Icon(Icons.person, color: Colors.white), onPressed: () => context.go('/settings')),
        ],
      ),
    );
  }
}
