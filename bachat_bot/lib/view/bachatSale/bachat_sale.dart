import 'dart:convert';

import 'package:bachat_bot/controller/homepage_controller.dart';
import 'package:bachat_bot/utils/color_swatch.dart';
import './components/bachat_card.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "package:get/get.dart";
import 'package:google_fonts/google_fonts.dart';

import 'components/bachat_section.dart';

class BachatSaleView extends GetWidget<HomePageController> {
  const BachatSaleView({Key? key}) : super(key: key);
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
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  BachatSection(
                      title: "Clothing",
                      buttonText: "See All",
                      children: ListView.builder(
                          itemCount: controller.clothingModel.image_url.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return BachatCard(
                              imageName:
                                  controller.clothingModel.image_url[index],
                              link: controller.clothingModel.product_url[index]
                                  .toString(),
                              name: controller.clothingModel.name[index],
                              original_price:
                                  controller.clothingModel.norm_prices[index],
                              discounted_price:
                                  controller.clothingModel.disc_prices[index],
                              description:
                                  controller.clothingModel.description[index],
                            );
                          })),
                  BachatSection(
                      title: "Shoes",
                      buttonText: "See All",
                      children: ListView.builder(
                          itemCount: controller.shoesModel.image_url.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return BachatCard(
                              imageName: controller.shoesModel.image_url[index],
                              link: controller.shoesModel.product_url[index]
                                  .toString(),
                              name: controller.shoesModel.name[index],
                              original_price:
                                  controller.shoesModel.norm_prices[index],
                              discounted_price:
                                  controller.shoesModel.disc_prices[index],
                              description:
                                  controller.shoesModel.description[index],
                            );
                          })),
                  BachatSection(
                      title: "Bags",
                      buttonText: "See All",
                      children: ListView.builder(
                          itemCount: controller.bagsModel.image_url.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return BachatCard(
                              imageName: controller.bagsModel.image_url[index],
                              link: controller.bagsModel.product_url[index]
                                  .toString(),
                              name: controller.bagsModel.name[index],
                              original_price:
                                  controller.bagsModel.norm_prices[index],
                              discounted_price:
                                  controller.bagsModel.disc_prices[index],
                              description:
                                  controller.bagsModel.description[index],
                            );
                          })),
                  BachatSection(
                      title: "Skincare",
                      buttonText: "See All",
                      children: ListView.builder(
                          itemCount: controller.skinCareModel.image_url.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return BachatCard(
                              imageName:
                                  controller.skinCareModel.image_url[index],
                              link: controller.skinCareModel.product_url[index]
                                  .toString(),
                              name: controller.skinCareModel.name[index],
                              original_price:
                                  controller.skinCareModel.norm_prices[index],
                              discounted_price:
                                  controller.skinCareModel.disc_prices[index],
                              description:
                                  controller.skinCareModel.description[index],
                            );
                          })),
                ])));
  }
}
