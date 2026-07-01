import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';

class ApiService {
  ApiService();

  static const String _baseUrl = 'https://fakestoreapi.com';

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/products'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data
            .map((item) => ProductModel.fromJson(item))
            .toList();
      }

      throw Exception('Failed to load products');
    } catch (e) {
      throw Exception('API Error: $e');
    }
  }

  Future<ProductModel> getProduct(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/products/$id'),
      );

      if (response.statusCode == 200) {
        return ProductModel.fromJson(
          jsonDecode(response.body),
        );
      }

      throw Exception('Product not found');
    } catch (e) {
      throw Exception('API Error: $e');
    }
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    final products = await getProducts();

    return products.where((product) {
      return product.title
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();
  }
}