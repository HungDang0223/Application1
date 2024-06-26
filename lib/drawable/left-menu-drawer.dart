import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/app-assets/AppImages.dart';
import 'package:flutter_splash_screen/config/size-config.dart';
import 'package:flutter_splash_screen/pages/kinh-phat.dart';
import 'package:flutter_splash_screen/pages/loi-day.dart';
import 'package:flutter_splash_screen/pages/thap-huong-khan-phat.dart';
import 'package:get/get.dart';

import '../controller/left-menu-controller.dart';
import '../main.dart';
import '../pages/get-infomation-user.dart';

class MyLeftMenu extends StatefulWidget {
  const MyLeftMenu({super.key});

  @override
  State<MyLeftMenu> createState() => _MyLeftMenuState();
}

class _MyLeftMenuState extends State<MyLeftMenu> {
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
    final deviceType = _mainController.isTablet.value;
    return Obx(() {
        var selectedIndex = controller.tabIndex.value;
        return Drawer(
          width: deviceType ? 450.0 : 280,
          child: Column(
            children: [
              Container(
                height: deviceType ? 240 : 180,
                child: DrawerHeader(
                padding: EdgeInsets.only(top: 10.0, left: 15.0, bottom: 10.0),
                decoration: BoxDecoration(color: Colors.red[500]),
                curve: Curves.easeInOut,
                child: Container(
                  width: double.infinity,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: deviceType ? 60 : 40,
                      backgroundImage: AssetImage(_widgetOptions[selectedIndex]['image']),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'VẠN SỰ TÙY DUYÊN',
                      style: TextStyle(color: Colors.white, fontSize: deviceType ? 26.0 : 18.0)
                    ),
                    Text(
                      '---',
                      style: TextStyle(color: Colors.white, fontSize: deviceType ? 18.0 : 14.0),
                    ),
                  ],
                ),
              ),
              ),
              ),
              ..._widgetOptions.asMap().entries.map((entry) {
                int idx = entry.key;
                Map<String, dynamic> item = entry.value;
                return ListTile(
                  tileColor: selectedIndex == idx ? const Color.fromRGBO(0, 0, 0, 0.3) : null,
                  minVerticalPadding: deviceType ? 20.0 : 6.0,
                  title: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(item['image']),
                      ),
                      const SizedBox(width: 30),
                      Text(
                        item['title'],
                        style: TextStyle(
                          fontSize: deviceType ? 22.0 : 15.0,
                          fontWeight: FontWeight.bold,
                          color: selectedIndex == idx ? const Color.fromARGB(200, 244, 67, 54) : null,
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    controller.onTabChange(idx);
                    userInfomationController.setPage(item['page']);
                    Get.back();
                  },
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}
