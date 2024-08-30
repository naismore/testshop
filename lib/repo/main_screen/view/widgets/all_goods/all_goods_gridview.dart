import 'package:flutter/material.dart';
import 'package:flutter_app/repo/main_screen/view/widgets/all_goods/all_goods_tile.dart';

Widget buildAllGoodsGridView(BuildContext context) {
  return SliverGrid.builder(
    itemCount: 10,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 3.0,
      mainAxisSpacing: 3.0,
    ),
    itemBuilder: (context, index) {
      return buildAllGoodsTile(context);
    },
  );
}
