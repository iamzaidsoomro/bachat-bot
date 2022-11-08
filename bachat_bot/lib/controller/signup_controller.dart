import 'package:bachat_bot/routes/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupController extends GetxController {
  var displayNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var addressController = TextEditingController();

  handleSignUpButton() {
    if (displayNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        addressController.text.isNotEmpty) {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      auth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        auth.currentUser?.updateDisplayName(displayNameController.text);
        auth.currentUser?.updatePhotoURL(
            "https://www.shareicon.net/data/512x512/2016/08/05/806962_user_512x512.png");
        auth.currentUser?.sendEmailVerification();
        firestore.collection("users").doc(auth.currentUser?.email).set({
          "displayName": displayNameController.text,
          "email": emailController.text,
          "phoneNumber": phoneNumberController.text,
          "address": addressController.text,
          "joined": DateTime.now().toString(),
        }).then((value) {
          Get.snackbar("Success", "Your account has been created");
          Get.offAllNamed(Routes.homescreen);
        });
      }).onError((error, stackTrace) {
        Get.snackbar("Error", error.toString());
      });
    } else {
      Get.snackbar(
        "Fields can't be empty",
        "Please fill all the fields",
        backgroundColor: Colors.red.withOpacity(0.8),
      );
    }
  }
}
