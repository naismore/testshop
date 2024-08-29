import 'package:flutter/material.dart';
import 'package:flutter_app/abstract/base_page.dart';
import 'package:flutter_app/models/product/product.dart';
import 'package:flutter_app/repo/product/view/widgets/description_builder.dart';
import 'package:flutter_app/repo/product/view/widgets/image_builder.dart';
import 'package:flutter_app/repo/product/view/widgets/product_title_builder.dart';

part 'widgets/product_block.dart';

class ProductScreen extends BasePage {
  final Product product;

  ProductScreen({
    required this.product,
    super.key,
  }) : super(title: product.title);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends BasePageState<ProductScreen> {
  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: _buildProductBlock(context, widget.product),
        ),
      ),
    );
  }
}
