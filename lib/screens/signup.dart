import 'dart:developer';

import 'package:ecommerce/screens/home.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    t1.dispose();
    t2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.1,
            ),
            const Center(
              child: Text(
                "Sign up",
                style: TextStyle(fontSize: 35),
              ),
            ),
            const Center(
              child: SizedBox(
                height: 20,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: t1,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Email",
                        hintStyle: const TextStyle(color: Colors.grey)),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your email address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: t2,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Password",
                        hintStyle: const TextStyle(color: Colors.grey)),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your password";
                      }
                      if (value.trim().length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signup();
                        }
                      },
                      child: const Text("Sign up")),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                    onPressed: () {
                      Get.off(() => const Login());
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.orange),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  signup() async {
    final user = await _auth.createUserWithEmailAndPassword(t1.text, t2.text);
    if (user != null) {
      log("User created successfully");
      Get.off(() => const HomePage());
    } else {
      log("Not created");
      Get.snackbar("Sign up failed", "Invalid email or password",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.grey,
          colorText: Colors.white);
    }
  }
}
