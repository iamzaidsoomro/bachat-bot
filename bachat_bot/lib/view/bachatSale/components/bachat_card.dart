import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../utils/color_swatch.dart';

class BachatCard extends GetWidget {
  final imageName,
      link,
      name,
      rating,
      original_price,
      discounted_price,
      description;
  const BachatCard(
      {Key? key,
      this.imageName,
      this.link,
      this.name,
      this.original_price,
      this.discounted_price,
      this.description,
      this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(imageName);
    var sale = int.parse(original_price.toString().substring(3)) -
        int.parse(discounted_price.toString().substring(3));
    var salePercentage =
        (sale / int.parse(original_price.toString().substring(3))) * 100;
    var salePercentageRounded = salePercentage.round().toString() + "% off";
    return GestureDetector(
      onTap: () async {
//        await launchUrl(link);
        await launchUrlString(link).onError((error, stackTrace) {
          Get.snackbar("Request Failed", "An unexpected error occured");
          return false;
        });
      },
      child: Padding(
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
                      "https://$imageName",
                      fit: BoxFit.cover,
                      height: Get.mediaQuery.size.width * 0.2,
                      width: Get.mediaQuery.size.width * 0.2,
                      filterQuality: FilterQuality.high,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.mediaQuery.size.width * 0.4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, bottom: 1, left: 10, right: 0),
                          child: Text(
                            name,
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
                            description != null ? description : "",
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
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                original_price != null ? "$original_price" : "",
                                style: GoogleFonts.sansita(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough)),
                            Text(
                                discounted_price != null
                                    ? "$discounted_price"
                                    : "",
                                style: GoogleFonts.sansita(
                                  color: Colors.green,
                                  fontSize: 12,
                                )),
                          ],
                        ),
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
                  child: Text(salePercentageRounded,
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
      ),
    );
  }
}
