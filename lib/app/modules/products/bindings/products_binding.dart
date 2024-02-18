import 'package:get/get.dart';
import 'package:tr_store/app/modules/products/providers/product_provider.dart';

import '../controllers/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsController>(
      () => ProductsController(provider: ProductProvider()),
    );
  }
}
