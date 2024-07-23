import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  final int id;
  final String title;
  final String fullName;
  final String description;
  final String? imageUrl;
  Category(
      {required this.id,
        required this.title,
        required this.fullName,
        required this.description,
        this.imageUrl});
  factory Category.fromJson(Map<String,dynamic> json) =>
      _$CategoryFromJson(json);
}
