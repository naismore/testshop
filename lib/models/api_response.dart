import 'package:flutter_1/abstract/base_api_response.dart';

class ApiResponse<T> extends BaseApiResponse {
  T? result;

  ApiResponse({
    required BaseApiResponse baseApiResponse,
    this.result,
  }) : super(
          meta: baseApiResponse.meta,
          rawData: baseApiResponse.rawData,
          dataJson: baseApiResponse.dataJson,
          error: baseApiResponse.error,
        );
  ApiResponse.error({
    required String error,
    required BaseApiResponse baseApiResponse,
  }) : super(
          meta: baseApiResponse.meta,
          rawData: baseApiResponse.rawData,
          error: error,
        );
}
