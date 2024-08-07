import 'package:flutter_1/abstract/base_api_response.dart';
import 'package:flutter_1/models/api_response.dart';

class ApiResponseParser {
  static Future<ApiResponse<List<T>>> parseListFromResponse<T>(
    BaseApiResponse response, {
    required String key,
    required T Function(Map<String, dynamic>) fromJson,
    String? emptyError,
  }) async {
    try {
      final data = response.rawData;
      ApiResponse(baseApiResponse: response).result =
          (data as List).map((e) => fromJson(e)).toList();
      return ApiResponse(baseApiResponse: response).result;
    } catch (e) {
      return ApiResponse.error(error: e.toString(), baseApiResponse: response);
    }
  }

  static ApiResponse<T> parseObjectFromResponse<T>(
    BaseApiResponse response, {
    required T Function(Map<String, dynamic>) fromJson,
    String? key,
    String? emptyError,
  }) {
    return ApiResponse(baseApiResponse: response);
  }
}
