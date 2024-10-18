import 'dart:developer';

import 'package:ecommerce/screens/home.dart';
import 'package:ecommerce/screens/signup.dart';
import 'package:ecommerce/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                "Login",
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
                          login();
                        }
                      },
                      child: const Text("Login")),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      Get.off(() => const Signup());
                    },
                    child: const Text(
                      "Sign up!",
                      style: TextStyle(color: Colors.orange),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  login() async {
    final user = await _auth.loginUserWithEmailAndPassword(t1.text, t2.text);
    if (user != null) {
      log("Logged in successfully");
      Get.off(() => const HomePage());
    } else {
      log("Not logged in");
      Get.snackbar("Login failed", "Invalid email or password",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.grey,
          colorText: Colors.white);
    }
  }
}
