import 'dart:convert';
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
import 'package:flutter/services.dart';
import "package:get/get.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

import '../model/clothing.dart';

class HomePageController extends GetxController {
  UserModel userModel = UserModel();
  var clothingModel, bagsModel, skinCareModel, shoesModel;
  var screens = [
    const Center(child: BachatSaleView()),
    const Center(child: Text('Not available in Alpha version')),
    HomePageBody(),
    const ShopsView(),
    const ProfileView()
  ];
  @override
  void onInit() {
    super.onInit();
    fetchUser();
    fetchClothingData();
    fetchBagsData();
    fetchShoesData();
    fetchSkincareData();
  }

  var index = homePageIndex;
  void switchScreen(index) {
    this.index = index;
    update();
  }

  void toShops() {
    this.index = 3;
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

  fetchBagsData() async {
    var response = await rootBundle.loadString('lib/assets/data/baggerz.json');
    var data = jsonDecode(response);
    bagsModel = ClothingModel(
      name: data['name'],
      norm_prices: data['norm_prices'] == null
          ? "No Price Available"
          : data['norm_prices'],
      disc_prices:
          data['disc_prices'] == null ? "No Discount" : data['disc_prices'],
      product_url: data['product_url'],
      image_url: data['image_url'],
      description: data['description'] == null
          ? 'No description available'
          : data['description'],
    );
    update();
  }

  fetchShoesData() async {
    var response = await rootBundle.loadString('lib/assets/data/ndure.json');
    var data = jsonDecode(response);
    shoesModel = ClothingModel(
      name: data['name'],
      norm_prices: data['norm_prices'] == null
          ? "No Price Available"
          : data['norm_prices'],
      disc_prices:
          data['disc_prices'] == null ? "No Discount" : data['disc_prices'],
      product_url: data['product_url'],
      image_url: data['image_url'],
      description: data['description'] == null
          ? 'No description available'
          : data['description'],
    );
    update();
  }

  fetchSkincareData() async {
    var response = await rootBundle.loadString('lib/assets/data/aodour.json');
    var data = jsonDecode(response);
    skinCareModel = ClothingModel(
      name: data['name'],
      norm_prices: data['norm_prices'] == null
          ? "No Price Available"
          : data['norm_prices'],
      disc_prices:
          data['disc_prices'] == null ? "No Discount" : data['disc_prices'],
      product_url: data['product_url'],
      image_url: data['image_url'],
      description: data['description'] == null
          ? 'No description available'
          : data['description'],
    );
    update();
  }

  fetchClothingData() async {
    var data = await rootBundle.loadString('lib/assets/data/outfitters.json');
    var jsonDecode = await json.decode(data);
    var data2 = await rootBundle.loadString('lib/assets/data/sapphire.json');
    var jsonDecode2 = await json.decode(data2);
    jsonDecode['name'].addAll(jsonDecode2['name']);
    jsonDecode['image_url'].addAll(jsonDecode2['image_url']);
    jsonDecode['product_url'].addAll(jsonDecode2['product_url']);
    jsonDecode['norm_prices'].addAll(jsonDecode2['norm_prices']);
    jsonDecode['disc_prices'].addAll(jsonDecode2['disc_prices']);
    jsonDecode['description'].addAll(jsonDecode2['description']);
    clothingModel = ClothingModel(
      name: jsonDecode['name'],
      norm_prices: jsonDecode['norm_prices'] == null
          ? "No Price Available"
          : jsonDecode['norm_prices'],
      disc_prices: jsonDecode['disc_prices'] == null
          ? "No Discount"
          : jsonDecode['disc_prices'],
      product_url: jsonDecode['product_url'],
      image_url: jsonDecode['image_url'],
      description: jsonDecode['description'] == null
          ? 'No description available'
          : jsonDecode['description'],
    );
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
