import 'package:flutter/material.dart';
import 'package:flutter_app/models/category/category.dart';
import 'package:flutter_app/repo/main_screen/view/widgets/categories/category_container.dart';

Widget buildCategoriesTile(BuildContext context, Category category) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    child: buildCategoryContainer(category.title, category.imageUrl),
  );
}
