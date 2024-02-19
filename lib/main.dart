import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tr_store/app/data/bindings/app_binder.dart';
import 'package:tr_store/app/data/constants/constants.dart';
import 'package:tr_store/app/modules/products/product_model.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  AppBinder().dependencies();
  runApp(
    GetMaterialApp(
      title: "TR Store",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> initHive() async {
  final appDir = await getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  Hive.registerAdapter(ProductAdapter());
  await Hive.openBox<int>(AppConstants.cartBox);
  await Hive.openBox<Product>(AppConstants.productBox);
}
