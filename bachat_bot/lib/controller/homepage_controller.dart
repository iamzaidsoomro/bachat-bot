import 'dart:io';
import 'package:bachat_bot/model/user.dart';
import 'package:bachat_bot/utils/constants.dart';
import 'package:bachat_bot/view/bachatSale/bachat_sale.dart';
import 'package:bachat_bot/view/homepage/components/homepage_body.dart';
import 'package:bachat_bot/view/profilePage/profile.dart';
import 'package:bachat_bot/view/shops/shops.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class HomePageController extends GetxController {
  UserModel userModel = UserModel();
  var screens = [
    const Center(child: BachatSaleView()),
    const Center(child: Text('Screen 2')),
    HomePageBody(),
    const ShopsView(),
    const ProfileView()
  ];
  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  var index = homePageIndex;
  void switchScreen(index) {
    this.index = index;
    update();
  }

  fetchUser() {
    var user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.email)
        .get()
        .then((value) {
      userModel = UserModel(
        displayName: user.displayName,
        email: user.email,
        photoURL: user.photoURL,
        address: value.data()!['address'],
        phoneNumber: value.data()!['phoneNumber'],
        uid: user.uid,
        joined: FirebaseAuth.instance.currentUser?.metadata.creationTime!.year
            .toString(),
      );
    });
    update();
  }

  updateProfilePic() {
    ImagePicker picker = ImagePicker();
    picker.pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        userModel.photoURL = value.path;
        update();
        File image = File(value.path);
        FirebaseStorage.instance
            .ref()
            .child('displayPictures/${userModel.uid}')
            .putFile(image)
            .then((value) {
          value.ref.getDownloadURL().then((value) {
            userModel.photoURL = value;
            FirebaseAuth.instance.currentUser!
                .updatePhotoURL(value)
                .then((value) => Get.snackbar(
                      "Success",
                      'Profile picture updated',
                      titleText: const Text(
                        'Success',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ))
                .onError((error, stackTrace) => Get.snackbar(
                      "Failed",
                      "Photo update failed",
                      titleText: const Text(
                        'Success',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ));
            update();
          });
        });
      }
    });
  }
}
