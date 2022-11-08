import 'dart:io' show Platform;

import 'package:bachat_bot/controller/signup_controller.dart';
import 'package:bachat_bot/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../controller/login_controller.dart';
import '../../utils/color_swatch.dart';

class SignUpView extends GetWidget<SignupController> {
  const SignUpView({Key? key}) : super(key: key);

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
                SizedBox(
                  height: Get.mediaQuery.size.height * 0.06,
                ),
                Image.asset(
                  'lib/assets/logo.png',
                  height: Get.mediaQuery.size.width * 0.2,
                  color: secondaryColor,
                ),
                SizedBox(
                  height: Get.mediaQuery.size.height * 0.05,
                ),
                Container(
                    padding: EdgeInsets.all(Get.mediaQuery.size.width * 0.1),
                    width: Get.mediaQuery.size.width * 0.9,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: secondaryColor, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 2,
                          offset: const Offset(4, 4),
                        ),
                        const BoxShadow(
                          color: primaryColor,
                          spreadRadius: 3,
                          blurRadius: 2,
                          offset: Offset(-3, -3),
                        ),
                      ],
                    ),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: controller.displayNameController,
                            cursorColor: primaryColor,
                            style: const TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                              labelText: "Full-Name",
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
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: Get.mediaQuery.size.height * 0.03),
                          TextFormField(
                            controller: controller.emailController,
                            cursorColor: primaryColor,
                            style: const TextStyle(color: Colors.grey),
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
                            cursorColor: primaryColor,
                            style: const TextStyle(color: Colors.grey),
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
                          SizedBox(height: Get.mediaQuery.size.height * 0.03),
                          TextFormField(
                            controller: controller.phoneNumberController,
                            cursorColor: primaryColor,
                            style: const TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                              labelText: "Phone Number",
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
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: Get.mediaQuery.size.height * 0.03),
                          TextFormField(
                            controller: controller.addressController,
                            cursorColor: primaryColor,
                            style: const TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                              labelText: "Address",
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
                            keyboardType: TextInputType.streetAddress,
                          ),
                          SizedBox(height: Get.mediaQuery.size.height * 0.02),
                          Text(
                            "By creating an account you agree to our Terms of Service and Privacy Policy",
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: Get.mediaQuery.size.width * 0.027,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              controller.handleSignUpButton();
                            },
                            // ignore: sort_child_properties_last
                            child: Text(
                              "Create Account",
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
                              Text("Already have an account?",
                                  style: TextStyle(
                                      color: primaryColor.withOpacity(0.7),
                                      fontSize: 12)),
                              TextButton(
                                child: Text("Sign In",
                                    style: TextStyle(
                                        color: primaryColor.withOpacity(0.7),
                                        fontSize: 12)),
                                onPressed: () {
                                  Get.toNamed(Routes.login);
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
  }
}
