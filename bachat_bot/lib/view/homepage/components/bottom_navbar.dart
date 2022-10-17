import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_swatch.dart';

class BottomNavbar extends GetWidget {
  const BottomNavbar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: DotNavigationBar(
        backgroundColor: secondaryColor,
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        margin: EdgeInsets.only(left: 10, right: 10),
        currentIndex: 0,
        dotIndicatorColor: primaryColor.withOpacity(0.5),
        unselectedItemColor: Colors.grey[300],
        // enableFloatingNavBar: false,
        onTap: (index) {},
        items: [
          /// Home
          DotNavigationBarItem(
            icon: Icon(Icons.home),
            selectedColor: primaryColor,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: Icon(Icons.favorite),
            selectedColor: Color(0xff73544C),
          ),

          /// Search
          DotNavigationBarItem(
            icon: Icon(Icons.search),
            selectedColor: Color(0xff73544C),
          ),

          /// Profile
          DotNavigationBarItem(
            icon: Icon(Icons.person),
            selectedColor: Color(0xff73544C),
          ),
        ],
      ),
    );
  }
}
