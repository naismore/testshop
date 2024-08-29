import 'package:flutter/material.dart';
import 'package:flutter_app/abstract/base_page.dart';
import 'package:flutter_app/models/category/category_api.dart';
import 'package:flutter_app/repo/main_screen/bloc/category_bloc.dart';
import 'package:flutter_app/repo/main_screen/bloc/category_event.dart';
import 'package:flutter_app/repo/main_screen/view/widgets/all_goods/all_goods_block.dart';
import 'package:flutter_app/repo/main_screen/view/widgets/all_goods/all_goods_textbloc.dart';
import 'package:flutter_app/repo/main_screen/view/widgets/categories/categories_block.dart';
import 'package:get_it/get_it.dart';

class MainScreen extends BasePage {
  const MainScreen({super.key}) : super(title: 'Категории');

  @override
  State<MainScreen> createState() => _MainScreenState();
}

// TODO: MainBloc добавить, вынести в него CategoryBloc и ProductListBloc. В MainBloc грузить оба блока
// TODO: main_screen вынести в отдульный модули продукты и категории
// TODO: избавиться от лишнего вынесения
class _MainScreenState extends BasePageState<MainScreen> {
  final _categoryBloc = CategoryBloc(GetIt.I<CategoryApi>());

  @override
  void initState() {
    super.initState();
    _categoryBloc.add(LoadCategory());
  }

  @override
  Widget buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: buildCategoriesBlock(context, _categoryBloc),
        ),
        SliverToBoxAdapter(
          child: buildAllGoodsTextBlock(context),
        ),
        buildAllGoodsBlock(context)
      ],
    );
  }
}
