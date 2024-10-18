import 'package:ecommerce/screens/cart.dart';
import 'package:ecommerce/components/navbar.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/screens/shop.dart';
import 'package:ecommerce/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = AuthService();
  int selectedIndex = 0;
  List<Widget> pages = [const ShoppingPage(), const CartPage()];
  final CartController cartController = Get.put(CartController());

  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedIndex == 0 ? "SuperShopper" : "Shopping Cart",
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      bottomNavigationBar:
          NavBar(onTabChange: (index) => navigateBottomBar(index)),
      body: pages[selectedIndex],
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(children: [
              Icon(
                Icons.shopping_cart,
                size: 100,
                color: Colors.white,
              ),
              Text(
                "SuperShopper",
                style: TextStyle(color: Colors.white),
              )
            ]),
          ),
          ListTile(
            title: const Text("About"),
            onTap: () {
              Get.back();
              Get.snackbar("Created by Ritam Patra",
                  "Kalinga Institute of Industrial Technology",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.grey,
                  colorText: Colors.white);
            },
          ),
          ListTile(
            title: const Text("Logout"),
            onTap: () async {
              await _auth.signout();
              cartController.clearCart();
              Get.off(() => const Login());
            },
          ),
        ],
      )),
    );
  }
}
