import 'package:bachat_bot/view/homepage/components/homepage_body.dart';
import 'package:bachat_bot/view/profilePage/profile.dart';
import 'package:bachat_bot/view/shops/shops.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";

class HomePageController extends GetxController {
  var screens = [
    const Center(child: Text('Screen 1')),
    const Center(child: Text('Screen 2')),
    HomePageBody(),
    const ShopsView(),
    const ProfileView()
  ];
  var index = 2;
  void switchScreen(index) {
    this.index = index;
    update();
  }
}
