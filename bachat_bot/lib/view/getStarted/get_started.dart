import 'package:bachat_bot/utils/color_swatch.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/routes.dart';

class GetStartedView extends GetWidget {
  const GetStartedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: Get.mediaQuery.size.height * -0.2,
              left: Get.mediaQuery.size.width * -0.2,
              child: CustomPaint(
                painter: HexagonePainter(),
                child: Container(
                  height: Get.mediaQuery.size.height * 0.5,
                  width: Get.mediaQuery.size.width,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Get.mediaQuery.size.width * 0.26,
                        top: Get.mediaQuery.size.width * 0.45),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome!",
                          style: GoogleFonts.sansita(
                              color: Colors.black54,
                              fontSize: Get.mediaQuery.size.width * 0.09,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: Get.mediaQuery.size.height * 0.01,
                        ),
                        SizedBox(
                          width: Get.mediaQuery.size.width * 0.5,
                          child: Text(
                            "We are really happy to see you here",
                            softWrap: true,
                            style: GoogleFonts.sansita(
                                color: Colors.grey,
                                fontSize: Get.mediaQuery.size.width * 0.05,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(
                          height: Get.mediaQuery.size.height * 0.03,
                        ),
                        Divider(
                          color: primaryColor,
                          thickness: Get.mediaQuery.size.width * 0.01,
                          endIndent: Get.mediaQuery.size.width * 0.6,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.mediaQuery.size.height * 0.4),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: Get.mediaQuery.size.height * 0.7,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                ),
                items: [
                  CustomOne('shopping.png', "Find the best products",
                      "We have the best brands for you"),
                  CustomOne('purchasing.png', "Save on every purchase",
                      "We provide you the biggest sales"),
                  CustomOne('magnifying-glass.png', "Got everything for you",
                      "Find everything you need on single platform"),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              child: ElevatedButton(
                onPressed: () {
                  GetStorage().write("isFirstTime", false);
                  Get.offAllNamed(Routes.login);
                },
                style: ElevatedButton.styleFrom(
                    elevation: 5,
                    fixedSize: Size(Get.mediaQuery.size.width * 0.5,
                        Get.mediaQuery.size.width * 0.11),
                    primary: secondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text("Get Started",
                    style: GoogleFonts.sansita(
                        color: primaryColor,
                        fontSize: Get.mediaQuery.size.width * 0.05)),
              ),
            )
          ],
        ));
  }

  Widget CustomOne(image, name, description) {
    return SizedBox(
      width: Get.mediaQuery.size.width,
      child: Column(
        children: [
          Image.asset(
            "lib/assets/$image",
            fit: BoxFit.cover,
            height: Get.mediaQuery.size.width * 0.5,
            width: Get.mediaQuery.size.width * 0.5,
          ),
          SizedBox(
            height: Get.mediaQuery.size.height * 0.01,
          ),
          Text(
            "$name",
            softWrap: true,
            style: GoogleFonts.sansita(
                color: secondaryColor,
                fontSize: Get.mediaQuery.size.width * 0.05,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Get.mediaQuery.size.height * 0.01,
          ),
          Text(
            "$description",
            softWrap: true,
            style: GoogleFonts.sansita(
                color: secondaryColor,
                fontSize: Get.mediaQuery.size.width * 0.05,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class HexagonePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = secondaryColor
      ..style = PaintingStyle.fill;
    final path = Path();
    path.moveTo(0, size.height * 0.5);
    path.lineTo(size.width * 0.7, 0);
    path.lineTo(size.width, size.height * 0.7);
    path.lineTo(size.width * 0.7, size.height);
    path.lineTo(0, size.height * 0.9);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
