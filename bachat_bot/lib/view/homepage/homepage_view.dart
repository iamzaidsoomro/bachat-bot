import 'package:bachat_bot/controller/homepage_controller.dart';
import 'package:bachat_bot/utils/color_swatch.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "package:get/get.dart";

class HomePageView extends GetWidget<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
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
    return GetBuilder<HomePageController>(builder: (controller) {
      return Scaffold(
        backgroundColor: secondaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: secondaryColor,
          title: Image(
            image: const AssetImage("lib/assets/logo.png"),
            filterQuality: FilterQuality.high,
            height: Get.mediaQuery.size.height * 0.06,
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: primaryColor,
              ),
            ),
          ],
        ),
        body: controller.screens.elementAt(controller.index),
        bottomNavigationBar: CurvedNavigationBar(
          color: primaryColor,
          backgroundColor: secondaryColor,
          buttonBackgroundColor: primaryColor,
          height: Get.mediaQuery.size.width * 0.15,
          items: <Widget>[
            Icon(Icons.percent,
                size: Get.mediaQuery.size.width * 0.08, color: secondaryColor),
            Icon(Icons.shopping_cart,
                size: Get.mediaQuery.size.width * 0.08, color: secondaryColor),
            Icon(Icons.home,
                size: Get.mediaQuery.size.width * 0.08, color: secondaryColor),
            Icon(Icons.shopping_bag,
                size: Get.mediaQuery.size.width * 0.08, color: secondaryColor),
            Icon(Icons.person,
                size: Get.mediaQuery.size.width * 0.08, color: secondaryColor),
          ],
          animationDuration: const Duration(milliseconds: 200),
          index: controller.index,
          animationCurve: Curves.bounceInOut,
          onTap: (index) {
            controller.switchScreen(index);
          },
        ),
      );
    });
  }
}
