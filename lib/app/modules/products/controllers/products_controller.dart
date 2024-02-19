import 'package:get/get.dart';
import 'package:tr_store/app/data/db/db_helper.dart';
import 'package:tr_store/app/modules/products/product_model.dart';
import 'package:tr_store/app/modules/products/providers/product_provider.dart';

class ProductsController extends GetxController {
  ProductsController({required this.provider});

  final ProductProvider provider;
  final products = <Product>[].obs;

  // late final productBox = Hive.box<Product>(AppConstants.productBox);
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  Future<void> loadProducts() async {
    isLoading.value = true;
    final res = await provider.getProducts();
    final db = DatabaseHelper.instance;
    if (res == null || res.isEmpty) {
      // products.addAll(productBox.values);
      final productsFromDB = await db.getProducts();
      products.value = productsFromDB;
    } else {
      products.value = res;
      // productBox.clear();
      // productBox.addAll(products);
      res.forEach((p) async => await db.add(p));
    }
    isLoading.value = false;
  }
}
