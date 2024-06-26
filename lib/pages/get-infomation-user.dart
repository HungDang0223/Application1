import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/config/size-config.dart';
import 'package:flutter_splash_screen/drawable/appbar.dart';
import 'package:flutter_splash_screen/drawable/left-menu-drawer.dart';
import 'package:flutter_splash_screen/main.dart';
import 'package:flutter_splash_screen/pages/thap-huong-khan-phat.dart';
import 'package:get/get.dart';

import '../app-assets/AppImages.dart';

class GetUserGender extends StatelessWidget {
  GetUserGender({super.key});
  final UserInfomationController controller = Get.put(UserInfomationController());
  final _mainController = Get.find<MainController>();
  final List<String> gender = ['NAM', 'NỮ', 'KHÁC'];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final width = SizeConfig.screenWidth;
    final safeBlockHorizontal = SizeConfig.safeBlockHorizontal;
    final deviceType = _mainController.isTablet.value;
    return Scaffold(
      appBar: MyAppBar(),
      drawer: const MyLeftMenu(),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.7),
      body: Obx(() {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.backgroundImage),
                  fit: BoxFit.cover,
                ),
              )),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color.fromRGBO(255, 255, 255, 0.7),
              ),
              Container(
              width: width * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child:
                    FittedBox(
                      child: Text(
                      'XA XA NHÌN THẤY THÍ CHỦ',
                      style: TextStyle(fontSize: safeBlockHorizontal*5.5, color: Colors.red),
                    ),
                    )
                  ),
                  Center(
                    child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: gender.length,
                          itemBuilder: (context, i) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Transform.scale(
                                    scale: safeBlockHorizontal / 4.5,
                                    child: Radio(
                                      value:  gender[i],
                                      groupValue: controller.selectedGender.value,
                                      onChanged: controller.changeGender),
                                  ),
                                  SizedBox(width: _mainController.isTablet.value ? 20.0 : 4.0,),
                                  Container(
                                    child: Text(
                                      gender[i],
                                      style: TextStyle(
                                        fontSize: safeBlockHorizontal * 5.0),
                                    ),
                                  )
                                ],
                              )
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  ),
                  Visibility(
                    visible: controller.selectedGender.value == '' ? false : true,
                    child: 
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton(
                        onPressed: () => Get.toNamed('/getusername'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber[600],
                          padding: EdgeInsets.symmetric(horizontal: deviceType ? 70 : 60.0, vertical: 16.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                              topLeft: Radius.zero,
                              bottomLeft: Radius.zero,
                            ),
                          ),
                        ),
                        child: Text(
                          'Tiếp >>',
                          style: TextStyle(color: Colors.white, fontSize: deviceType ? 24 : 16),
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      })
    );
  }
}

class GetUserName extends StatelessWidget {
  GetUserName({super.key});
  final UserInfomationController controller = Get.put(UserInfomationController());
  final _mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final deviceType = _mainController.isTablet.value;
    return Scaffold(
      appBar: MyAppBar(),
      drawer: const MyLeftMenu(),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.5),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color.fromRGBO(255, 255, 255, 0.7),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: 220,
            color: const Color.fromRGBO(255, 255, 255, 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      'CON TÊN LÀ:',
                      style: TextStyle(
                          fontSize: deviceType ? 28 : 20,
                          color: Colors.red),
                    ),
                ),
                Container(
                  width: 250.0,
                  child: TextField(
                    style: TextStyle(fontSize: deviceType ? 24 : 18),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      hintText: 'Nhập họ và tên',
                      hintStyle: TextStyle(fontSize: deviceType ? 20 : 16)
                    ),
                    controller: controller._textEditingController.value,
                    onSubmitted: (value) {
                      Get.toNamed('/getuserbirthyear');
                      // value=='' ? controller.userNameValidate.value=false : controller.userNameValidate.value=true;
                      // controller.userNameValidate.value==true ? Get.toNamed('/getuserbirthyear') : null;
                    },
                  ),
                ),
                // Obx(() => Visibility(
                //   visible: !controller.userNameValidate.value,
                //   child: Container(
                //     margin: const EdgeInsets.only(top: 4.0),
                //     alignment: Alignment.center,
                //     child: const Text('Invalid User Name', style: TextStyle(fontSize: 8, color: Colors.red),),
                //   ),
                // )),
                Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  child: ElevatedButton(
                    onPressed: () => Get.toNamed('/getuserbirthyear'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[600],
                      padding: EdgeInsets.symmetric(horizontal: deviceType ? 70 : 60.0, vertical: 16.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Tiếp >>',
                      style: TextStyle(color: Colors.white, fontSize: deviceType ? 24 : 16),
                    ),
                  )
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}

