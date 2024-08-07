import 'package:flutter_1/models/api_response_meta.dart';

abstract class BaseApiResponse {
  ApiResponseMeta? meta;
  String? rawData;
  String? error;
  dynamic dataJson;

  BaseApiResponse({
    this.meta,
    this.rawData,
    this.error,
    this.dataJson,
  });

  bool get isError => error?.isNotEmpty ?? false;
}
