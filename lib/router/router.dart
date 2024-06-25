import '../features/categories/categories.dart';
import '../features/goods_list/goods_list.dart';
import '../features/product/product.dart';

final routes = {
        '/': (context) => CategoriesScreen(),
        '/product' : (final context) => const ProductScreen(),
        '/goods-list': (final context) => const GoodsListScreen(),
      };