part of 'base_bloc.dart';

abstract class BaseBlocState {
  const BaseBlocState();
}

class InitialState<T> extends BaseBlocState {
  final T? data;

  const InitialState({this.data}) : super();
}

class LoadingState extends BaseBlocState {
  const LoadingState() : super();
}

class DataFoundState<T> extends BaseBlocState {
  final T? data;

  const DataFoundState({required this.data}) : super();
}

class ErrorState extends BaseBlocState {
  final String message;

  const ErrorState({required this.message}) : super();
}
