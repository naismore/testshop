import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/abstract/bloc/base_bloc_builder.dart';
import 'package:flutter_app/repo/main_screen/bloc/category_bloc.dart';
import 'package:flutter_app/repo/main_screen/bloc/category_event.dart';
import 'package:flutter_app/repo/main_screen/view/widgets/categories/categories_gridview.dart';

Widget buildCategoriesBlock(BuildContext context, dynamic categoryBloc) {
  return SizedBox(
    height: 200,
    child: BaseBlocBuilder<CategoryBloc, List<Category>>(
      bloc: categoryBloc,
      buildContent: (context, state) {
        return buildCategoriesGridView(context, state);
      },
      onLoadingFailurePressed: () => categoryBloc.add(LoadCategory()),
    ),
  );
}
