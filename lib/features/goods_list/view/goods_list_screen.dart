import 'package:flutter/material.dart';

import '../../product/model/product.dart';
import '../../product/model/product_api.dart';
import '../widgets/product_tile.dart';

class GoodsListScreen extends StatefulWidget {
  const GoodsListScreen({super.key});

  @override
  State<GoodsListScreen> createState() => _GoodsListScreen();
}

class _GoodsListScreen extends State<GoodsListScreen> {
  List<Product>? _productList;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is int, '');
    final categoryId = args! as int;
    _loadGoodsByCategory(categoryId);
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Товары'),
      ),
      body: (_productList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: _productList!.length,
              separatorBuilder: (final context, final index) => const Divider(),
              itemBuilder: (final context, i) {
                final product = _productList![i];
                return ProductTile(product: product);
              }),
    );
  }

  Future<void> _loadGoodsByCategory(final int categoryId) async {
    _productList = await ProductApi().GetProductListByCategory(categoryId);
    setState(() {});
  }
}
