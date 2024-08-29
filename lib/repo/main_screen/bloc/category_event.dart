import 'dart:async';

import 'package:flutter_app/abstract/bloc/base_bloc_event.dart';

class CategoryEvent extends BaseBlocEvent {}

class LoadCategory extends CategoryEvent {
  LoadCategory({this.completer});
  final Completer? completer;
}
