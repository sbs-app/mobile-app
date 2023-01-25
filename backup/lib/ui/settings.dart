import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
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
              title: Text(
                'settings.signOut'.tr,
              ),
              trailing: AnimatedButton(
                height: 30,
                width: 150,
                textStyle: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
                gradient:
                    const LinearGradient(colors: [Colors.black, Colors.blue]),
                selectedGradientColor: const LinearGradient(
                    colors: [Colors.yellow, Colors.purple]),
                selectedTextColor: Colors.white,
                transitionType: TransitionType.LEFT_TO_RIGHT,
                isReverse: true,
                borderColor: Colors.white,
                borderRadius: 20,
                onPress: () async {
                  await Future.delayed(const Duration(milliseconds: 500));
                  AuthController.to.signOut();
                },
                text: ('settings.signOut'.tr),
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
                title: Text(
                  'settings.updateProfile'.tr,
                ),
                trailing: AnimatedButton(
                  height: 30,
                  width: 150,
                  text: ('settings.updateProfile'.tr),
                  textStyle: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                  gradient:
                      const LinearGradient(colors: [Colors.black, Colors.blue]),
                  selectedGradientColor: const LinearGradient(
                      colors: [Colors.yellow, Colors.purple]),
                  selectedTextColor: Colors.white,
                  transitionType: TransitionType.LEFT_TO_RIGHT,
                  isReverse: true,
                  borderColor: Colors.white,
                  borderRadius: 20,
                  onPress: () async {
                    await Future.delayed(const Duration(milliseconds: 500));
                    Get.to(() => UpdateProfileUI());
                  },
                )),
            const Divider(
              color: Colors.white,
            ),
            // TODO: Fix this
            languageListTile(context),
            const Divider(
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
