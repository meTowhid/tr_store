import 'package:get/get.dart';
import 'package:tr_store/app/modules/products/product_model.dart';

class CartController extends GetxController {
  final itemIds = <int, int>{}.obs;
  final products = <int, Product>{};

  add(Product product) {
    final id = product.id!;
    products[id] = product;
    itemIds[id] = (itemIds[id] ?? 0) + 1;
  }

  remove(int id) {
    itemIds[id] = (itemIds[id] ?? 0) - 1;
    if (itemIds[id] == 0) {
      products.remove(id);
      itemIds.remove(id);
    }
  }
}