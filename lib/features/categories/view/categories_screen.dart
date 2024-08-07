import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_1/abstract/bloc/base_bloc.dart';
import 'package:flutter_1/abstract/bloc/base_bloc_builder.dart';
import 'package:flutter_1/features/categories/model/category.dart';
import 'package:get_it/get_it.dart';

import '../bloc/categories_bloc.dart';
import '../categories_routes.dart';
import '../model/category_api.dart';

part '../widgets/grid_view_tile.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreen();
}

class _CategoriesScreen extends State<CategoriesScreen> {
  final CategoriesBloc _categoriesBloc = CategoriesBloc(GetIt.I<CategoryApi>());

  @override
  void initState() {
    super.initState();
    _categoriesBloc.add(LoadCategories());
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Категории'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _categoriesBloc.add(LoadCategories(completer: completer));
          return completer.future;
        },
        child: BaseBlocBuilder<CategoriesBloc, List<Category>>(
            bloc: _categoriesBloc,
            buildContent: (context, state) {
              var category = state.data?[index];
              return _buildGridView(context, state, category);
            },
            onLoadingFailurePressed: () =>
                _categoriesBloc.add(LoadCategories())),
      ),
    );
  }
}
