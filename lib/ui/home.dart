import 'package:flutter/material.dart';
import 'package:studentapp/controllers/controllers.dart';
import 'package:studentapp/ui/ui.dart';
import 'package:get/get.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:intl/intl.dart';

class HomeUI extends StatelessWidget {
  HomeUI({super.key});

  String convertedDateTime =
      new DateFormat("MMMM d, yyyy").format(DateTime.now());

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
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                  color: Colors.transparent,
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text(
                  'home.title'.tr,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: Container(
                margin: EdgeInsets.only(top: 0),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xff0f0c29),
                        Color(0xff302b63),
                        Color(0xff24243e)
                      ]),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 60),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 50.0,
                                spreadRadius: 2.0,
                              )
                            ],
                          ),
                          child: ClipOval(
                            child: Image.network(
                              controller.firestoreUser.value!.photoUrl,
                              width: 260,
                              height: 260,
                              fit: BoxFit.cover,
                            ),
                          )),
                      // Name
                      Text('Hello, ${controller.firestoreUser.value!.name}!',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              shadows: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 50.0,
                                  spreadRadius: 1.0,
                                )
                              ],
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white)),
                      // UID
                      // Text(
                      //     '${'home.uidLabel'.tr}: ${controller.firestoreUser.value!.uid}',
                      //     style: const TextStyle(fontSize: 16)),
                      // User type
                      // Text('User Type: ${controller.firestoreUser.value!.type}',
                      //     style: const TextStyle(
                      //         fontSize: 16, color: Colors.white)),
                      // Email
                      // Text(
                      //     '${'home.emailLabel'.tr}: ${controller.firestoreUser.value!.email}',
                      //     style: const TextStyle(
                      //         fontSize: 16, color: Colors.white)),
                      IconButton(
                          icon: const Icon(
                            Icons.settings,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(color: Colors.white, blurRadius: 10.0)
                            ],
                          ),
                          onPressed: () {
                            Get.to(SettingsUI());
                          }),
                      IconButton(
                          icon: const Icon(
                            Icons.home,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(color: Colors.white, blurRadius: 10.0)
                            ],
                          ),
                          onPressed: () {
                            Get.to(HomeUI());
                          }),
                      IconButton(
                          icon: const Icon(
                            Icons.mail,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(color: Colors.white, blurRadius: 10.0)
                            ],
                          ),
                          onPressed: () {
                            Get.to(SettingsUI());
                          }),
                      DigitalClock(
                        is24HourTimeFormat: false,
                        digitAnimationStyle: Curves.bounceIn,
                        showSecondsDigit: false,
                        areaDecoration:
                            const BoxDecoration(color: Colors.transparent),
                        hourMinuteDigitDecoration:
                            const BoxDecoration(color: Colors.transparent),
                        secondDigitDecoration:
                            const BoxDecoration(color: Colors.transparent),
                      ),
                      Text(
                        convertedDateTime,
                        style: TextStyle(color: Colors.white),
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
