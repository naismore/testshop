import 'package:flutter/material.dart';

import '../../../models/Product.dart';
import '../../../models/ProductApi.dart';
import '../widgets/widgets.dart';

class GoodsListScreen extends StatefulWidget {
  const GoodsListScreen({super.key});

  @override
  State<GoodsListScreen> createState() => _GoodsListScreen();
}

class _GoodsListScreen extends State<GoodsListScreen> {
  List<Product>? _productList;

  @override
  void initState() {
    _loadGoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Товары'),
        leading: Icon(Icons.arrow_back),
      ),
      body: (_productList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: _productList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final product = _productList![i];
                return ProductTile(product: product);
              }),
    );
  }

  Future<void> _loadGoods() async {
    _productList = await ProductApi().GetProductList();
    setState(() {});
  }
}
