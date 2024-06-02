import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/config/size-config.dart';
import 'package:flutter_splash_screen/pages/kinh-phat.dart';
import 'package:flutter_splash_screen/pages/loi-day.dart';
import 'package:flutter_splash_screen/pages/thap-huong-khan-phat.dart';
import 'package:get/get.dart';

import '../app-assets/AppImages.dart';
import '../controller/left-menu-controller.dart';
import '../main.dart';
import '../pages/get-infomation-user.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  final controller = Get.put(LeftMenuController());
  final userInfomationController = Get.put(UserInfomationController());
  final _mainController = Get.find<MainController>();

  static final List<Map<String, dynamic>> _widgetOptions = [
    {'title': 'Thắp Hương Khấn Phật', 'page': const ThapHuong(), 'image': AppImages.menuImage1},
    {'title': 'Kinh Phật Tu Tại Gia', 'page': const KinhPhat(), 'image': AppImages.menuImage2},
    {'title': 'Lời Phật Dạy', 'page': const LoiDay(), 'image': AppImages.menuImage3},
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AppBar(
      backgroundColor: const Color.fromARGB(216, 197, 57, 57),
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => 
            Text(
              _widgetOptions[controller.tabIndex.value]['title'],
              style: TextStyle(color: Colors.white, fontSize: _mainController.isTablet.value ? 28.0 : 20.0),
            )
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}