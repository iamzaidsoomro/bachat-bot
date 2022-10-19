import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_swatch.dart';

class BottomNavbar extends GetWidget {
  const BottomNavbar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: primaryColor,
      backgroundColor: secondaryColor,
      buttonBackgroundColor: primaryColor,
      height: 50,
      items: const <Widget>[
        Icon(Icons.percent, size: 30, color: secondaryColor),
        Icon(Icons.shopping_cart, size: 30, color: secondaryColor),
        Icon(Icons.home, size: 30, color: secondaryColor),
        Icon(Icons.shopping_bag, size: 30, color: secondaryColor),
        Icon(Icons.person, size: 30, color: secondaryColor),
      ],
      animationDuration: const Duration(milliseconds: 200),
      index: 2,
      animationCurve: Curves.bounceInOut,
      onTap: (index) {
        //Handle button tap
      },
    );
  }
}
