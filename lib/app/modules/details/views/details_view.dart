import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/app/modules/cart/controllers/cart_controller.dart';
import 'package:tr_store/app/modules/products/product_model.dart';
import 'package:tr_store/app/routes/app_pages.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cart = Get.find();
    final p = Get.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Details'),
      ),
      floatingActionButton: Obx(
        () => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: 'cart-add-remove',
              onPressed: () =>
                  cart.contains(p) ? cart.remove(p.id!) : cart.add(p),
              child: cart.contains(p)
                  ? const Icon(Icons.check_circle_outline, color: Colors.green)
                  : const Icon(Icons.add),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              heroTag: 'cart',
              onPressed: () => Get.toNamed(Routes.CART),
              child: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(p.image ?? ''),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                p.title ?? '',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(p.content ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
