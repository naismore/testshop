import 'package:flutter/material.dart';

import '../../../models/Category.dart';
import '../../../models/CategoryApi.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreen();
}

class _CategoriesScreen extends State<CategoriesScreen> {
  List<Category>? _categoriesList;
  Future<List<Category>?>? _categoriesFuture;

  @override

  void initState() {
    super.initState();
    _categoriesFuture = _loadCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Text('Категории'),
          leading: Icon(Icons.arrow_back),
        ),
      body: Center(

        child: FutureBuilder(

          future: _loadCategory(),

          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.done) {

              if (snapshot.hasData) {

                _categoriesList = snapshot.data as List<Category>?;

                return _buildGrid(context);

              } else {

                return Text('Ошибка загрузки категорий');

              }

            } else {

              return CircularProgressIndicator();

            }

          },

        ),

      ),

    );
  }

  Widget _buildGrid(BuildContext context) => GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(_categoriesList!.length, context));

  List<Widget> _buildGridTileList(int count, BuildContext context) =>
      List.generate(
        count,
            (i) => InkWell(
          onTap: ()=> Navigator.of(context).pushNamed(
              '/goods-list',
              arguments: _categoriesList![i].id,
          ),
          child: Container(
            child: Text(_categoriesList![i].title, textAlign: TextAlign.center),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              image: DecorationImage(
                  alignment: Alignment.center,
                  image: _categoriesList![i].imageUrl != null
                      ? NetworkImage(_categoriesList![i].imageUrl!)
                      : NetworkImage('https://via.placeholder.com/200')
                  ),
              ),
            ),
          ),
        );

  Future<List<Category>?> _loadCategory() async {
    return await CategoryApi().GetCategoryList();
  }
}
