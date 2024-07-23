part of 'products_list_bloc.dart';

class ProductsListState {}

class ProductsListInitial extends ProductsListState {}

class ProductsListLoaded extends ProductsListState {
  ProductsListLoaded({
    this.productsList
  });

  final List<Product>? productsList;
}

class ProductsListLoadingFailure extends ProductsListState {
  ProductsListLoadingFailure({
    this.exception
  });

  final Object? exception;
}