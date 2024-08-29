import 'package:flutter/material.dart';
import 'package:flutter_app/abstract/bloc/base_bloc.dart';
import 'package:flutter_app/abstract/bloc/base_bloc_event.dart';
import 'package:flutter_app/abstract/bloc/base_bloc_state.dart';
import 'package:flutter_app/models/api/api_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseListViewBloc<T>
    extends BaseBloc<BaseBlocEvent, BaseBlocState, List<T>> {
  BaseListViewBloc(super.initialState) {
    on<BaseBlocLoadEvent>(_onLoadList);
  }

  List<T> loadedData = [];
  bool isAllLoaded = false;

  int get offset => loadedData.length;

  @protected
  Future<void> _onLoadList(
    BaseBlocLoadEvent event,
    Emitter<BaseBlocState> emit,
  ) async {
    if (isLoading || isAllLoaded) return;
    isLoading = true;

    final response = await getData();

    if (response.isError) {
      isAllLoaded = true;
      emit(ErrorState(message: response.error!));
      return;
    }
    loadedData.addAll(response.data!);
    isAllLoaded = response.data!.isEmpty;
    isLoading = false;
    emit(DataFoundState(data: loadedData));
    event.completer?.complete();
  }

  Future<ApiResponse<List<T>>> getData();
}
