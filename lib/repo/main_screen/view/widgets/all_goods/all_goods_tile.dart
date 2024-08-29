import 'package:flutter/material.dart';
import 'package:flutter_app/repo/main_screen/view/widgets/all_goods/goods_container.dart';

Widget buildAllGoodsTile(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    child: buildGoodsContainer(context),
  );
}
