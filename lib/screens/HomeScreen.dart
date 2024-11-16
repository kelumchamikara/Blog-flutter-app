import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class HomeScreen extends StatelessWidget {
  // Sample product data
  final List<Map<String, String>> products = [
    {
      'name': 'Product 1',
      'image':
          'https://tse3.mm.bing.net/th?id=OIP.Qj4osaTcjVPWm5Rl_MXz8gHaHp&pid=Api&P=0&h=220',
      'price': '\$99.99',
    },
    {
      'name': 'Product 2',
      'image':
          'https://tse1.mm.bing.net/th?id=OIP.BO84XFxhV_PyG4PnEZsqxAAAAA&pid=Api&P=0&h=220',
      'price': '\$79.99',
    },
    {
      'name': 'Product 3',
      'image':
          'https://tse3.mm.bing.net/th?id=OIP.AEOxCTm3Sti3WgCMIrFDsAAAAA&pid=Api&P=0&h=220',
      'price': '\$79.99',
    },
    {
      'name': 'Product 4',
      'image':
          'https://tse1.mm.bing.net/th?id=OIP.FpasC3bbwA89DmCu_69mdAHaHa&pid=Api&P=0&h=220',
      'price': '\$79.99',
    },
    {
      'name': 'Product 5',
      'image':
          'https://tse1.mm.bing.net/th?id=OIP.BO84XFxhV_PyG4PnEZsqxAAAAA&pid=Api&P=0&h=220',
      'price': '\$79.99',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section (This remains the same)
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://via.placeholder.com/600x300.png?text=Banner+Image'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [Colors.black54, Colors.black26],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Text(
                  'Welcome to our Store!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Featured Products Section
            Text(
              'Featured Products',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return _buildProductItem(context, products[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, Map<String, String> product) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.network(
                product['image']!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      product['price']!,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.blueAccent,
                  onPressed: () {
                    cartProvider.addToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product['name']} added to cart'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
