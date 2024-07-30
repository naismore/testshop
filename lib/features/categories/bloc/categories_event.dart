part of 'categories_bloc.dart';

class CategoriesEvent {}

class LoadCategories extends CategoriesEvent {
  LoadCategories({
    this.completer
  });
  final Completer? completer;
}