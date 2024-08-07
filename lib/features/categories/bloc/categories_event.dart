part of 'categories_bloc.dart';

class CategoriesEvent extends BaseBlocEvent {}

class LoadCategories extends CategoriesEvent {
  LoadCategories({this.completer});
  final Completer? completer;
}
