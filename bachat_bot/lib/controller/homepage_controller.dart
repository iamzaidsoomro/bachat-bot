import 'package:bachat_bot/view/homepage/components/homepage_body.dart';
import 'package:bachat_bot/view/shops/shops.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import "package:get/get.dart";

class HomePageController extends GetxController {
  var screens = [
    const Center(child: Text('Screen 1')),
    const Center(child: Text('Screen 2')),
    HomePageBody(),
    ShopsView(),
    const Center(child: Text('Screen 4')),
  ];
  var index = 2;
  final advancedDrawerController = AdvancedDrawerController();
  void switchScreen(index) {
    this.index = index;
    update();
  }

  void handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
  }
}
