import 'package:bachat_bot/utils/color_swatch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../routes/routes.dart';

class SplashScreen extends GetWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: primaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAllNamed(AppPages.getInitialRoute());
    });
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Image(
          image: const AssetImage('lib/assets/logo.png'),
          width: Get.mediaQuery.size.width * 0.9,
          color: secondaryColor,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
