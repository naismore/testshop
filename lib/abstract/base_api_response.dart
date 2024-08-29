import 'package:flutter_app/models/api/api_response_meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_api_response.g.dart';

@JsonSerializable()
class BaseApiResponse {
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

  factory BaseApiResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseApiResponseFromJson(json);

  bool get isError => error?.isNotEmpty ?? false;
}
