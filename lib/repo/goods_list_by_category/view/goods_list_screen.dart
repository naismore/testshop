import 'package:flutter/material.dart';
import 'package:flutter_app/abstract/base_list_view_page.dart';
import 'package:flutter_app/abstract/base_page.dart';
import 'package:flutter_app/models/category/category.dart';

class GoodsListScreen extends BasePage {
  GoodsListScreen({super.key, required this.category})
      : super(title: category.title);

  final Category category;

  @override
  State<GoodsListScreen> createState() => _GoodsListScreenState();
}

class _GoodsListScreenState
    extends BaseListViewPageState<GoodsListScreen, GoodsListScreenBloc> {
  @override 
  bool get shouldBeSeparated => !super.shouldBeSeparated;
  
  @override
  bool get shouldBeRefreshable => !super.shouldBeRefreshable;

  @override
  ProductListBloc createModel() => ProductListBloc(GetIt.I<>);

  @override
  Widget buildBody(BuildContext context) {
    return const Scaffold();
  }
}
