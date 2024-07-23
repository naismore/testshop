import 'package:flutter/material.dart';

import 'features/categories/view/categories_screen.dart';
import 'theme/theme.dart';

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'TestShop',
      theme: theme,
      home: const CategoriesScreen(),
    );
  }
}