class GetUserBirthYear extends StatelessWidget {
  GetUserBirthYear({super.key});
  final List<String> birthYear = ['Tý', 'Sửu', 'Dần', 'Mão', 'Thìn', 'Tỵ', 'Ngọ', 'Mùi', 'Thân', 'Dậu', 'Tuất', 'Hợi'];
  final UserInfomationController controller = Get.put(UserInfomationController());
  final _mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final safeBlockHorizontal = SizeConfig.safeBlockHorizontal;
    final deviceType = _mainController.isTablet.value;
    return Scaffold(
      appBar: MyAppBar(),
      drawer: const MyLeftMenu(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color.fromRGBO(255, 255, 255, 0.8),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount;
              if (constraints.maxWidth > 600) {
                crossAxisCount = 4;
              } else {
                crossAxisCount = 3;
              }

              return Obx(() {
                var _selectedZodiac = controller.selectedZodiac.value;
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'NIÊN SINH',
                          style: TextStyle(fontSize: deviceType ? 32 : 20, color: Colors.red),
                        ),
                      ),
                      Container(
                        height: safeBlockHorizontal * 10 * 12 / (crossAxisCount + 1),
                        width: constraints.maxWidth * 0.9,
                        color: Colors.white54,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: _mainController.isTablet.value ? 20.0 : 5.0,
                              childAspectRatio: 2.5,
                              mainAxisExtent: safeBlockHorizontal * 6
                            ),
                            itemCount: birthYear.length,
                            itemBuilder: (context, i) {
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () => controller.changeZodiac(birthYear[i]),
                                  child: Row(
                                  children: [
                                    Transform.scale(
                                      scale: safeBlockHorizontal / 6.5,
                                      child: Radio(
                                        value: birthYear[i],
                                        groupValue:
                                            controller.selectedZodiac.value,
                                        onChanged: controller.changeZodiac,
                                        activeColor: Colors.amber,),
                                    ),
                                    const SizedBox(width: 0.0,),
                                    Container(
                                      child: Text(
                                        birthYear[i],
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: safeBlockHorizontal * 4.5),
                                      ),
                                    )
                                  ],
                                ),
                                ),
                              );
                            },
                          ),
                      ),
                      Visibility(
                        visible: _selectedZodiac == '' ? false : true,
                        child: 
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: ElevatedButton(
                            onPressed: () => Get.offAllNamed('/'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber[600],
                              padding: EdgeInsets.symmetric(horizontal: deviceType ? 70 : 60.0, vertical: 16.0),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                  topLeft: Radius.zero,
                                  bottomLeft: Radius.zero,
                                ),
                              ),
                            ),
                            child: Text(
                              'Tiếp >>',
                              style: TextStyle(color: Colors.white, fontSize: deviceType ? 24 : 16),
                            ),
                          )
                        ),
                      )
                    ],
                  ),
                );
              });
            },
          ),
        ]
      )
    );
  }
}

class UserInfomationController extends GetxController {

  var selectedGender = ''.obs;
  var selectedZodiac = ''.obs;
  var userName = ''.obs;
  var userNameValidate = true.obs;
  final _textEditingController = TextEditingController().obs;

  var currentStep = 0.obs;
  var selectedPage =  Rx<Widget>(const ThapHuong());


  void changeGender(String? gender) {
    selectedGender.value = gender!;
    update();
  }

  void changeName(String name) {
    userName.value = name;
    update();
  }

  void changeZodiac(String? zodiac) {
    selectedZodiac.value = zodiac!;
    update();
  }

  void setPage(Widget page) {
    selectedPage.value = page;
  }
}

class UserInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserInfomationController());
  }
}