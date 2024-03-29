import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/app/modules/cart/widget/cart_item_tile.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cart = Get.find();

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Cart')),
      body: Obx(
        () {
          final ids = cart.itemIds.keys.toList();
          if (ids.isEmpty) return const Center(child: Text('Cart is empty'));
          return ListView.builder(
            itemCount: ids.length,
            itemBuilder: (_, i) {
              final id = ids[i];
              final p = cart.products[id]!;
              return CartItemTile(
                p,
                cart.itemIds[id].toString(),
                (isIncrement) {
                  if (isIncrement) {
                    cart.add(p);
                  } else {
                    cart.remove(id);
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
