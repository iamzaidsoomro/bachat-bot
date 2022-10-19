import 'package:bachat_bot/utils/color_swatch.dart';
import 'package:bachat_bot/utils/constants.dart';
import 'package:bachat_bot/view/homepage/components/saleCard.dart';
import 'package:bachat_bot/view/homepage/components/search_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "package:get/get.dart";
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/bottom_navbar.dart';
import 'components/categoriesCard.dart';
import 'components/drawer.dart';

class HomePageView extends GetWidget {
  HomePageView({Key? key}) : super(key: key);
  final _advancedDrawerController = AdvancedDrawerController();
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
    return AdvancedDrawer(
      backdropColor: primaryColor,
      controller: _advancedDrawerController,
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
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.mediaQuery.size.height * 0.03,
                ),
                const SearchBar(),
                SizedBox(height: Get.mediaQuery.size.height * 0.03),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 0.0, bottom: 20.0),
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
                          height: 120,
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
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 0.0, bottom: 20.0),
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
                          height: Get.mediaQuery.size.width * 0.8,
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
                                  categories:
                                      "Clothing, Accessories, Cosmetics",
                                  sale: "70%",
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 0.0, bottom: 20.0),
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
          ),
          bottomNavigationBar: const BottomNavbar()),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
