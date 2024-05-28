import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_splash_screen/drawable/appbar.dart';
import 'package:flutter_splash_screen/drawable/left-menu-drawer.dart';
import 'package:flutter_splash_screen/pages/thap-huong-khan-phat.dart';
import 'package:get/get.dart';

import '../app-assets/AppImages.dart';

class GetUserGender extends StatelessWidget {
  GetUserGender({super.key});
  final UserInfomationController controller
    = Get.put(UserInfomationController());
  final List<String> gender = ['NAM', 'NỮ', 'KHÁC'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                    const Text(
                      'XA XA NHÌN THẤY THÍ CHỦ',
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
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
                              child: RadioListTile(
                                title: Text(gender[i], style: const TextStyle(fontSize: 20)),
                                value: gender[i],
                                groupValue: controller.selectedGender.value,
                                onChanged: controller.changeGender,
                                contentPadding: EdgeInsets.symmetric(horizontal: width * 0.25),
                              ),
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
                          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 14.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                              topLeft: Radius.zero,
                              bottomLeft: Radius.zero,
                            ),
                          ),
                        ),
                        child: const Text(
                          'Tiếp >>',
                          style: TextStyle(color: Colors.white),
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

  @override
  Widget build(BuildContext context) {
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
            height: 200,
            color: const Color.fromRGBO(255, 255, 255, 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: const Text('CON TÊN LÀ:', style: TextStyle(fontSize: 21.0, color: Colors.red),),
                ),
                Container(
                  width: 250.0,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Nhập họ và tên'
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
                  margin: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    onPressed: () => Get.toNamed('/getuserbirthyear'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[600],
                      padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 14.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Tiếp >>',
                      style: TextStyle(color: Colors.white),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: const MyLeftMenu(),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.7),
      body:
      Stack(
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
            color: const Color.fromRGBO(255, 255, 255, 0.5),
          ),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount;
                if (constraints.maxWidth > 900) {
                  crossAxisCount = 6;
                } else if (constraints.maxWidth > 600) {
                  crossAxisCount = 4;
                } else {
                  crossAxisCount = 3;
                }

                return Obx(() {
                  var _selectedZodiac = controller.selectedZodiac.value;
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'NIÊN SINH',
                            style: TextStyle(fontSize: 24.0, color: Colors.red),
                          ),
                        ),
                        Container(
                          height: 52.0 * 12 / (crossAxisCount + 1),
                          width: constraints.maxWidth * 0.9,
                          color: const Color.fromARGB(20, 88, 88, 88),
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 5.0,
                                childAspectRatio: 2.5,
                                mainAxisExtent: 35
                              ),
                              itemCount: birthYear.length,
                              itemBuilder: (context, i) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: GestureDetector(
                                    onTap: () => controller.changeZodiac(birthYear[i]),
                                    child: Row(
                                    children: [
                                      Radio(
                                          value: birthYear[i],
                                          groupValue:
                                              controller.selectedZodiac.value,
                                          onChanged: controller.changeZodiac,
                                          activeColor: Colors.amber,),
                                      Container(
                                        child: Text(birthYear[i], style: const TextStyle(color: Colors.blue, fontSize: 20),),
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
                                padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 14.0),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                    topLeft: Radius.zero,
                                    bottomLeft: Radius.zero,
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Tiếp >>',
                                style: TextStyle(color: Colors.white),
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

  var currentStep = 0.obs;
  var selectedPage =  Rx<Widget>(const ThapHuong());

  final _textEditingController = TextEditingController().obs;

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