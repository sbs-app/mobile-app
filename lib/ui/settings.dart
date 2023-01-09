import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:studentapp/controllers/controllers.dart';
import 'package:studentapp/constants/constants.dart';
import 'package:studentapp/models/models.dart';
import 'package:studentapp/ui/auth/auth.dart';
import 'package:studentapp/ui/components/components.dart';

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
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'settings.title'.tr,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _buildLayoutSection(context),
      floatingActionButton: getActions(),
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
            Card(
                color: Colors.transparent,
                elevation: 0,
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 70, left: 10),
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
                        authController.firestoreUser.value!.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )),
            const Divider(
              color: Colors.white,
            ),
            themeListTile(context),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              title: NeumorphicText(
                'settings.signOut'.tr,
                style: const NeumorphicStyle(color: Colors.white),
              ),
              trailing: NeumorphicButton(
                style: NeumorphicStyle(
                  intensity: 0.7,
                  surfaceIntensity: 0,
                  shape: NeumorphicShape.convex,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
                  lightSource: LightSource.topLeft,
                  depth: 3, //customize depth here
                  color: Colors.transparent,
                ),
                onPressed: () {
                  AuthController.to.signOut();
                },
                child: Text(
                  'settings.signOut'.tr,
                ),
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
                title: NeumorphicText(
                  'settings.updateProfile'.tr,
                  style: const NeumorphicStyle(color: Colors.white),
                ),
                trailing: NeumorphicButton(
                  style: NeumorphicStyle(
                    intensity: 0.7,
                    surfaceIntensity: 0,
                    shape: NeumorphicShape.convex,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
                    lightSource: LightSource.topLeft,
                    depth: 3, //customize depth here
                    color: Colors.transparent,
                  ), //customize color here
                  onPressed: () async {
                    Get.to(() => UpdateProfileUI());
                  },
                  child: Text(
                    'settings.updateProfile'.tr,
                  ),
                )),
            const Divider(
              color: Colors.white,
            ),
            // TODO: Fix this
            languageListTile(context),
            Divider(
              color: Colors.white,
            )
          ],
        ));
  }

  languageListTile(BuildContext context) {
    return GetBuilder<LanguageController>(
      builder: (controller) => ListTile(
        title: Text(
          'settings.language'.tr,
        ),
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
