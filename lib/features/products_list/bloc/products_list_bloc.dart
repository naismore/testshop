import 'package:flutter_1/features/categories/bloc/categories_bloc.dart';
import 'package:flutter_1/features/product/model/product_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../product/model/product.dart';

part 'products_list_event.dart';
part 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductsListBloc(this.productApi, this.categoryId) : super(ProductsListInitial()) {
    on<ProductsListLoad>((event, emit) async {
      try {
        final productsList = await productApi.GetProductListByCategory(categoryId);
        emit(ProductsListLoaded(productsList: productsList));
      } catch (e) {
        emit (ProductsListLoadingFailure(exception: e));
      }
    });
  }

  final int categoryId;
  final ProductApi productApi;
}