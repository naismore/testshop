import 'package:flutter/material.dart';

import '../model/Product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreen();
}

class _ProductScreen extends State<ProductScreen> {
  Product? product;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is Product, '');
    product = args as Product;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product!.title ?? '...'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: _buildProductBlock,
          ),
        ),
      ),
    );
  }

  List<Widget> get _buildProductBlock {
    return [
      product!.imageUrl != null
          ? Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(product!.imageUrl!), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
            )
          : Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text('No image'),
              ),
            ),
      const SizedBox(height: 16),
      Text(
        product!.title!,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      Text(
        (product!.description == '' || product!.description == null)
            ? 'Нет описания'
            : product!.description!,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    ];
  }
}
