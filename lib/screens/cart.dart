import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (cartController.cartItems.isEmpty) {
                return const Center(child: Text("The cart is empty!"));
              }
              return ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final product = cartController.cartItems[index];
                  return ListTile(
                    leading:
                        Image.network(product.image, width: 50, height: 50),
                    title: Text(product.title),
                    subtitle: Text("\$${product.price.toString()}"),
                    trailing: IconButton(
                        onPressed: () {
                          cartController.removeFromCart(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("${product.title} removed from cart"),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        icon: const Icon(Icons.delete, color: Colors.red)),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => Text("Total: \$${cartController.totalPrice}",
                style: const TextStyle(fontSize: 20))),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.snackbar(
                    "Thanks for checking out the app!", "That's all for now!",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.grey,
                    colorText: Colors.white);
              },
              child: const Text("Checkout"),
            ),
          ),
        ],
      ),
    );
  }
}
