import 'package:flutter/material.dart';
import 'package:flutter_app/models/category/category_api.dart';
import 'package:flutter_app/models/product/product_api.dart';
import 'package:flutter_app/testshop_app.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

void main() {
  var logger = Logger();
  GetIt.I.registerSingleton(logger);
  GetIt.I.registerLazySingleton(() => CategoryApi());
  GetIt.I.registerLazySingleton(() => ProductApi());
  runApp(const TestShop());
}
