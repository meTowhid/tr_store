import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/app/modules/products/product_model.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = Get.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Details'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.find().addToCart(p),
        child: const Icon(Icons.shopping_cart),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(p.image ?? ''),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                p.title ?? '',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
