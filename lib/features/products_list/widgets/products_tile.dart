import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../product/model/product.dart';
import '../products_list_routes.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      // TODO: Вынести сделать на ExtendedImage.network
      leading: ExtendedImage.network(
        product.imageUrl!,
        
      ),
      // FadeInImage(
      //   placeholder: const NetworkImage('https://via.placeholder.com/200'),
      //   image: NetworkImage(product.imageUrl!),
      //   fit: BoxFit.cover,
      // ),
      title: Text(product.title!, style: theme.textTheme.bodyMedium),
      subtitle: Text(
        '${product.price}\$',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.of(context).push(
            ProductsListRoutes.productRoute(product)
        );
      },
    );
  }
}
