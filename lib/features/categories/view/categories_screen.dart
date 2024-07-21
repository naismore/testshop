import 'package:flutter/material.dart';

import '../model/category.dart';
import '../model/category_api.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreen();
}

class _CategoriesScreen extends State<CategoriesScreen> {
  List<Category>? _categoriesList;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Категории'),
        leading: const Icon(Icons.arrow_back),
      ),
      body: Center(
        child: FutureBuilder(
            future: _loadCategory(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  _categoriesList = snapshot.data;
                  return GridView.extent(
                      maxCrossAxisExtent: 150,
                      padding: const EdgeInsets.all(4),
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      children:
                          _buildGridTileList(_categoriesList!.length, context));
                } else {
                  return const Text(
                      'Ошибка загрузки категории');
                }
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }

  List<Widget> _buildGridTileList(
          final int count, final BuildContext context) =>
      List.generate(
        count,
        (i) => InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            '/goods-list',
            arguments: _categoriesList![i].id,
          ),
          child: Container(
            child:
                Text(_categoriesList![i].title!, textAlign: TextAlign.center),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              image: DecorationImage(
                  alignment: Alignment.center,
                  image: _categoriesList![i].imageUrl != null
                      ? NetworkImage(_categoriesList![i].imageUrl!)
                      : const NetworkImage('https://via.placeholder.com/200')),
            ),
          ),
        ),
      );

  Future<List<Category>?> _loadCategory() async {
    return await CategoryApi().GetCategoryList();
  }
}
