// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['productId'] as num).toInt(),
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['productDescription'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );
