import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/features/product/model/product_api.dart';
import 'package:get_it/get_it.dart';
import 'features/categories/model/category_api.dart';
import 'shop_app.dart';

void main() {
  GetIt.I.registerLazySingleton(() => CategoryApi(dio: Dio()));
  GetIt.I.registerLazySingleton(() => ProductApi(dio: Dio()));
  runApp(const ShopApp());
}
