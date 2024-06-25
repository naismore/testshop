import 'package:flutter/material.dart';

import '../../../models/Category.dart';
import '../../../models/CategoryApi.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreen();
}

class _CategoriesScreen extends State<CategoriesScreen> {
  List<Category>? categoriesList;

  @override
  void initState() {
    _loadCategory();
    super.initState();
  }

  Future<void> _loadCategory() async {
    categoriesList = await CategoryApi().GetCategoryList();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Категории'),
        leading: Icon(Icons.arrow_back),
      ),
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
    );
  }
}
