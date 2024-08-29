import 'package:dio/dio.dart';
import 'package:flutter_app/abstract/base_api_response.dart';
import 'package:flutter_app/models/api/api_response_meta.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:flutter_app/config.dart';

class BaseApi {
  late final Dio dio = Dio();

  Uri buildUri({
    required String relativePath,
    Map<String, dynamic>? queryParameters,
  }) {
    return Uri.http(
      Config.apiUrlDomain,
      relativePath,
      queryParameters,
    );
  }

  Future<dynamic> sendGetRequest(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    var uri = buildUri(
      relativePath: path,
      queryParameters: queryParameters,
    );
    queryParameters ??= {};
    queryParameters['appKey'] = Config.apiKey;
    try {
      final response = await dio.get(
        uri.toString(),
        queryParameters: queryParameters,
      );
      final responseData = response.data;

      final responseMeta = responseData['meta'];
      final responseRawData = responseData['data'];

      final apiResponseMeta = ApiResponseMeta.fromJson(responseMeta);

      if (apiResponseMeta.success) {
        return BaseApiResponse(
          meta: apiResponseMeta,
          error: apiResponseMeta.error,
          rawData: responseRawData.toString(),
        );
      }
      return [];
    } catch (e) {
      GetIt.I<Logger>().e('Error log', error: e);
      return [];
    }
  }
}
