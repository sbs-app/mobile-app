import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:studentapp/controllers/controllers.dart';
import 'package:studentapp/constants/constants.dart';
import 'package:studentapp/models/models.dart';
import 'package:studentapp/ui/components/components.dart';
import 'package:studentapp/ui/auth/auth.dart';

import 'home.dart';

class SettingsUI extends StatelessWidget {
  SettingsUI({super.key});

  final LanguageController languageController = LanguageController.to;
  final ThemeController themeController = ThemeController.to;
  final AuthController authController = AuthController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.transparent,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'settings.title'.tr,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _buildLayoutSection(context),
      floatingActionButton: SpeedDial(
        foregroundColor: Colors.white,
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Color.fromARGB(255, 64, 58, 134),
        children: [
          SpeedDialChild(
              child: Icon(
                Icons.mail,
                color: Colors.white,
              ),
              onTap: () {
                Get.to(HomeUI());
              },
              backgroundColor: Color(0xff302b63)),
          SpeedDialChild(
              child: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onTap: () async {
                Get.to(HomeUI());
              },
              backgroundColor: Color(0xff302b63)),
          SpeedDialChild(
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onTap: () async {
                Get.to(SettingsUI());
              },
              backgroundColor: Color(0xff302b63)),
        ],
      ),
    );
  }

  Widget _buildLayoutSection(BuildContext context) {
    return Container(
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
        child: ListView(
          children: <Widget>[
            // languageListTile(context),
            // themeListTile(context),

            Card(
                color: Colors.transparent,
                elevation: 0,
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 70, left: 10),
                        width: 85,
                        height: 85,
                        child: CircleAvatar(
                          //radius: 100,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                              child: Image.network(
                            authController.firestoreUser.value!.photoUrl,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )),
                        )),
                    Expanded(
                      child: Text(
                        '${authController.firestoreUser.value!.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: Text(
                'settings.signOut'.tr,
                style: TextStyle(color: Colors.white),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  AuthController.to.signOut();
                },
                child: Text(
                  'settings.signOut'.tr,
                ),
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
                title: Text(
                  'settings.updateProfile'.tr,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: ElevatedButton(
                  onPressed: () async {
                    Get.to(UpdateProfileUI());
                  },
                  child: Text(
                    'settings.updateProfile'.tr,
                  ),
                )),
            Divider(
              color: Colors.white,
            ),
          ],
        ));
  }

  languageListTile(BuildContext context) {
    return GetBuilder<LanguageController>(
      builder: (controller) => ListTile(
        title: Text('settings.language'.tr),
        trailing: DropdownPicker(
          menuOptions: Globals.languageOptions,
          selectedOption: controller.currentLanguage,
          onChanged: (value) async {
            await controller.updateLanguage(value!);
            Get.forceAppUpdate();
          },
        ),
      ),
    );
  }

  themeListTile(BuildContext context) {
    final List<MenuOptionsModel> themeOptions = [
      MenuOptionsModel(
          key: "system", value: 'settings.system'.tr, icon: Icons.brightness_4),
      MenuOptionsModel(
          key: "light", value: 'settings.light'.tr, icon: Icons.brightness_low),
      MenuOptionsModel(
          key: "dark", value: 'settings.dark'.tr, icon: Icons.brightness_3)
    ];
    return GetBuilder<ThemeController>(
        builder: (controller) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SegmentedSelector(
                selectedOption: controller.currentTheme,
                menuOptions: themeOptions,
                onValueChanged: (value) {
                  controller.setThemeMode(value);
                },
              ),
            ));
  }
}
