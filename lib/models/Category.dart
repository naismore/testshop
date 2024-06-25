import 'package:flutter/foundation.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    required this.fullName,
    required this.description,
    required this.imageUrl,
  });
  final int id;
  final String title;
  final String fullName;
  final String description;
  final String? imageUrl;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['categoryId'] as int,
      title: json['title'] as String,
      fullName: json['fullName'] as String,
      description: (json['categoryDescription'] as String) ?? '',
      imageUrl: (json['imageUrl'] as String?) ?? 'images/cat.jpg',
    );
  }
}
