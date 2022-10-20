import 'package:bachat_bot/controller/homepage_controller.dart';
import 'package:bachat_bot/utils/color_swatch.dart';
import 'package:bachat_bot/utils/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "package:get/get.dart";
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'components/drawer.dart';

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
      return AdvancedDrawer(
        backdropColor: primaryColor,
        controller: controller.advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        drawer: const CustomAdvancedDrawer(),
        child: Scaffold(
            backgroundColor: secondaryColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: primaryColor,
              title: const Text(appName),
              centerTitle: true,
              leading: IconButton(
                onPressed: controller.handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: controller.advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Icon(
                        value.visible ? Icons.clear : Icons.menu,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_outline_outlined),
                ),
              ],
            ),
            body: controller.screens.elementAt(controller.index),
            bottomNavigationBar: CurvedNavigationBar(
              color: primaryColor,
              backgroundColor: secondaryColor,
              buttonBackgroundColor: primaryColor,
              height: 50,
              items: const <Widget>[
                Icon(Icons.percent, size: 30, color: secondaryColor),
                Icon(Icons.shopping_cart, size: 30, color: secondaryColor),
                Icon(Icons.home, size: 30, color: secondaryColor),
                Icon(Icons.shopping_bag, size: 30, color: secondaryColor),
                Icon(Icons.person, size: 30, color: secondaryColor),
              ],
              animationDuration: const Duration(milliseconds: 200),
              index: controller.index,
              animationCurve: Curves.bounceInOut,
              onTap: (index) {
                controller.switchScreen(index);
              },
            )),
      );
    });
  }
}
