import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:tr_store/app/data/constants/constants.dart';
import 'package:tr_store/app/modules/products/product_model.dart';
import 'package:tr_store/app/modules/products/providers/product_provider.dart';

class ProductsController extends GetxController {
  ProductsController({required this.provider});

  final ProductProvider provider;
  final products = <Product>[].obs;
  late final productBox = Hive.box<Product>(AppConstants.productBox);
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  Future<void> loadProducts() async {
    isLoading.value = true;
    final res = await provider.getProducts();
    if (res == null || res.isEmpty) {
      products.addAll(productBox.values);
    } else {
      products.value = res;
      productBox.clear();
      productBox.addAll(products);
    }
    isLoading.value = false;
  }
}
