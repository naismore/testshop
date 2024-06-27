import 'package:flutter/foundation.dart';

class Category {
  const Category({
    required this.id,
    this.title,
    this.fullName,
    this.description,
    this.imageUrl,
  });
  final int id;
  final String? title;
  final String? fullName;
  final String? description;
  final String? imageUrl;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['categoryId'] as int,
      title: json['title'] as String,
      fullName: json['fullName'] as String,
      description: (json['categoryDescription'] as String) ?? '',
      imageUrl: json['imageUrl'] as String?,
    );
  }
}
