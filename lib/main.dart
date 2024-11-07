import 'package:blog_app/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyEcommerceApp());
}

class MyEcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Define pages for each bottom navigation item
  static List<Widget> _pages = <Widget>[
    HomeScreen(),
    ShopScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.image),
            onPressed: () {
              // Add functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              // Add functionality for chat
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Set background color to black
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: const Color.fromARGB(
            255, 0, 0, 0), // Set unselected icon color to white for visibility
        showUnselectedLabels: true, // Always show labels for unselected items
        onTap: _onItemTapped,
      ),
    );
  }
}

// Individual page widgets

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Shop Screen'));
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Cart Screen'));
  }
}

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Account Screen'));
  }
}
