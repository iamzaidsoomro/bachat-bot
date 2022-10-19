import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: primaryColor, width: 3),
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
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Upto $sale off",
                style: const TextStyle(
                    color: primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                website,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
