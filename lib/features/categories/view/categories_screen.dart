import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    _categoriesBloc.add(LoadCategories());
  }

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
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
          child: BlocBuilder<CategoriesBloc, CategoriesState>(
            bloc: _categoriesBloc,
            builder: (context, state) {
              if (state is CategoryLoaded) {
                return _buildGridView(state, context);
              }
              if (state is CategoryLoadingFailure) {
                return const Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong',
                    ),
                  ],
                ));
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }

  @override
  Widget buildBody(BuildContext context, CategoryLoaded state) {
    return _buildGridView(state, context);
  }
}
