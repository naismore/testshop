import 'dart:convert';

class Product {
  final int id;
  final String? title;
  final double? price;
  final String? description;
  final String? imageUrl;

  const Product({
    required this.id,
    this.title,
    this.price,
    this.description,
    this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['productId'] as int,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      description: (json['productDescription'] as String) ?? '',
      imageUrl: (json['imageUrl'] as String?) ??
          'https://www.kurin.com/wp-content/uploads/placeholder-square.jpg',
    );
  }
}
