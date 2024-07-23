part of 'categories_bloc.dart';

class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoryLoaded extends CategoriesState {
  CategoryLoaded({
    required this.categoriesList
  });

  final List<Category>? categoriesList;
}

class CategoryLoadingFailure extends CategoriesState {
  CategoryLoadingFailure({
    this.exception
  });

  final Object? exception;
}