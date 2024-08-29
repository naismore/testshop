import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/repo/main_screen/view/main_screen.dart';
import 'package:flutter_app/theme.dart';

class TestShop extends StatelessWidget {
  const TestShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestShop',
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: theme,
      home: const MainScreen(),
    );
  }
}
