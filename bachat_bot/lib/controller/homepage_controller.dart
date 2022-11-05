import 'package:bachat_bot/utils/constants.dart';
import 'package:bachat_bot/view/bachatSale/bachat_sale.dart';
import 'package:bachat_bot/view/homepage/components/homepage_body.dart';
import 'package:bachat_bot/view/profilePage/profile.dart';
import 'package:bachat_bot/view/shops/shops.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";

class HomePageController extends GetxController {
  var screens = [
    const Center(child: BachatSaleView()),
    const Center(child: Text('Screen 2')),
    HomePageBody(),
    const ShopsView(),
    const ProfileView()
  ];
  var index = homePageIndex;
  void switchScreen(index) {
    this.index = index;
    update();
  }
}
