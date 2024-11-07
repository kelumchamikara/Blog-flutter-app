import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://via.placeholder.com/600x300.png?text=Banner+Image'), // Replace with your banner image
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

            // Categories Section
            Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryItem('Electronics', Icons.electrical_services),
                  _buildCategoryItem('Fashion', Icons.checkroom),
                  _buildCategoryItem('Home', Icons.home),
                  _buildCategoryItem('Beauty', Icons.brush),
                  _buildCategoryItem('Sports', Icons.sports),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Featured Products Section
            Text(
              'Featured Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              itemCount: 4, // Number of featured products
              itemBuilder: (context, index) {
                return _buildProductItem();
              },
            ),
            SizedBox(height: 20),

            // Popular Items Section
            Text(
              'Popular Items',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              itemCount: 4, // Number of popular items
              itemBuilder: (context, index) {
                return _buildProductItem();
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget for individual category items
  Widget _buildCategoryItem(String name, IconData icon) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 28),
          SizedBox(height: 6),
          Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  // Widget for individual product items
  Widget _buildProductItem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                'assets/images/product1.jpg', // Replace with product image URL
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
                      'Product Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('\$99.99', style: TextStyle(color: Colors.blueAccent)),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.blueAccent,
                  onPressed: () {
                    // Handle Add to Cart functionality here
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
