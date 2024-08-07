part of 'products_list_bloc.dart';

class ProductsListEvent extends BaseBlocEvent {}

class ProductsListLoad extends ProductsListEvent {
  ProductsListLoad({this.completer});

  final Completer? completer;
}
