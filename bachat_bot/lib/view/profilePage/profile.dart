import 'package:bachat_bot/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bachat_bot/utils/color_swatch.dart';
import 'package:flutter/cupertino.dart';
import 'package:bachat_bot/model/user.dart';

import '../../controller/homepage_controller.dart';

class ProfileView extends GetWidget<HomePageController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var user = controller.userModel;
    return SingleChildScrollView(
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: Get.mediaQuery.size.height * 0.03),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
                        border: Border(
                          top: BorderSide(color: primaryColor, width: 3),
                          left: BorderSide(color: primaryColor, width: 3),
                          right: BorderSide(color: primaryColor, width: 3),
                          bottom: BorderSide(color: primaryColor, width: 3),
                        )),
                    child: CircleAvatar(
                      backgroundColor: primaryColor,
                      backgroundImage: NetworkImage(user.photoURL!),
                      radius: Get.mediaQuery.size.width * 0.2,
                    ),
                  ),
                  Positioned(
                    bottom: 0.5,
                    right: 0.5,
                    child: GestureDetector(
                      onTap: () {
                        controller.updateProfilePic();
                      },
                      child: Container(
                        height: Get.mediaQuery.size.width * 0.1,
                        width: Get.mediaQuery.size.width * 0.1,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                            border: Border(
                              top: BorderSide(color: primaryColor, width: 3),
                              left: BorderSide(color: primaryColor, width: 3),
                              right: BorderSide(color: primaryColor, width: 3),
                              bottom: BorderSide(color: primaryColor, width: 3),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(61, 0, 0, 0),
                                blurRadius: 5.0,
                                spreadRadius: 0.0,
                                offset: Offset(0.0, 0.0),
                              )
                            ]),
                        child: const Icon(
                          CupertinoIcons.camera_fill,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.mediaQuery.size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(user.displayName!,
                      style: GoogleFonts.sansita(
                          color: primaryColor,
                          fontSize: Get.mediaQuery.size.width * 0.06,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: Get.mediaQuery.size.height * 0.07),
              Column(
                children: [
                  profileTextBox(user.email, CupertinoIcons.envelope_fill),
                  profileTextBox(user.phoneNumber, CupertinoIcons.phone_fill),
                  profileTextBox(user.address, Icons.home_filled),
                  profileTextBox(user.joined, CupertinoIcons.clock_fill),
                  GestureDetector(
                      onTap: () {
                        FirebaseAuth.instance
                            .signOut()
                            .then((value) => Get.offAllNamed(Routes.login));
                      },
                      child: profileTextBox("Logout", Icons.logout_sharp)),
                ],
              )
            ],
          ),
        ],
      ),
    ));
  }

  Widget profileTextBox(title, icon) {
    return ListTile(
      leading: Icon(
        icon,
        color: primaryColor,
      ),
      title: Text("$title",
          style: GoogleFonts.acme(
              color: Colors.grey,
              fontSize: Get.mediaQuery.size.width * 0.04,
              fontWeight: FontWeight.w100)),
    );
  }
}
