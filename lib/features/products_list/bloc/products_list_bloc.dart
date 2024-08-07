import 'dart:async';

import 'package:flutter_1/abstract/bloc/base_bloc.dart';
import 'package:flutter_1/features/product/model/product_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../product/model/product.dart';

part 'products_list_event.dart';
part 'products_list_state.dart';

class ProductsListBloc
    extends BaseBloc<ProductsListEvent, BaseBlocState, Product> {
  final ProductApi productApi;
  final int categoryId;

  ProductsListBloc(this.productApi, this.categoryId)
      : super(const InitialState()) {
    on<ProductsListLoad>(_onLoadProductsList);
  }

  Future<void> _onLoadProductsList(
      ProductsListLoad event, Emitter<BaseBlocState> emit) async {
    final response = await productApi.getProductListByCategory(categoryId);
    emit(DataFoundState(data: response));
    event.completer?.complete();
  }
}
