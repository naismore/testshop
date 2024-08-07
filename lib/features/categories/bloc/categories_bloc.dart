import 'dart:async';

import 'package:flutter_1/abstract/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/category.dart';
import '../model/category_api.dart';

part 'categories_event.dart';

class CategoriesBloc
    extends BaseBloc<CategoriesEvent, BaseBlocState, Category> {
  final CategoryApi categoryApi;

  CategoriesBloc(this.categoryApi) : super(const InitialState()) {
    on<LoadCategories>(_onLoadCategories);
  }

  Future<void> _onLoadCategories(
      LoadCategories event, Emitter<BaseBlocState> emit) async {
    final response = await categoryApi.getCategoryList();
    emit(DataFoundState(data: response!));
    event.completer?.complete();
  }
}
