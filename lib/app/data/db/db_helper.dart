import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tr_store/app/data/constants/constants.dart';
import 'package:tr_store/app/modules/products/product_model.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, AppConstants.appDB);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    print('..CREATING TABLE..');
    await db.execute('''
      CREATE TABLE products(
          id INTEGER PRIMARY KEY,
          title TEXT,
          content TEXT,
          image TEXT,
          thumbnail TEXT,
          category TEXT
      )
      ''');
  }

  Future<Product?> getProduct(int id) async {
    Database db = await instance.database;
    final product =
        await db.query('products', where: 'id = ?', whereArgs: [id]);
    if (product.isEmpty) return null;
    return Product.fromJson(product.first);
  }

  Future<List<Product>> getProducts() async {
    Database db = await instance.database;
    final products = await db.query('products');
    return products.map((c) => Product.fromJson(c)).toList();
  }

  Future<int> add(Product product) async {
    Database db = await instance.database;
    return await db.insert('products', product.toJson());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Product product) async {
    Database db = await instance.database;
    return await db.update(
      'products',
      product.toJson(),
      where: "id = ?",
      whereArgs: [product.id],
    );
  }

  Future close() async {
    Database db = await instance.database;
    if (db.isOpen) db.close();
  }
}
