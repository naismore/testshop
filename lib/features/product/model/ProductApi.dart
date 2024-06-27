import 'package:dio/dio.dart';

import '../../../models/BaseApi.dart';
import 'Product.dart';

class ProductApi {
  Future<List<Product>> GetProductList() async {
    final response = await Dio().get(
        '${BaseApi().baseApiPath}/common/product/list?appKey=${BaseApi().apiKey}');
    final data = response.data['data'] as List;
    print(data.toString());

    return data.map((productJson) {
      print(productJson.toString());
      return Product.fromJson(productJson as Map<String, dynamic>);
    }).toList();
  }

  Future<List<Product>> GetProductListByCategory(final int categoryId) async {
    final response = await Dio().get(
        '${BaseApi().baseApiPath}common/product/list?categoryId=${categoryId}&appKey=${BaseApi().apiKey}');
    final data = response.data['data'] as List;
    print(data.toString());

    return data.map((productJson) {
      print(productJson.toString());
      return Product.fromJson(productJson as Map<String, dynamic>);
    }).toList();
  }
}
