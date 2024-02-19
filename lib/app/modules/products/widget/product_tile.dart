import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/app/modules/cart/controllers/cart_controller.dart';
import 'package:tr_store/app/modules/products/product_model.dart';
import 'package:tr_store/app/routes/app_pages.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(this.p, {super.key});

  final Product p;

  @override
  Widget build(BuildContext context) {
    final CartController cart = Get.find();

    return ListTile(
      title: Text(p.title!, maxLines: 1),
      subtitle: Text(p.category!),
      leading: AspectRatio(
        aspectRatio: 1,
        child: CachedNetworkImage(
          imageUrl: p.thumbnail ?? '',
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error),
          ),
        ),
      ),
      onTap: () => Get.toNamed(Routes.DETAILS, arguments: p),
      trailing: IconButton(
        icon: Obx(
          () => cart.itemIds[p.id] != null
              ? const Icon(Icons.check_circle_outline, color: Colors.green)
              : const Icon(Icons.add),
        ),
        onPressed: () =>
            cart.itemIds[p.id] != null ? cart.remove(p.id!) : cart.add(p),
      ),
    );
  }
}
