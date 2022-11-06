import 'package:bachat_bot/model/user.dart';
import 'package:bachat_bot/utils/constants.dart';
import 'package:bachat_bot/view/bachatSale/bachat_sale.dart';
import 'package:bachat_bot/view/homepage/components/homepage_body.dart';
import 'package:bachat_bot/view/profilePage/profile.dart';
import 'package:bachat_bot/view/shops/shops.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:firebase_auth/firebase_auth.dart';

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
    userModel =
        UserModel(name: user?.displayName, email: user?.email, uid: user?.uid);
  }
}
