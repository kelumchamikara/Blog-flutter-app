import 'package:blog_app/screens/AccountScreen.dart';
import 'package:blog_app/screens/HomeScreen.dart';
import 'package:blog_app/screens/ShopScreen.dart';
import 'package:blog_app/screens/CartScreen.dart';
import 'package:blog_app/screens/LoginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAc3YB1Mvs23Fd64_OU60NnLnzbmqEuKT0",
        appId: "1:370709232688:web:3c82269fb564f3f5b041f5",
        messagingSenderId: "370709232688",
        projectId: "ecommerce-app-90fd9",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyEcommerceApp(),
    ),
  );
}

class MyEcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // While waiting for authentication state, show loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        // If user is logged in, show MainScreen
        if (snapshot.hasData) {
          return MainScreen(); // Show the main screen when logged in
        }
        // If user is not logged in, show LoginScreen
        return LoginScreen(); // Show login screen when not logged in
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    HomeScreen(),
    ShopScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  // Handle the bottom navigation bar tap
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
          OutlinedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'Logout',
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            icon: Icon(Icons.image),
            onPressed: () {
              // Image icon functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              // Chat icon functionality
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                if (Provider.of<CartProvider>(context).itemCount > 0)
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        '${Provider.of<CartProvider>(context).itemCount}',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Handle bottom navigation bar tap
      ),
    );
  }
}
