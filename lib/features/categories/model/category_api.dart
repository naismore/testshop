import 'package:dio/dio.dart';
import 'package:flutter_1/models/api_response.dart';
import 'package:flutter_1/models/api_response_parser.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../../models/base_api.dart';
import 'category.dart';

class CategoryApi {
  CategoryApi({required this.dio});

  final Dio dio;

  Future<ApiResponse<List<Category>>> getCategoryList() async {
    final response = await BaseApi().sendGetRequest('api/common/category/list');

    return ApiResponseParser.parseListFromResponse(response,
        key: 'categories',
        fromJson: Category.fromJson,
        emptyError: 'Не удалось получить данные');
  }
}
