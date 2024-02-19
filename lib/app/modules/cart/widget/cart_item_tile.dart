import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tr_store/app/modules/products/product_model.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile(this.p, this.count, this.onUpdate, {super.key});

  final Product p;
  final String count;
  final void Function(bool isIncrement) onUpdate;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(p.title!, maxLines: 2),
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
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline_rounded),
            onPressed: () => onUpdate(true),
          ),
          Text(
            count,
            style: const TextStyle(fontSize: 18),
          ),
          IconButton(
            icon: const Icon(Icons.remove_circle_outline_rounded),
            onPressed: () => onUpdate(false),
          ),
        ],
      ),
    );
  }
}
