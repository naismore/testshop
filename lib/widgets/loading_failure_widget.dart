import 'package:flutter/widgets.dart';

class LoadingFailureWidget extends StatelessWidget {
  const LoadingFailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Something went wrong',
          ),
        ],
      ),
    );
  }
}
