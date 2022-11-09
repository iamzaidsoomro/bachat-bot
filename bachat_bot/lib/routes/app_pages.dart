import 'package:bachat_bot/controller/signup_controller.dart';
import 'package:bachat_bot/routes/routes.dart';
import 'package:bachat_bot/view/getStarted/get_started.dart';
import 'package:bachat_bot/view/homepage/homepage_view.dart';
import 'package:bachat_bot/view/login/login_view.dart';
import 'package:bachat_bot/view/signup/signup_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controller/homepage_controller.dart';
import '../controller/login_controller.dart';
import '../view/splashscreen/splashscreen.dart';

class AppPages {
  AppPages._();
  static var initialRoute = Routes.splashscreen;
  static String getInitialRoute() {
    bool isFirstTime = GetStorage().read("isFirstTime") == null;
    var route = Routes.login;
    if (isFirstTime) {
      route = Routes.getStarted;
    } else if (FirebaseAuth.instance.currentUser != null) {
      route = Routes.homescreen;
    } else {
      route = Routes.login;
    }
    return route;
  }

  static var routes = [
    GetPage(
      name: Routes.splashscreen,
      page: () => const SplashScreen(),
    ),
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
