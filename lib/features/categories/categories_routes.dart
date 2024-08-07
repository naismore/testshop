import 'package:flutter/material.dart';
import '../products_list/view/products_list_screen.dart';

abstract final class CategoriesRoutes {
  static MaterialPageRoute<void> goodsListRoute(
    final int categoryId,
  ) =>
      MaterialPageRoute(
        builder: (final context) => ProductsListScreen(categoryId: categoryId),
      );
}
