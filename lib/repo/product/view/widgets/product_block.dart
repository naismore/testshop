part of '../product_screen.dart';

List<Widget> _buildProductBlock(BuildContext context, Product product) {
  return [
    productImageBuilder(context, product),
    const SizedBox(height: 16),
    productTitleBuilder(context, product.title!),
    const SizedBox(height: 16),
    productDescriptionBuilder(context, product.description!),
  ];
}
