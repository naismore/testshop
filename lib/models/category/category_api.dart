import 'package:flutter_app/models/api/api_response.dart';
import 'package:flutter_app/models/api/api_response_parser.dart';
import 'package:flutter_app/models/api/base_api.dart';
import 'category.dart';

class CategoryApi {
  CategoryApi();
  Future<ApiResponse<List<Category>>> getCategoryList() async {
    final response = await BaseApi().sendGetRequest('api/common/category/list');

    return ApiResponseParser.parseListFromResponse(response,
        key: 'categories',
        fromJson: Category.fromJson,
        emptyError: 'Не удалось получить данные');
  }
}
