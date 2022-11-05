import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_swatch.dart';

class BachatCard extends GetWidget {
  final imageName, link, categories, sale;
  const BachatCard(
      {Key? key, this.imageName, this.link, this.categories, this.sale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Get.mediaQuery.size.width * 0.02),
      child: Stack(
        children: [
          Card(
            clipBehavior: Clip.hardEdge,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: const BorderSide(color: secondaryColor, width: 1),
            ),
            color: secondaryColor,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(0.0),
                  width: Get.mediaQuery.size.width * 0.4,
                  height: Get.mediaQuery.size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.network(
                    "$imageName",
                    fit: BoxFit.cover,
                    height: Get.mediaQuery.size.width * 0.1,
                    width: Get.mediaQuery.size.width * 0.36,
                    filterQuality: FilterQuality.medium,
                  ),
                ),
                const SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.mediaQuery.size.width * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          categories,
                          softWrap: false,
                          style: TextStyle(
                              overflow: TextOverflow.fade,
                              color: primaryColor,
                              fontSize: Get.width * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.mediaQuery.size.height * 0.01),
                    Container(
                        alignment: Alignment.centerLeft,
                        width: Get.mediaQuery.size.width * 0.4,
                        child: Image.network(
                          "https://brandsreview.pk/epsadoku/2020/01/Outfitters-logo.jpg",
                          width: Get.mediaQuery.size.width * 0.2,
                          height: Get.mediaQuery.size.width * 0.07,
                        )),
                  ],
                ),
                SizedBox(
                  height: Get.mediaQuery.size.height * 0.01,
                ),
              ],
            ),
          ),
          Positioned(
            top: 1,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                radius: Get.mediaQuery.size.width * 0.06,
                backgroundColor: saleColor,
                foregroundColor: secondaryColor,
                child: Text(sale,
                    style: TextStyle(
                        color: secondaryColor,
                        fontSize: Get.width * 0.04,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
