import 'package:bachat_bot/routes/routes.dart';
import 'package:bachat_bot/view/homepage/homepage_view.dart';
import 'package:bachat_bot/view/login_view.dart';
import 'package:get/get.dart';

import '../controller/homepage_controller.dart';
import '../controller/login_controller.dart';
import '../view/shops/shops.dart';

class AppPages {
  AppPages._();
  static const initialRoute = Routes.login;
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
