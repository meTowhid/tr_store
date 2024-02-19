import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tr_store/app/data/bindings/app_binder.dart';
import 'package:tr_store/app/data/constants/constants.dart';
import 'package:tr_store/app/data/db/db_helper.dart';
import 'package:tr_store/app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  AppBinder().dependencies();
  runApp(const TRStoreApp());
}

Future<void> initHive() async {
  final appDir = await getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  await Hive.openBox<int>(AppConstants.cartBox);
}

class TRStoreApp extends StatefulWidget {
  const TRStoreApp({super.key});

  @override
  State<TRStoreApp> createState() => _TRStoreAppState();
}

class _TRStoreAppState extends State<TRStoreApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "TR Store",
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    );
  }

  @override
  void dispose() {
    super.dispose();
    DatabaseHelper.instance.close();
  }
}
