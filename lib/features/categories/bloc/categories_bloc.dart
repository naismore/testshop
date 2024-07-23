import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../model/category.dart';
import '../model/category_api.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc(this.categoryApi) : super(CategoriesInitial()) {
    on<LoadCategories>((event, emit) async {
      try {
        if(state is! CategoryLoaded) {
            emit(CategoriesLoading());
        }
        final categoriesList = await categoryApi.getCategoryList();
        emit(CategoryLoaded(categoriesList: categoriesList));
      } catch (e) {
        emit(CategoryLoadingFailure(exception: e));
      }
      finally {
        event.completer?.complete();
      }
    });
  }

  final CategoryApi categoryApi;
}