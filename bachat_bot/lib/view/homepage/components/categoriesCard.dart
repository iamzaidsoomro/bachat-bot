import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_swatch.dart';

class CategoriesCard extends GetWidget {
  final imageName;
  const CategoriesCard({Key? key, this.imageName}) : super(key: key);

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
          child: Container(
            padding: const EdgeInsets.all(10.0),
            width: Get.mediaQuery.size.width * 0.16,
            height: Get.mediaQuery.size.width * 0.2,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              "lib/assets/$imageName",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
