import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/categories_bloc.dart';
import '../categories_routes.dart';
import '../model/category.dart';
import '../model/category_api.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreen();
}

class _CategoriesScreen extends State<CategoriesScreen> {
  final _categoriesBloc = CategoriesBloc(GetIt.I<CategoryApi>());

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
            if (state is CategoryLoaded){
              return GridView.extent(
                  maxCrossAxisExtent: 150,
                  padding: const EdgeInsets.all(4),
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children:
                  List.generate(
                    state.categoriesList!.length,
                        (i) => InkWell(
                      onTap: () => Navigator.of(context)
                          .push(CategoriesRoutes.goodsListRoute(state.categoriesList![i].id)),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                              alignment: Alignment.center,
                              image: state.categoriesList![i].imageUrl != null
                                  ? NetworkImage(state.categoriesList![i].imageUrl!)
                                  : const NetworkImage('https://via.placeholder.com/200')),
                        ),
                        child:
                        Text(state.categoriesList![i].title, textAlign: TextAlign.center),
                      ),
                    ),
                  )
              );
            }
            if(state is CategoryLoadingFailure)
            {
              return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Something went wrong',
                      ),
                    ],
                  )
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      )
    );
  }
}
