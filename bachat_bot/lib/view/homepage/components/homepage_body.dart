import 'package:firebase_auth/firebase_auth.dart';

import 'saleCard.dart';
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color_swatch.dart';
import 'categoriesCard.dart';
import 'search_bar.dart';

class HomePageBody extends GetWidget {
  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: Get.mediaQuery.size.height * 0.03,
          ),
          const SearchBar(),
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
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See All",
                          style: GoogleFonts.sansita(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.mediaQuery.size.height * 0.02),
                  Container(
                    height: Get.mediaQuery.size.width * 0.29,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          CategoriesCard(imageName: 'make_up.png'),
                          CategoriesCard(imageName: 'furnitures.png'),
                          CategoriesCard(imageName: 'tableware.png'),
                          CategoriesCard(imageName: 'headphones.png')
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
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See All",
                          style: GoogleFonts.sansita(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.mediaQuery.size.height * 0.02),
                  Container(
                    height: Get.mediaQuery.size.width * 0.80,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          SaleCard(
                            imageName: 'edenrobe.jpg',
                            website: "www.edenrobe.com",
                            categories: "Clothing",
                            sale: "30%",
                          ),
                          SaleCard(
                            imageName: 'khaadi.png',
                            website: "www.khaadi.com",
                            categories: "Clothing, Accessories",
                            sale: "50%",
                          ),
                          SaleCard(
                            imageName: 'outfitters.png',
                            website: "www.outfitters.com",
                            categories: "Clothing, Shoes, Accessories",
                            sale: "70%",
                          ),
                          SaleCard(
                            imageName: 'jdot.png',
                            website: "www.junaidjamshed.com",
                            categories: "Clothing, Accessories, Cosmetics",
                            sale: "70%",
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
                        "Favorites",
                        style: GoogleFonts.sansita(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See All",
                          style: GoogleFonts.sansita(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.mediaQuery.size.height * 0.02),
                  Container(
                    height: Get.mediaQuery.size.width * 0.8,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [Text("No Favorites yet")]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
