import 'package:get/get.dart';
import 'package:tr_store/app/modules/products/product_model.dart';
import 'package:tr_store/app/modules/products/providers/product_provider.dart';

class ProductsController extends GetxController {
  ProductsController({required this.provider});

  final ProductProvider provider;
  final products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() async {
    products.value = await provider.getProducts();
  }
}
