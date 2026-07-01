class ProductModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  final double rating;
  final bool isFavorite;









  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    this.isFavorite = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      rating: json['rating'] != null
          ? (json['rating']['rate'] ?? 0).toDouble()
          : 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'price': price,
      'rating': rating,
      'isFavorite': isFavorite,
    };
  }
}

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String profileImage;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profileImage: json['profileImage'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profileImage': profileImage,
    };
  }
}