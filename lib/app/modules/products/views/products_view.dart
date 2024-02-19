import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/app/modules/products/widget/product_tile.dart';
import 'package:tr_store/app/routes/app_pages.dart';

import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Products'),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'cart',
        onPressed: () => Get.toNamed(Routes.CART),
        child: const Icon(Icons.shopping_cart),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (_, i) => ProductTile(controller.products[i]),
        ),
      ),
    );
  }
}
