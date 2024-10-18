import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  late Box<dynamic> cartBox;

  CartController() {
    _loadCart();
  }

  Future<void> _loadCart() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      cartBox = await Hive.openBox("cart_${user.uid}");
      cartItems.value =
          List<Product>.from(cartBox.get("cartItems", defaultValue: []));
    }
  }

  void addToCart(Product product) {
    cartItems.add(product);
    cartBox.put("cartItems", cartItems);
  }

  void removeFromCart(int index) {
    cartItems.removeAt(index);
    cartBox.put("cartItems", cartItems.toList());
  }

  void clearCart() {
    cartBox.put("cartItems", cartItems.toList());
    cartItems.clear();
  }

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
}
