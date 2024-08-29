import 'package:flutter/material.dart';
import 'package:flutter_app/abstract/bloc/base_bloc_state.dart';
import 'categories_tile.dart';

Widget buildCategoriesGridView(BuildContext context, DataFoundState state) {
  return GridView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: state.data.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1,
      crossAxisSpacing: 6.0,
      mainAxisSpacing: 6.0,
    ),
    padding: const EdgeInsets.all(10.0),
    itemBuilder: (context, index) {
      final category = state.data[index];
      return buildCategoriesTile(context, category);
    },
  );
}
