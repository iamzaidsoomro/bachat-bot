import 'package:bachat_bot/controller/signup_controller.dart';
import 'package:bachat_bot/routes/routes.dart';
import 'package:bachat_bot/view/getStarted/get_started.dart';
import 'package:bachat_bot/view/homepage/homepage_view.dart';
import 'package:bachat_bot/view/login/login_view.dart';
import 'package:bachat_bot/view/profilePage/profile.dart';
import 'package:bachat_bot/view/signup/signup_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/homepage_controller.dart';
import '../controller/login_controller.dart';

class AppPages {
  AppPages._();
  static var initialRoute = Routes.getStarted;
  static String getInitialRoute() {
    var preferences = SharedPreferences.getInstance();
    var route = Routes.login;
    if (FirebaseAuth.instance.currentUser != null) {
      route = Routes.homescreen;
    } else {
      route = Routes.login;
    }
    return route;
  }

  static var routes = [
    GetPage(
      name: Routes.getStarted,
      page: () => const GetStartedView(),
    ),
    GetPage(
        name: Routes.login,
        page: () => const LoginView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => LoginController());
        })),
    GetPage(
        name: Routes.homescreen,
        page: () => const HomePageView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => HomePageController());
        }),
        transition: Transition.leftToRightWithFade),
    GetPage(
      name: Routes.signup,
      page: () => const SignUpView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => SignupController());
      }),
    ),
  ];
}
