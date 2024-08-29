import 'package:flutter/material.dart';

Widget buildAllGoodsTextBlock(BuildContext context) {
  return Center(
    heightFactor: 1.2,
    child: Container(
      height: 50,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: const Center(
        child: Text(
          'Все товары',
          style: TextStyle(fontSize: 27),
        ),
      ),
    ),
  );
}
