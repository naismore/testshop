import 'dart:async';

abstract class BaseBlocEvent {}

class BaseBlocLoadEvent extends BaseBlocEvent {
  BaseBlocLoadEvent({this.completer});

  final Completer? completer;
}
