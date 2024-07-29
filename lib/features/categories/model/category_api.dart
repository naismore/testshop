import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';


import '../../../models/base_api.dart';
import 'category.dart';

class CategoryApi{
  CategoryApi({
    required this.dio
  });

  final Dio dio;

  Future<List<Category>?> getCategoryList() async {
    try {
      final response = await BaseApi().sendGetRequest('api/common/category/list') as Map<String, dynamic>;
      final data = response['categories'] as List<dynamic>;
      List<Category> categoriesList = data.map((item) => Category.fromJson(item)).toList();
      return categoriesList;
    } catch (e) {
      GetIt.I<Logger>().e('Error log', error: e);
      return <Category>[];
    }
  }
}
