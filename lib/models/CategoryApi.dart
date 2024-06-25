import 'dart:convert';
import 'package:dio/dio.dart';

import 'Category.dart';

class CategoryApi {
  Future<List<Category>> GetCategoryList() async {
    final response = await Dio().get(
        'http://onlinestore.whitetigersoft.ru/api/common/category/list?appKey=EyZ6DhtHN24DjRJofNZ7BijpNsAZ-TT1is4WbJb9DB7m83rNQCZ7US0LyUg5FCP4eoyUZXmM1z45hY5fIC-JTCgmqHgnfcevkQQpmxi8biwwlSn0zZedvlNh0QkP1-Um');
    final data = response.data['data']['categories'] as List;
    print(data.toString());

    return data.map((categoryJson) {
      print(categoryJson.toString());
      return Category.fromJson(categoryJson as Map<String, dynamic>);
    }).toList();
  }
}
