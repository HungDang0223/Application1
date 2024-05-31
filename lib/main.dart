import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/config/size-config.dart';
import 'package:flutter_splash_screen/drawable/left-menu.dart';
import 'package:flutter_splash_screen/pages/kinh-phat.dart';
import 'package:flutter_splash_screen/pages/loi-day.dart';
import 'package:flutter_splash_screen/pages/thap-huong-khan-phat.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';

import 'pages/get-infomation-user.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    final UserInfomationController controller = Get.put(UserInfomationController());
    controller.setDeviceType(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Viếng chùa',
      initialRoute: '/getusergender',
      getPages: [
        GetPage(name: '/getusergender', page: () => GetUserGender()),
        GetPage(name: '/thaphuong', page: () => ThapHuong()),
        GetPage(name: '/kinhphat', page: () => KinhPhat()),
        GetPage(name: '/loiday', page: () => LoiDay()),
        GetPage(name: '/', page: () => LeftMenu()),
        GetPage(name: '/getuserbirthyear', page: () => GetUserBirthYear()),
        GetPage(name: '/getusername', page: () => GetUserName()),
      ],
    );
  }
}
