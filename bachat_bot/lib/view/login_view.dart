import 'dart:io' show Platform;

import 'package:bachat_bot/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controller/login_controller.dart';
import '../utils/color_swatch.dart';

class LoginView extends GetWidget<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: primaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Get.mediaQuery.size.height * 0.2),
                const Text("Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: Get.mediaQuery.size.height * 0.05),
                Container(
                    padding: EdgeInsets.all(Get.mediaQuery.size.width * 0.1),
                    width: Get.mediaQuery.size.width * 0.9,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: secondaryColor, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: secondaryColor.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 2,
                          offset: const Offset(4, 4),
                        ),
                        const BoxShadow(
                          color: secondaryColor,
                          spreadRadius: 3,
                          blurRadius: 2,
                          offset: const Offset(-3, -3),
                        ),
                      ],
                    ),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            style: const TextStyle(color: primaryColor),
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: primaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: primaryColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: primaryColor,
                                ),
                              ),
                              labelStyle: const TextStyle(
                                  color: primaryColor, fontSize: 18),
                              floatingLabelStyle: const TextStyle(
                                  color: primaryColor, fontSize: 18),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: Get.mediaQuery.size.height * 0.03),
                          TextFormField(
                            controller: controller.passwordController,
                            style: const TextStyle(color: primaryColor),
                            decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: primaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: primaryColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: primaryColor,
                                ),
                              ),
                              labelStyle: const TextStyle(
                                  color: primaryColor, fontSize: 18),
                              floatingLabelStyle: const TextStyle(
                                  color: primaryColor, fontSize: 18),
                            ),
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              controller.login(context);
                            },
                            // ignore: sort_child_properties_last
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: Get.mediaQuery.size.width * 0.045),
                            ),
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(10.0),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  secondaryColor),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(secondaryColor),
                              foregroundColor:
                                  MaterialStateProperty.all(primaryColor),
                              minimumSize: MaterialStateProperty.all(Size(
                                  Get.mediaQuery.size.width,
                                  Get.mediaQuery.size.height * 0.08)),
                            ),
                          ),
                          SizedBox(height: Get.mediaQuery.size.height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                child: Text("Forgot Password",
                                    style: TextStyle(
                                        color: primaryColor.withOpacity(0.7),
                                        fontSize: 12)),
                                onPressed: () {},
                              ),
                              const Text("|",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                              TextButton(
                                child: Text("Sign Up",
                                    style: TextStyle(
                                        color: primaryColor.withOpacity(0.7),
                                        fontSize: 12)),
                                onPressed: () {
                                  Get.toNamed("/signup");
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
    throw UnimplementedError();
  }
}
