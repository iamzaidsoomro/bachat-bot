import 'package:bachat_bot/utils/color_swatch.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "package:get/get.dart";
import 'package:google_fonts/google_fonts.dart';
import 'components/shop_card.dart';

class ShopsView extends GetWidget {
  const ShopsView({Key? key}) : super(key: key);
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
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text('Shops',
              style: GoogleFonts.sansita(
                  fontSize: Get.mediaQuery.size.width * 0.08,
                  fontWeight: FontWeight.bold,
                  color: primaryColor)),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              ShopCard(
                  imageName: "outfitters.png",
                  link: "https://www.outfitters.com.pk/",
                  categories: "Clothing, Shoes"),
              ShopCard(
                  imageName: "edenrobe.jpg",
                  link: "https://www.edenrobe.com.pk/",
                  categories: "Clothing"),
              ShopCard(
                  imageName: "jdot.png",
                  link: "https://www.junaidjamshed.com.pk/",
                  categories: "Clothing, Accessories, Perfumes"),
              ShopCard(
                  imageName: "khaadi.png",
                  link: "https://www.khaadi.com.pk/",
                  categories: "Clothing, Accessories"),
            ],
          ),
        ],
      ),
    ));
  }
}
