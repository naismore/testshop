import 'package:flutter/cupertino.dart';

Widget buildCategoryContainer(String title, String? imageUrl) {
  return Column(
    children: [
      Container(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
          child: Image.network(imageUrl!)),
      Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
    ],
  );
}
