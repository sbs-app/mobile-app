// Student app
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:page_transition/page_transition.dart';
import 'package:studentapp/controllers/controllers.dart';
import 'package:studentapp/constants/constants.dart';
import 'package:studentapp/helpers/splash_screen.dart';
import 'package:studentapp/helpers/helpers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put<AuthController>(AuthController());
  Get.put<ThemeController>(ThemeController());
  Get.put<LanguageController>(LanguageController());
  runApp(const SplashScreen());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Student app',
        home: AnimatedSplashScreen(
            duration: 1000,
            splash: 'assets/app_logo.png',
            nextScreen: const App(),
            splashTransition: SplashTransition.scaleTransition,
            pageTransitionType: PageTransitionType.fade,
            gradient: const LinearGradient(
              colors: [(Color(0xffc31432)), Color(0xff240b36)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )));
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromStore();
    return GetBuilder<LanguageController>(
      builder: (languageController) => Loading(
        child: GetMaterialApp(
          translations: Localization(),
          locale: languageController.getLocale, // <- Current locale
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.fade,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: ThemeMode.system,
          initialRoute: FirebaseAuth.instance.currentUser?.uid == null
              ? "/login"
              : "/home",
          getPages: AppRoutes.routes,
        ),
      ),
    );
  }
}
