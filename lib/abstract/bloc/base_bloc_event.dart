part of 'base_bloc.dart';

abstract class BaseBlocEvent {}

abstract class BaseBlocLoadEvent extends BaseBlocEvent {
  BaseBlocLoadEvent({this.completer});

  final Completer? completer;
}
