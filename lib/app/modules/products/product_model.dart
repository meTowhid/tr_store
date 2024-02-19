import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? content;
  @HiveField(3)
  String? image;
  @HiveField(4)
  String? thumbnail;
  @HiveField(5)
  String? category;

  Product({
    this.id,
    this.title,
    this.content,
    this.image,
    this.thumbnail,
    this.category,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['image'] = image;
    data['thumbnail'] = thumbnail;
    data['category'] = category;
    return data;
  }

  @override
  String toString() {
    return 'Product{id: $id'
        // ' ,title: $title'
        '}';
  }
}
