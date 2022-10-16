import 'package:bachat_bot/routes/routes.dart';
import 'package:bachat_bot/view/login_view.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class AppPages {
  AppPages._();
  static const initialRoute = Routes.login;
  static var routes = [
    GetPage(
        name: Routes.login,
        page: () => LoginView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => LoginController());
        })),
  ];
}