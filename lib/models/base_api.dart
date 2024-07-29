import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import '../config.dart';

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
      final responseData = response.data as Map<String, dynamic>;
      if (responseData['meta']['success']) {
        final data = responseData['data'];
        return data;
      }
      return [];
    } catch (e) {
      GetIt.I<Logger>().e('Error log', error: e);
      return [];
    }
  }
}
