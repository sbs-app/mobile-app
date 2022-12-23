import 'package:flutter/material.dart';
import 'package:studentapp/controllers/controllers.dart';
import 'package:studentapp/ui/ui.dart';
import 'package:get/get.dart';

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
              backgroundColor: Colors.blueGrey,
              appBar: AppBar(
                title: Text('home.title'.tr),
                actions: [],
              ),
              body: Center(
                child: Column(
                  children: <Widget>[
                    ClipOval(
                      child: Image.network(
                        controller.firestoreUser.value!.photoUrl,
                        width: 230,
                        height: 230,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // UID
                        // Text(
                        //     '${'home.uidLabel'.tr}: ${controller.firestoreUser.value!.uid}',
                        //     style: const TextStyle(fontSize: 16)),
                        // Name
                        Text('Hello, ${controller.firestoreUser.value!.name}!',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.amber)),
                        // User type
                        Text(
                            'User Type: ${controller.firestoreUser.value!.type}',
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
                        // Admin
                        // Text(
                        //     '${'home.adminUserLabel'.tr}: ${controller.admin.value}',
                        //     style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
