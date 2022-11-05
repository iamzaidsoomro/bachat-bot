import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color_swatch.dart';

class BachatSection extends GetWidget {
  final title, buttonText, children;
  const BachatSection({Key? key, this.title, this.buttonText, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 0.0, top: 0.0, bottom: 0.0),
          child: Text(
            title,
            style: GoogleFonts.sansita(
                fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
          ),
        ),
        SizedBox(height: Get.mediaQuery.size.height * 0.02),
        Container(
          height: Get.mediaQuery.size.width * 0.6,
          child: ListView(scrollDirection: Axis.horizontal, children: children),
        ),
        SizedBox(height: Get.mediaQuery.size.height * 0.02),
      ],
    );
  }
}
