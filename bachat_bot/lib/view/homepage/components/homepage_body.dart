import 'package:firebase_auth/firebase_auth.dart';

import 'saleCard.dart';
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color_swatch.dart';
import 'categoriesCard.dart';
import 'search_bar.dart';

class HomePageBody extends GetWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser);
    return SingleChildScrollView(
      child: Column(
        children: [
          /*
          SizedBox(
            height: Get.mediaQuery.size.height * 0.03,
          ),
          const SearchBar(),
          */
          SizedBox(height: Get.mediaQuery.size.height * 0.03),
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 0.0, bottom: 20.0),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: GoogleFonts.sansita(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.mediaQuery.size.height * 0.02),
                  Container(
                    height: Get.mediaQuery.size.width * 0.29,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          CategoriesCard(
                            imageName: "laundry.png",
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 0.0, bottom: 20.0),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bachat Sale",
                        style: GoogleFonts.sansita(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.mediaQuery.size.height * 0.02),
                  Container(
                    height: Get.mediaQuery.size.width * 0.80,
                    child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        children: const [
                          SaleCard(
                            imageName: 'outfitters.png',
                            website: "https://outfitters.com.pk",
                            categories: "Clothing, Shoes, Accessories",
                            sale: "50%",
                          ),
                          SaleCard(
                            imageName: 'Sapphire-Pakistan-Logo.jpg',
                            website: "https://pk.sapphireonline.pk",
                            categories: "Clothing, Accessories, Cosmetics",
                            sale: "50%",
                          ),
                          SaleCard(
                            imageName: 'baggerz.png',
                            website: "https://www.bagerz.com/",
                            categories: "Shoes, Accessories",
                            sale: "50%",
                          ),
                          SaleCard(
                            imageName: 'aodour.png',
                            website: "https://www.aodour.pk/",
                            categories: "Accessories, Cosmetics",
                            sale: "80%",
                          ),
                          SaleCard(
                            imageName: 'ndure.png',
                            website: "https://www.ndure.com/",
                            categories: "Shoes",
                            sale: "30%",
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
