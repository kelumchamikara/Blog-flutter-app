import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  // Sample product data
  final List<Map<String, String>> products = [
    {
      'name': 'Product 1',
      'image':
          'https://tse3.mm.bing.net/th?id=OIP.k_xF1PaXfX0bMd4bKvQHHwHaHi&pid=Api&P=0&h=220',
      'price': '\$99.99',
    },
    {
      'name': 'Product 2',
      'image':
          'https://tse2.mm.bing.net/th?id=OIP.RFbpL8P1hu1Rlq7IpvrQewHaHa&pid=Api&P=0&h=220',
      'price': '\$79.99',
    },
    {
      'name': 'Product 3',
      'image':
          'https://tse3.mm.bing.net/th?id=OIP.9rQm1CaPEEObBqTm82IbRwHaKS&pid=Api&P=0&h=220',
      'price': '\$49.99',
    },
    {
      'name': 'Product 4',
      'image':
          'https://tse3.mm.bing.net/th?id=OIP.-TrZy8GJzZ-U0kH27AmBRwHaHW&pid=Api&P=0&h=220',
      'price': '\$129.99',
    },
    {
      'name': 'Product 1',
      'image':
          'https://tse3.mm.bing.net/th?id=OIP.k_xF1PaXfX0bMd4bKvQHHwHaHi&pid=Api&P=0&h=220',
      'price': '\$99.99',
    },
    {
      'name': 'Product 2',
      'image':
          'https://tse2.mm.bing.net/th?id=OIP.RFbpL8P1hu1Rlq7IpvrQewHaHa&pid=Api&P=0&h=220',
      'price': '\$79.99',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shop',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return _buildProductItem(products[index]);
          },
        ),
      ),
    );
  }

  // Widget for individual product items
  Widget _buildProductItem(Map<String, String> product) {
    return GestureDetector(
      onTap: () {
        // Navigate to a product detail page if needed
        print('Tapped on ${product['name']}');
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                product['image']!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        product['price']!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon:
                        Icon(Icons.add_shopping_cart, color: Colors.blueAccent),
                    onPressed: () {
                      // Handle add to cart functionality here
                      print('Added ${product['name']} to cart');
                    },
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
