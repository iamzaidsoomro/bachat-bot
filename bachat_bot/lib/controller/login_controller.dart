import 'package:bachat_bot/routes/routes.dart';
import 'package:bachat_bot/utils/color_swatch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_checker/connectivity_checker.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  login(BuildContext context) async {
    bool isConnected = await ConnectivityWrapper.instance.isConnected;
    if (emailController.text == "admin" && passwordController.text == "admin") {
      Get.offNamed(Routes.homescreen);
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
