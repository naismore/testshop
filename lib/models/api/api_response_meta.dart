import 'package:json_annotation/json_annotation.dart';

part 'api_response_meta.g.dart';

@JsonSerializable()
class ApiResponseMeta {
  bool success;
  String? error;

  factory ApiResponseMeta.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseMetaFromJson(json);

  ApiResponseMeta({required this.success, this.error});
}
