import 'package:bachat_bot/utils/color_swatch.dart';
import 'package:bachat_bot/utils/constants.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "package:get/get.dart";
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class HomePageView extends GetWidget {
  HomePageView({Key? key}) : super(key: key);
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: secondaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return AdvancedDrawer(
      backdropColor: primaryColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      drawer: const CustomAdvancedDrawer(),
      child: Scaffold(
        backgroundColor: secondaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          title: const Text(appName),
          centerTitle: true,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person_outline_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(Get.mediaQuery.padding.top),
                child: searchBar(context),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
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
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  Widget searchBar(BuildContext context) {
    return TextField();
  }
}

class CustomAdvancedDrawer extends GetWidget {
  const CustomAdvancedDrawer({Key? key, this.advancedDrawerController})
      : super(key: key);
  final advancedDrawerController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: Get.width * 0.05, top: Get.height * 0.1),
        child: ListTileTheme(
          textColor: Get.theme.canvasColor,
          iconColor: Get.theme.canvasColor,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  "Zaid Ahmed",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                subtitle:
                    Text("zaid3614@gmail.com", style: TextStyle(fontSize: 15)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const <Widget>[
                      ListTile(
                        leading: Icon(Icons.shopping_bag_outlined),
                        title: Text("Shops"),
                      ),
                      ListTile(
                        leading: Icon(Icons.sell),
                        title: Text("Products"),
                      ),
                      ListTile(
                        leading: Icon(Icons.percent),
                        title: Text("Bachat Sale"),
                      ),
                      ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("Logout"),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBar(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
