import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  int get itemCount => _cartItems.length;

  // Calculate total price
  double get totalPrice {
    double total = 0.0;
    for (var item in _cartItems) {
      total += double.parse(item['price'].substring(1)) * item['quantity'];
    }
    return total;
  }

  // Add to cart with quantity
  void addToCart(Map<String, dynamic> product) {
    final index =
        _cartItems.indexWhere((item) => item['name'] == product['name']);
    if (index >= 0) {
      _cartItems[index]['quantity'] += 1;
    } else {
      _cartItems.add({...product, 'quantity': 1});
    }
    notifyListeners();
  }

  // Increase quantity
  void increaseQuantity(int index) {
    _cartItems[index]['quantity'] += 1;
    notifyListeners();
  }

  // Decrease quantity and remove if 0
  void decreaseQuantity(int index) {
    if (_cartItems[index]['quantity'] > 1) {
      _cartItems[index]['quantity'] -= 1;
    } else {
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }
}
