import 'package:get/get.dart';
import 'package:tr_store/utils/api/endpoints.dart';

import '../product_model.dart';

class ProductProvider extends GetConnect {
  Future<List<Product>> getProducts() async {
    final response = await get(Endpoints.posts);
    final data = response.body;
    if (data is List) {
      return data.map((item) => Product.fromJson(item)).toList();
    }
    return [];
  }
}
