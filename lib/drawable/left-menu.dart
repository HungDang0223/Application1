import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/app-assets/AppImages.dart';
import 'package:flutter_splash_screen/drawable/appbar.dart';
import 'package:flutter_splash_screen/drawable/left-menu-drawer.dart';
import 'package:get/get.dart';
import '../controller/left-menu-controller.dart';
import '../pages/get-infomation-user.dart';

class LeftMenu extends StatefulWidget {
  const LeftMenu({super.key});

  @override
  State<LeftMenu> createState() => _LeftMenuState();
}

class _LeftMenuState extends State<LeftMenu> {
  final controller = Get.put(LeftMenuController());
  final userInfomationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.7),
      appBar: MyAppBar(),
      drawer: MyLeftMenu(),
      body: Obx(
        () => Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: userInfomationController.selectedPage.value
        ),
      ),
    );
  }
}
