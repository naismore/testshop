import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/abstract/bloc/base_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseBlocBuilder<B extends BlocBase<BaseBlocState>, Data>
    extends StatelessWidget {
  const BaseBlocBuilder({
    super.key,
    required this.bloc,
    required this.buildContent,
    required this.onLoadingFailurePressed,
  });

  final B bloc;
  final Widget Function(BuildContext context, DataFoundState<Data> state)
      buildContent;
  final VoidCallback onLoadingFailurePressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, BaseBlocState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is ErrorState) {
          BotToast.showSimpleNotification(title: 'Error!');
        }
        if (state is DataFoundState<Data>) {
          return buildContent(context, state);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
