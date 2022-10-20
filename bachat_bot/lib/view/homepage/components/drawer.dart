import 'package:bachat_bot/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.shopping_bag_outlined),
                        title: Text("Shops"),
                        onTap: () {
                          Get.toNamed(Routes.shops);
                        },
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
}
