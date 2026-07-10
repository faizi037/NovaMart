import 'package:flutter/material.dart';














class AppProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool _isLoading = false;
  bool _isAuthenticated = false;

  String _searchQuery = '';

  final List<String> _wishlist = [];
  final List<String> _cart = [];

  bool get isDarkMode => _isDarkMode;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _isAuthenticated;

  String get searchQuery => _searchQuery;

  List<String> get wishlist => List.unmodifiable(_wishlist);
  List<String> get cart => List.unmodifiable(_cart);

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void login() {
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    _wishlist.clear();
    _cart.clear();
    notifyListeners();
  }

  void updateSearch(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  void addToWishlist(String productId) {
    if (!_wishlist.contains(productId)) {
      _wishlist.add(productId);
      notifyListeners();
    }
  }

  void removeFromWishlist(String productId) {
    _wishlist.remove(productId);
    notifyListeners();
  }

  void addToCart(String productId) {
    if (!_cart.contains(productId)) {
      _cart.add(productId);
      notifyListeners();
    }
  }

  void removeFromCart(String productId) {
    _cart.remove(productId);
    notifyListeners();
  }

  bool isFavorite(String productId) {
    return _wishlist.contains(productId);
  }

  bool isInCart(String productId) {
    return _cart.contains(productId);
  }
}