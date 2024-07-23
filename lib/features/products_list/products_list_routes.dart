import 'package:flutter/material.dart';

import '../product/model/product.dart';
import '../product/view/product_screen.dart';

abstract final class ProductsListRoutes {
  static MaterialPageRoute<void> productRoute(final Product product) =>
      MaterialPageRoute(
          builder: (final context) => ProductScreen(product: product));
}
