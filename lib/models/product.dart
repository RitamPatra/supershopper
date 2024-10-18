import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String image;

  @HiveField(4)
  final double price;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.price});

  factory Product.fromJson(Map<String, dynamic> productData) {
    return Product(
      id: productData["id"],
      title: productData["title"],
      description: productData["description"],
      image: productData["image"],
      price: productData["price"].toDouble(),
    );
  }
}
