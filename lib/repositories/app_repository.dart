import '../models/models.dart';
import '../services/api_service.dart';
import '../services/firebase_service.dart';

class AppRepository {
  AppRepository({
    ApiService? apiService,
    FirebaseService? firebaseService,
  })  : _apiService = apiService ?? ApiService(),
        _firebaseService = firebaseService ?? FirebaseService();

  final ApiService _apiService;
  final FirebaseService _firebaseService;

  Future<List<ProductModel>> getProducts() async {
    return await _apiService.getProducts();
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    return await _apiService.searchProducts(query);
  }

  Future<ProductModel> getProduct(int id) async {
    return await _apiService.getProduct(id);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await _firebaseService.signIn(
      email: email,
      password: password,
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await _firebaseService.register(
      name: name,
      email: email,
      password: password,
    );
  }

  Future<void> logout() async {
    await _firebaseService.signOut();
  }

  Future<UserModel?> getProfile() async {
    return await _firebaseService.getUserProfile();
  }

  Future<void> saveWishlist(
    List<String> wishlist,
  ) async {
    await _firebaseService.updateWishlist(wishlist);
  }
}