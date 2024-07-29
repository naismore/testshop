import 'package:extended_image/extended_image.dart';
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
      ExtendedImage(
        image: widget.product.imageUrl != null
            ? ExtendedNetworkImageProvider(widget.product.imageUrl!)
            : const NetworkImage('https://via.placeholder.com/200'),
        height: 200,
        width: 200,
        borderRadius: BorderRadius.circular(10),
        loadStateChanged: (ExtendedImageState state) {
          if (state.extendedImageLoadState == LoadState.failed) {
            return Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }
          return null;
        },
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
