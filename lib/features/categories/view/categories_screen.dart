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

  @override
  void initState() {
    _loadCategory();
    super.initState();
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
      body: Center(child: _buildGrid(context),)

    );
  }

  Widget _buildGrid(BuildContext context) => GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(_categoriesList!.length, context));

  List<Widget> _buildGridTileList(int count,BuildContext context) =>
      List.generate(
        count,
            (i) => InkWell(
          onTap: ()=> Navigator.of(context).pushNamed('/goods-list'),
          child: Container(
            child: Text(_categoriesList![i].title, textAlign: TextAlign.center),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              image: DecorationImage(
                  alignment: Alignment.center,
                  image: NetworkImage(_categoriesList![i].imageUrl as String),
              ),
            ),
          ),
        ),
      );
      /*

      GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: _categoriesList!.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final category = _categoriesList![index];
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 20,
                color: Color(0xff6c5f5f),
                child: Text(category.title, textAlign: TextAlign.center),

              ),
            );
          }),


      body: GridView.builder(
        itemCount: categoriesList!.length,
        itemBuilder: (BuildContext context, int i) {
          return Image.asset(
              fit: BoxFit.cover,
              categoriesList![i].imageUrl ?? '');
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 16,
          mainAxisExtent: 16,
        ),
      ),

       */
      // GridView.count(
      //   primary: false,
      //   padding: const EdgeInsets.all(20),
      //   crossAxisSpacing: 10,
      //   mainAxisSpacing: 10,
      //   crossAxisCount: 2,
      //   children: <Widget>[
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.blue[100],
      //       child: const Text("Ноутбуки"),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.blue[100],
      //       child: const Text('Смартфоны'),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.blue[100],
      //       child: const Text('Телевизоры'),
      //     )
      //   ],
      // ),

      /*
      ListView.builder(

        itemCount: 10,
        itemBuilder: (context, i) => ListTile(
          title: Text('Laptop1', style: theme.textTheme.bodyMedium),
          subtitle: Text('1000\$', style: theme.textTheme.labelSmall),
        )
      */

  Future<void> _loadCategory() async {
    _categoriesList = await CategoryApi().GetCategoryList();
    setState(() {});
  }
}
