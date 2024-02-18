import 'package:get/get.dart';
import 'package:tr_store/app/modules/cart/controllers/cart_controller.dart';

class AppBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
  }
}
