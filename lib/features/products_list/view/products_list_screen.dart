import 'package:flutter/material.dart';
import 'package:flutter_1/features/products_list/widgets/products_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../product/model/product_api.dart';
import '../bloc/products_list_bloc.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({
    required this.categoryId,
    super.key,
  });

  final int categoryId;

  @override
  State<ProductsListScreen> createState() => _ProductsListScreen();
}

class _ProductsListScreen extends State<ProductsListScreen> {
  late final ProductsListBloc _productsListBloc = ProductsListBloc(
    GetIt.I<ProductApi>(),
    widget.categoryId,
  )..add(ProductsListLoad());

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Товары'),
      ),
      body: BlocBuilder<ProductsListBloc, ProductsListState>(
        bloc: _productsListBloc,
        builder: (context, state) {
          if (state is ProductsListLoaded) {
            return ListView.separated(
              itemCount: state.productsList!.length,
              separatorBuilder: (final context, final index) => const Divider(),
              itemBuilder: (final context, i) {
                final product = state.productsList![i];
                return ProductTile(product: product);
              },
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
