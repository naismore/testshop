class BaseApiResponse {
  String? rawData;
  String? error;
  dynamic dataJson;

  BaseApiResponse({
    this.rawData,
    this.error,
    this.dataJson,
  });

  bool get isError => error?.isNotEmpty ?? false;
}