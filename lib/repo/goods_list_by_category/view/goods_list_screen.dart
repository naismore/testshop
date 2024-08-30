import 'package:flutter/material.dart';
import 'package:flutter_app/abstract/base_list_view_page.dart';
import 'package:flutter_app/models/category/category.dart';
import 'package:flutter_app/repo/goods_list_by_category/bloc/goods_list_screen.dart';

class GoodsListScreen extends BaseListViewPage {
  GoodsListScreen({
    super.key,
    required this.category,
  }) : super(title: category.title);

  final Category category;

  @override
  State<GoodsListScreen> createState() => _GoodsListScreenState();
}

class _GoodsListScreenState
    extends BaseListViewPageState<GoodsListScreen, GoodsListScreenBloc> {
  // TODO: лучше указать явно false|true
  @override
  bool get shouldBeSeparated => !super.shouldBeSeparated;

  @override
  bool get shouldBeRefreshable => !super.shouldBeRefreshable;

  @override
  Widget buildBody(BuildContext context) {
    return const Scaffold();
  }

  @override
  Widget buildListItem(BuildContext context, int index) {
    throw UnimplementedError();
  }

  @override
  createModel() {
    throw UnimplementedError();
  }

  @override
  Future<void> handleRefresh() {
    throw UnimplementedError();
  }

  @override
  int get itemCount => throw UnimplementedError();

  @override
  void loadMore() {}
}
