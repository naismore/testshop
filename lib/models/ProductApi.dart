import 'package:dio/dio.dart';

import 'Product.dart';

class ProductApi {
  Future<List<Product>> GetProductList() async {
    final response = await Dio().get(
        'http://onlinestore.whitetigersoft.ru/api/common/product/list?appKey=EyZ6DhtHN24DjRJofNZ7BijpNsAZ-TT1is4WbJb9DB7m83rNQCZ7US0LyUg5FCP4eoyUZXmM1z45hY5fIC-JTCgmqHgnfcevkQQpmxi8biwwlSn0zZedvlNh0QkP1-Um');
    final data = response.data['data'] as List;
    print(data.toString());

    return data.map((productJson) {
      print(productJson.toString());
      return Product.fromJson(productJson as Map<String, dynamic>);
    }).toList();
  }

  Future<List<Product>> GetProductListByCategory(final int categoryId) async {
    final response = await Dio().get(
        'http://onlinestore.whitetigersoft.ru/api/common/product/list?categoryId=${categoryId}&appKey=EyZ6DhtHN24DjRJofNZ7BijpNsAZ-TT1is4WbJb9DB7m83rNQCZ7US0LyUg5FCP4eoyUZXmM1z45hY5fIC-JTCgmqHgnfcevkQQpmxi8biwwlSn0zZedvlNh0QkP1-Um'
    );
    final data = response.data['data'] as List;
    print(data.toString());

    return data.map((productJson) {
      print(productJson.toString());
      return Product.fromJson(productJson as Map<String, dynamic>);
    }).toList();
  }
}
