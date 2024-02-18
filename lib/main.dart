import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tr_store/app/data/bindings/app_binder.dart';

import 'app/routes/app_pages.dart';

void main() {
  AppBinder().dependencies();
  runApp(
    GetMaterialApp(
      title: "TR Store",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
