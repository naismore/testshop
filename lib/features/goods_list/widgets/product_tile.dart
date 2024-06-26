import 'package:flutter/material.dart';

import '../../../models/Product.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: product.imageUrl != null
          ? Image.network(product.imageUrl!)
          : Image.network('https://via.placeholder.com/200'),
      title: Text(product.title, style: Theme.of(context).textTheme.bodyMedium),
      subtitle: Text(
        product.price.toString() + '\$',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/product',
          arguments: product,
        );
      },
    );
  }
}
