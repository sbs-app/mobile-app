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
              appBar: AppBar(
                title: Text('home.title'.tr),
                actions: [
                  IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        Get.to(SettingsUI());
                      }),
                ],
              ),
              body: Center(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 50),
                    Image.network(controller.firestoreUser.value!.photoUrl,
                        width: 128, height: 128),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // UID
                        Text(
                            '${'home.uidLabel'.tr}: ${controller.firestoreUser.value!.uid}',
                            style: const TextStyle(fontSize: 16)),
                        // Name
                        Text(
                            '${'home.nameLabel'.tr}: ${controller.firestoreUser.value!.name}',
                            style: const TextStyle(fontSize: 16)),
                        // User type
                        Text(
                            'User Type: ${controller.firestoreUser.value!.type}',
                            style: const TextStyle(fontSize: 16)),
                        // Email
                        Text(
                            '${'home.emailLabel'.tr}: ${controller.firestoreUser.value!.email}',
                            style: const TextStyle(fontSize: 16)),
                        // Admin
                        Text(
                            '${'home.adminUserLabel'.tr}: ${controller.admin.value}',
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
