import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/app/modules/cart/controllers/cart_controller.dart';
import 'package:tr_store/app/modules/products/product_model.dart';
import 'package:tr_store/app/routes/app_pages.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(this.p, this.cart, {super.key});

  final CartController cart;
  final Product p;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(p.title!, maxLines: 1),
      subtitle: Text(p.category!),
      leading: AspectRatio(
        aspectRatio: 1,
        child: Image.network(p.image ?? '', fit: BoxFit.cover),
      ),
      onTap: () => Get.toNamed(Routes.DETAILS, arguments: p),
      trailing: IconButton(
        icon: Obx(
          () => cart.itemIds[p.id] != null
              ? const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                )
              : const Icon(Icons.add),
        ),
        onPressed: () =>
            cart.itemIds[p.id] != null ? cart.remove(p.id!) : cart.add(p),
      ),
    );
  }
}
