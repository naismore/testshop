import 'package:dio/dio.dart';

import '../../../models/base_api.dart';
import 'product.dart';

class ProductApi {
  ProductApi({
    required this.dio
  });

  final Dio dio;

  Future<List<Product>> getProductList() async {
    final response = await BaseApi().sendGetRequest(
        'api/common/product/list') as List<dynamic>;
    List<Product> productsList = response.map((item) => Product.fromJson(item)).toList();
    return productsList;
  }

  Future<List<Product>> getProductListByCategory(int categoryId) async {
    Map<String, dynamic>? queryParams;
    queryParams?['categoryId'] = categoryId;
    final response = await BaseApi().sendGetRequest(
        'api/common/product/list', queryParameters: queryParams) as List<dynamic>;
    final productsList = response.map((item) => Product.fromJson(item)).toList();
    return productsList;
  }
}
