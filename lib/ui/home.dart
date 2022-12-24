import 'package:flutter/material.dart';
import 'package:studentapp/controllers/controllers.dart';
import 'package:studentapp/ui/ui.dart';
import 'package:get/get.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      // ignore: unnecessary_null_comparison
      builder: (controller) => controller.firestoreUser.value!.uid == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xff009fff), Color(0xffec2f4b)]),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ClipOval(
                        child: Image.network(
                          controller.firestoreUser.value!.photoUrl,
                          width: 230,
                          height: 230,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Name
                      Text('Hello, ${controller.firestoreUser.value!.name}!',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.amber)),
                      // UID
                      // Text(
                      //     '${'home.uidLabel'.tr}: ${controller.firestoreUser.value!.uid}',
                      //     style: const TextStyle(fontSize: 16)),
                      // User type
                      Text('User Type: ${controller.firestoreUser.value!.type}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white)),
                      // Email
                      Text(
                          '${'home.emailLabel'.tr}: ${controller.firestoreUser.value!.email}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white)),
                      IconButton(
                          icon: const Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Get.to(SettingsUI());
                          }),
                      IconButton(
                          icon: const Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Get.to(SettingsUI());
                          }),
                      IconButton(
                          icon: const Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Get.to(SettingsUI());
                          }),
                      DigitalClock(
                        is24HourTimeFormat: false,
                        digitAnimationStyle: Curves.bounceInOut,
                        areaDecoration:
                            const BoxDecoration(color: Colors.transparent),
                      )
                      // Admin
                      // Text(
                      //     '${'home.adminUserLabel'.tr}: ${controller.admin.value}',
                      //     style: const TextStyle(fontSize: 16)),
                    ]),
              ),
            ),
    );
  }
}
