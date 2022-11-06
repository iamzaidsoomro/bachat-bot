import 'package:bachat_bot/routes/routes.dart';
import 'package:bachat_bot/utils/color_swatch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        Get.offAllNamed(Routes.homescreen);
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
