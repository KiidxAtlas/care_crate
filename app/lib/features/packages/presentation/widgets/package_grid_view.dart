import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PackageGridView extends ConsumerWidget {
  const PackageGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filters Section
          _buildFilters(),

          const SizedBox(height: 20),

          // Grid of packages
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: 6, // Example count
              itemBuilder: (context, index) =>
                  _buildPackageCard(context, index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Row(
      children: [
        const Text(
          'Filters:',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 20),
        _buildFilterChip('All'),
        const SizedBox(width: 10),
        _buildFilterChip('Get Well'),
        const SizedBox(width: 10),
        _buildFilterChip('Birthday'),
        const SizedBox(width: 10),
        _buildFilterChip('Love'),
      ],
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = label == 'All'; // Example selected state
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildPackageCard(BuildContext context, int index) {
    final packages = [
      {'name': 'Get Well Soon', 'price': '\$29.99', 'color': Colors.blue},
      {'name': 'Birthday Surprise', 'price': '\$34.99', 'color': Colors.pink},
      {'name': 'Love & Care', 'price': '\$39.99', 'color': Colors.red},
      {'name': 'Comfort Box', 'price': '\$24.99', 'color': Colors.green},
      {'name': 'Celebration Kit', 'price': '\$44.99', 'color': Colors.orange},
      {'name': 'Wellness Pack', 'price': '\$32.99', 'color': Colors.purple},
    ];

    final package = packages[index % packages.length];

    return GestureDetector(
      onTap: () => _showPackageDetails(context, package),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          border: Border.all(color: Colors.grey[700]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Package image placeholder
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: (package['color'] as Color).withOpacity(0.3),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.card_giftcard,
                  size: 48,
                  color: package['color'] as Color,
                ),
              ),
            ),

            // Package details
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    package['name'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    package['price'] as String,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _addToCart(package),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 12),
                      ),
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

  void _showPackageDetails(BuildContext context, Map<String, dynamic> package) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          package['name'],
          style: const TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price: ${package['price']}',
              style: const TextStyle(color: Colors.white70, fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text(
              'This care package includes:',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '• Comfort items\n• Sweet treats\n• Personal note\n• Beautiful packaging',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _addToCart(package);
            },
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }

  void _addToCart(Map<String, dynamic> package) {
    // Cart functionality would be implemented here
    print('Added ${package['name']} to cart');
  }
}
