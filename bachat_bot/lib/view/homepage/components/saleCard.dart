import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color_swatch.dart';

class SaleCard extends GetWidget {
  final imageName, website, sale, categories;
  const SaleCard(
      {Key? key, this.imageName, this.website, this.categories, this.sale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: secondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(0.0),
                width: Get.width * 0.5,
                height: Get.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: primaryColor, width: 5),
                ),
                child: Image.asset(
                  "lib/assets/$imageName",
                  fit: BoxFit.contain,
                  height: Get.mediaQuery.size.width * 0.2,
                  width: Get.mediaQuery.size.width * 0.4,
                ),
              ),
              SizedBox(height: Get.mediaQuery.size.height * 0.01),
              Text(
                categories,
                style: GoogleFonts.sansita(
                    color: Colors.grey,
                    fontSize: Get.mediaQuery.size.width * 0.04,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: Get.mediaQuery.size.height * 0.01,
              ),
              Text(
                "Upto $sale off",
                style: GoogleFonts.sansita(
                    color: primaryColor,
                    fontSize: Get.mediaQuery.size.width * 0.06,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.mediaQuery.size.height * 0.01,
              ),
              Text(
                website,
                style: GoogleFonts.sansita(
                    color: Colors.grey,
                    fontSize: Get.mediaQuery.size.width * 0.03,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
