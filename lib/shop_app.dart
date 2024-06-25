import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'TestShop',
      theme: theme,
      routes: routes,
      //initialRoute: '/goods-list',
    );
  }
}
