import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/screens/prod_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product.dart';
import '../util/fetch.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  ShoppingPageState createState() => ShoppingPageState();
}

class ShoppingPageState extends State<ShoppingPage> {
  late Future<List<Product>> futureProducts;
  final CartController cartController = Get.find();

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Trending Products",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: futureProducts,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Product> products = snapshot.data!;
                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: products[index]);
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetails(product: product));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: Image.network(product.image, width: 50, height: 50),
          title: Text(product.title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          subtitle:
              Text("\$${product.price}", style: const TextStyle(fontSize: 16)),
          trailing: IconButton(
            icon: const Icon(Icons.add_shopping_cart, color: Colors.blue),
            onPressed: () {
              cartController.addToCart(product); // Add to cart
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("${product.title} added to cart"),
                duration: const Duration(seconds: 2),
              ));
            },
          ),
        ),
      ),
    );
  }
}
