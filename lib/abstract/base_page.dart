import 'package:flutter/material.dart';

abstract class BasePage extends StatefulWidget {
  final String? title;

  const BasePage({super.key, this.title});
}

abstract class BasePageState<T extends BasePage> extends State<T> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final body = buildBody(context);
    final scaffold = buildScaffold(context, body);
    return scaffold;
  }

  @protected
  Widget buildBody(BuildContext context);

  @protected
  Widget buildScaffold(BuildContext context, Widget body) {
    return Scaffold(
      appBar: buildAppBar(context),
      key: scaffoldKey,
      body: body,
    );
  }

  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: buildAppBarTitle(context),
      centerTitle: true,
    );
  }

  Widget buildAppBarTitle(BuildContext context) {
    return Text(
      widget.title!,
      style: const TextStyle(fontSize: 27),
    );
  }
}
