import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_swatch.dart';

class ShopCard extends GetWidget {
  final imageName, link, categories;
  const ShopCard({Key? key, this.imageName, this.link, this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
              width: Get.width * 0.7,
              height: Get.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(
                "lib/assets/$imageName",
                fit: BoxFit.contain,
                height: Get.mediaQuery.size.width * 0.2,
                width: Get.mediaQuery.size.width * 0.4,
              ),
            ),
            SizedBox(height: 5),
            Text(
              categories,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: Get.mediaQuery.size.width * 0.04,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Get.mediaQuery.size.height * 0.01,
            ),
            Text(
              link,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: Get.mediaQuery.size.width * 0.04,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
