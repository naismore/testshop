import 'package:flutter/material.dart';

Widget buildGoodsContainer(BuildContext context) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
        child: Image.network(
            'http://onlinestore.whitetigersoft.ru/uploads/product-icons/m94306jsQo0kjLM4s2rdLPath96Ysl7D.jpg'),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
        child: const Text(
          '14" Ультрабук MSI Modern 14 C12M-233XRU черный',
          style: TextStyle(fontSize: 20),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      const Text(
        'Цена: 15000',
        style: TextStyle(fontSize: 14),
      )
    ],
  );
}
