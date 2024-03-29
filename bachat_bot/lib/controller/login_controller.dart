import 'package:bachat_bot/routes/routes.dart';
import 'package:bachat_bot/utils/color_swatch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  login(BuildContext context) async {
    bool isConnected = await ConnectivityWrapper.instance.isConnected;
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      await _auth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        if (value.user!.emailVerified) {
          Get.offAllNamed(Routes.homescreen);
        } else {
          _auth.signOut();
          Get.snackbar("Verify your email",
              "Please verify your email before first sign in",
              titleText: const Text(
                "Verify your email",
                style: TextStyle(color: primaryColor),
              ),
              backgroundColor: Colors.white,
              colorText: Colors.black);
        }
      }).onError((error, stackTrace) {
        Get.snackbar("Error", error.toString());
      });
    } else if (emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Fields cannot be empty',
          colorText: Colors.red.withOpacity(0.9),
          backgroundColor: secondaryColor.withOpacity(0.6),
          snackPosition: SnackPosition.TOP);
    } else {
      if (!isConnected) {
        Get.snackbar('Error', 'No Internet Connection',
            colorText: Colors.red.withOpacity(0.9),
            backgroundColor: secondaryColor.withOpacity(0.6),
            snackPosition: SnackPosition.TOP);
        return;
      }
      Get.snackbar('Error', 'Unable to login',
          colorText: Colors.red.withOpacity(0.9),
          backgroundColor: secondaryColor.withOpacity(0.6),
          snackPosition: SnackPosition.TOP);
    }
  }
}
