import 'package:dio/dio.dart';

class BaseApi {
  // TODO: Вынести в конфиг
  final String apiKey =
      'EyZ6DhtHN24DjRJofNZ7BijpNsAZ-TT1is4WbJb9DB7m83rNQCZ7US0LyUg5FCP4eoyUZXmM1z45hY5fIC-JTCgmqHgnfcevkQQpmxi8biwwlSn0zZedvlNh0QkP1-Um';
  final String apiUrlDomain = 'onlinestore.whitetigersoft.ru';

  late final Dio dio = Dio();

  Uri buildUri({
    required String relativePath,
    Map<String, dynamic>? queryParameters,
  }) {
    return Uri.http(
      apiUrlDomain,
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
    queryParameters['appKey'] = apiKey;
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
      print('Exception: $e');
      return [];
    }
  }
}
