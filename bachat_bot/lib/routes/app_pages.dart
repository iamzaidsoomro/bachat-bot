import 'package:bachat_bot/routes/routes.dart';
import 'package:bachat_bot/view/homepage/homepage_view.dart';
import 'package:bachat_bot/view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/homepage_controller.dart';
import '../controller/login_controller.dart';
import '../view/shops/shops.dart';

class AppPages {
  AppPages._();
  static var initialRoute = getInitialRoute();
  static String getInitialRoute() {
    var preferences = SharedPreferences.getInstance();
    var route = Routes.login;
    if (FirebaseAuth.instance.currentUser != null) {
      route = Routes.homescreen;
    } else {
      route = Routes.login;
    }
    /*
    preferences.then((value) => {
          print(value.get('email')),
          if (value.get("email").toString().isEmpty)
            {
              route = Routes.login,
            }
          else
            {
              route = Routes.homescreen,
            }
        });
        */
    return route;
  }

  static var routes = [
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
      name: Routes.shops,
      page: () => ShopsView(),
    ),
  ];
}
