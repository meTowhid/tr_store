import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:tr_store/app/data/constants/constants.dart';
import 'package:tr_store/app/modules/products/product_model.dart';

class CartController extends GetxController {
  final itemIds = <int, int>{}.obs;
  final products = <int, Product>{};
  late final cartBox = Hive.box<int>(AppConstants.cartBox);
  late final productBox = Hive.box<Product>(AppConstants.productBox);

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  void loadCart() {
    for (var id in cartBox.keys) {
      itemIds[id] = cartBox.get(id) ?? 0;
    }
    for (final p in productBox.values) {
      final id = p.id!;
      if (itemIds[id] != null) products[id] = p;
    }
  }

  bool contains(Product p) => itemIds[p.id] != null;

  void add(Product product) {
    final id = product.id!;
    products[id] = product;
    itemIds[id] = (itemIds[id] ?? 0) + 1;
    cartBox.put(id, itemIds[id]!);
  }

  void remove(int id) {
    itemIds[id] = (itemIds[id] ?? 0) - 1;
    cartBox.put(id, itemIds[id]!);
    if (itemIds[id] == 0) {
      products.remove(id);
      itemIds.remove(id);
      cartBox.delete(id);
    }
  }
}
