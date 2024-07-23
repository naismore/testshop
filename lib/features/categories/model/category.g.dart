// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(final Map<String, dynamic> json) => Category(
      id: (json['categoryId'] as num).toInt(),
      title: json['title'] as String,
      fullName: json['fullName'] as String,
      description: json['categoryDescription'] as String,
      imageUrl: json['imageUrl'] as String?,
    );
