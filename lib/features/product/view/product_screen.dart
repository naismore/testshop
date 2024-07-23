import 'package:flutter/material.dart';

import '../model/product.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  const ProductScreen({required this.product, super.key});

  @override
  State<ProductScreen> createState() => _ProductScreen();
}

class _ProductScreen extends State<ProductScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title ?? '...'),
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
      widget.product.imageUrl != null
          ? Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.product.imageUrl!), fit: BoxFit.cover),
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
        widget.product.title!,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      Text(
        (widget.product.description == '' || widget.product.description == null)
            ? 'Нет описания'
            : widget.product.description!,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    ];
  }
}
