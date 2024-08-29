import 'package:flutter/foundation.dart';
import 'package:flutter_app/abstract/bloc/base_bloc.dart';
import 'package:flutter_app/abstract/bloc/base_bloc_state.dart';
import 'package:flutter_app/models/category/category_api.dart';
import 'package:flutter_app/repo/main_screen/bloc/category_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends BaseBloc<CategoryEvent, BaseBlocState, Category> {
  final CategoryApi categoryApi;

  CategoryBloc(this.categoryApi) : super(const InitialState()) {
    on<LoadCategory>(_onLoadCategory);
  }

  Future<void> _onLoadCategory(
      LoadCategory event, Emitter<BaseBlocState> emit) async {
    final response = await categoryApi.getCategoryList();
    emit(DataFoundState(data: response));
    event.completer?.complete();
  }
}
