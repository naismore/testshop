import 'package:flutter/material.dart';
import 'package:flutter_app/repo/main_screen/view/widgets/all_goods/all_goods_gridview.dart';

Widget buildAllGoodsBlock(BuildContext context) {
  return Expanded(child: buildAllGoodsGridView(context));
}
