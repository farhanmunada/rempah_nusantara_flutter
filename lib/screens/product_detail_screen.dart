
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF9F4),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(),
            _buildFarmerInfo(context),
            const Divider(height: 32, indent: 16, endIndent: 16),
            _buildDetailsSection(),
            _buildDescriptionSection(),
            _buildRelatedProductsSection(context),
            const SizedBox(height: 30,)
          ],
        ),
      ),
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
          'Rempah Trending',
          style: TextStyle(
            color: Color(0xFF4A4A4A),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Color(0xFF4D5D42), size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Color(0xFF4D5D42), size: 28),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      );
  }

  Widget _buildProductImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              'https://picsum.photos/600/400?random=11',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.play_arrow, color: Colors.white, size: 60),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                   color: const Color(0xFF4D5D42).withOpacity(0.9),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Bunga Lawang',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.white, size: 20),
                        const SizedBox(width: 16),
                        const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 20),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFarmerInfo(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/farmer-profile'),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage('https://picsum.photos/100/100?random=5'),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Eko Santoso', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF4A4A4A))),
                  Text('Petani', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4D5D42),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text('Following'),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.more_vert, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF4A4A4A))),
          const SizedBox(height: 16),
          _buildDetailRow('Harga', 'Rp 95.000 / kg'),
          _buildDetailRow('Asal', 'Manado, Sulawesi Utara'),
          _buildDetailRow('Kualitas', 'Premium Grade — Kering Matahari'),
          _buildDetailRow('Ketersediaan', '48 kg'),
        ],
      ),
    );
  }
  
  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Color(0xFF4A4A4A)),
          children: [
            TextSpan(text: '$title: ', style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: value),
          ]
        ),
      ),
    );
  }

  Widget _buildDescriptionSection() {
     return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Deskripsi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF4A4A4A))),
          const SizedBox(height: 8),
          const Text(
            'Bunga lawang atau star anise dari Manado dikenal memiliki bentuk bintang sempurna dan aroma hangat yang eksotis. Ditanam di lereng pegunungan Minahasa, bunga ini dipanen dengan tangan dan dijemur secara alami hingga kering sempurna.',
            style: TextStyle(fontSize: 16, color: Colors.black54, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedProductsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            'Produk Terkait',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A4A4A),
            ),
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 16),
              _buildRelatedItem(
                context,
                'https://picsum.photos/150/150?random=12',
                'Cengkeh',
                'Rp 40.000/kg',
              ),
              const SizedBox(width: 16),
              _buildRelatedItem(
                context,
                'https://picsum.photos/150/150?random=13',
                'Kapulaga',
                'Rp 60.000/kg',
              ),
              const SizedBox(width: 16),
              _buildRelatedItem(
                context,
                'https://picsum.photos/150/150?random=14',
                'Pala Bubuk',
                'Rp 35.000/pack',
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRelatedItem(BuildContext context, String imageUrl, String name, String price) {
    return GestureDetector(
      onTap: () => context.push('/product'),
      child: SizedBox(
        width: 150,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(imageUrl, fit: BoxFit.cover, height: 150, width: 150),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF4A4A4A))),
                    const SizedBox(height: 4),
                    Text(price, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
