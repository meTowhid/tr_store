import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/app/modules/cart/controllers/cart_controller.dart';
import 'package:tr_store/app/modules/products/product_model.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile(this.p, {super.key});

  final Product p;

  @override
  Widget build(BuildContext context) {
    final CartController cart = Get.find();

    return ListTile(
      title: Text(p.title!, maxLines: 2),
      leading: AspectRatio(
        aspectRatio: 1,
        child: Image.network(p.image ?? '', fit: BoxFit.cover),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline_rounded),
            onPressed: () => cart.add(p),
          ),
          Obx(
            () => Text(
              '${cart.itemIds[p.id!]}',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.remove_circle_outline_rounded),
            onPressed: () => cart.remove(p.id!),
          ),
        ],
      ),
    );
  }
}
