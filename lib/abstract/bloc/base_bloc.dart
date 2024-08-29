import 'package:flutter_app/abstract/bloc/base_bloc_event.dart';
import 'package:flutter_app/abstract/bloc/base_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<Event extends BaseBlocEvent,
    State extends BaseBlocState, T> extends Bloc<Event, BaseBlocState> {
  bool isLoading = false;

  BaseBloc(super.initialState);

  Future<void> loadData({
    required Emitter<State> emit,
    required Future<T> Function() loadItems,
    required State Function(T items) loadedState,
    required State Function(Object exception) loadingFailureState,
  }) async {
    try {
      final items = await loadItems();
      emit(loadedState(items));
    } catch (e) {
      emit(loadingFailureState(e));
    }
  }
}
