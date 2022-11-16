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
                  imageName: "Sapphire-Pakistan-Logo.jpg",
                  link: "https://pk.sapphireonline.pk/",
                  categories: "Clothing, Accessories"),
              ShopCard(
                  imageName: "baggerz.png",
                  link: "https://www.bagerz.com/",
                  categories: "Shoes, Accessories"),
              ShopCard(
                  imageName: "aodour.png",
                  link: "https://www.aodour.pk/",
                  categories: "Cosmetics, Accessories"),
              ShopCard(
                  imageName: "ndure.png",
                  link: "https://www.ndure.pk/",
                  categories: "Shoes"),
            ],
          ),
        ],
      ),
    ));
  }
}
