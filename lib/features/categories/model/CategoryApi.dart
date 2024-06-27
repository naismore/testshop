import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../models/BaseApi.dart';

import 'Category.dart';

class CategoryApi {
  Future<List<Category>?> GetCategoryList() async {
    final response = await Dio().get(
        '${BaseApi().baseApiPath}common/category/list?appKey=${BaseApi().apiKey}');
    if (response != null) {
      if (response.statusCode == 200) {
        final data = response.data['data']['categories'] as List?;
        if (data != null) {
          return data.map((categoryJson) {
            print(categoryJson.toString());
            return Category.fromJson(categoryJson as Map<String, dynamic>);
          }).toList();
        } else {
          return null;
        }
      } else {
        print('Ошибка: ${response.statusCode}');
        return null;
      }
    } else {
      print('Ошибка: Нет ответа');
      return null;
    }
  }
}
