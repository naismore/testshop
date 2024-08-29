import 'package:flutter/material.dart';
import 'package:flutter_app/abstract/base_page.dart';
import 'package:flutter_app/abstract/bloc/base_bloc.dart';

abstract class BaseListViewPage extends BasePage {
  const BaseListViewPage({super.key, super.title});
}

abstract class BaseListViewPageState<T extends BaseListViewPage,
    B extends BaseBloc> extends BasePageState<T> {
  final bool shouldBeRefreshable = false;
  final bool shouldBeSeparated = false;
  final ScrollController scrollController = ScrollController();

  late final B listModel = createModel();

  B createModel();

  @override
  void initState() {
    scrollController.addListener(_onScroll);
    // Добавить на чтение
    super.initState();
  }

  void _onScroll() {
    if (!mounted) return;
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMore();
      }
    }
  }

  void loadMore();

  @override
  Widget buildBody(BuildContext context) {
    final listViewBody = buildListViewBody(context);
    if (shouldBeRefreshable) {
      return RefreshIndicator(onRefresh: handleRefresh, child: listViewBody);
    }
    return listViewBody;
  }

  @protected
  Widget buildListViewBody(BuildContext context) {
    if (shouldBeSeparated) {
      return ListView.separated(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        separatorBuilder: buildSeparator,
        itemCount: itemCount + 1,
        itemBuilder: (context, index) {
          if (index >= itemCount) {
            return const Center(child: CircularProgressIndicator());
          }
          return buildListItem(context, index);
        },
      );
    }
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: itemCount + 1,
      itemBuilder: (context, index) {
        if (index >= itemCount) {
          return const Center(child: CircularProgressIndicator());
        }
        return buildListItem(context, index);
      },
    );
  }

  @protected
  Widget buildListItem(BuildContext context, int index);

  @protected
  Future<void> handleRefresh();

  @protected
  Widget buildSeparator(BuildContext context, int index) {
    return const SizedBox(height: 16);
  }

  @protected
  int get itemCount;

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    listModel.close();
    super.dispose();
  }
}
