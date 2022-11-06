import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_swatch.dart';

class BachatCard extends GetWidget {
  final imageName, link, categories, sale, rating;
  const BachatCard(
      {Key? key,
      this.imageName,
      this.link,
      this.categories,
      this.sale,
      this.rating})
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
                  height: Get.mediaQuery.size.width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.network(
                    "$imageName",
                    fit: BoxFit.cover,
                    height: Get.mediaQuery.size.width * 0.2,
                    width: Get.mediaQuery.size.width * 0.2,
                    filterQuality: FilterQuality.medium,
                  ),
                ),
                const SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          for (int i = 0; i < rating; i++)
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                          Text(
                            '($rating)',
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: Get.mediaQuery.size.width * 0.03,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.mediaQuery.size.width * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, bottom: 1, left: 10, right: 0),
                        child: Text(
                          categories,
                          softWrap: false,
                          style: TextStyle(
                              overflow: TextOverflow.fade,
                              color: primaryColor,
                              fontSize: Get.mediaQuery.size.width * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.mediaQuery.size.width * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, bottom: 5, left: 10, right: 0),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          softWrap: false,
                          style: TextStyle(
                              overflow: TextOverflow.fade,
                              color: Colors.grey,
                              fontSize: Get.mediaQuery.size.width * 0.03,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          width: Get.mediaQuery.size.width * 0.4,
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSPAJDav7VRMqoGWAlYXVQa9YtjpRBn-lg9OOoCd5Y&s",
                            width: Get.mediaQuery.size.width * 0.1,
                            height: Get.mediaQuery.size.width * 0.05,
                          )),
                    ),
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
