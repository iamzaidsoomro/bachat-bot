import 'package:bachat_bot/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bachat_bot/utils/color_swatch.dart';
import 'package:flutter/cupertino.dart';

class ProfileView extends GetWidget {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: primaryColor),
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  backgroundImage: const AssetImage("lib/assets/zaid.jpg"),
                  radius: Get.mediaQuery.size.width * 0.15,
                ),
              ),
              SizedBox(
                height: Get.mediaQuery.size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Zaid Ahmed Soomro",
                      style: GoogleFonts.sansita(
                          color: primaryColor,
                          fontSize: Get.mediaQuery.size.width * 0.06,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: Get.mediaQuery.size.width * 0.02,
                  ),
                  const Icon(Icons.edit, color: Colors.grey)
                ],
              ),
              SizedBox(height: Get.mediaQuery.size.height * 0.07),
              Column(
                children: [
                  profileTextBox(
                      "zaid3614@gmail.com", CupertinoIcons.envelope_fill, true),
                  GestureDetector(
                      onTap: () {
                        FirebaseAuth.instance
                            .signOut()
                            .then((value) => Get.offAllNamed(Routes.login));
                      },
                      child:
                          profileTextBox("Logout", Icons.logout_sharp, false)),
                ],
              )
            ],
          ),
        ],
      ),
    ));
  }

  Widget profileTextBox(title, icon, editable) {
    return ListTile(
      leading: Icon(
        icon,
        color: primaryColor,
      ),
      title: Text("$title",
          style: GoogleFonts.acme(
              color: Colors.grey,
              fontSize: Get.mediaQuery.size.width * 0.04,
              fontWeight: FontWeight.bold)),
      trailing: editable
          ? IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit, color: primaryColor),
            )
          : const Text(''),
    );
  }
}
