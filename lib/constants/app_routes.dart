import 'package:get/get.dart';
import 'package:studentapp/ui/ui.dart';
import 'package:studentapp/ui/auth/auth.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/login', page: () => LoginUI()),
    GetPage(name: '/signup', page: () => const SignUpUI()),
    GetPage(name: '/home', page: () => const HomeUI()),
    GetPage(name: '/settings', page: () => const SettingsUI()),
    GetPage(name: '/reset-password', page: () => ResetPasswordUI()),
    GetPage(name: '/update-profile', page: () => UpdateProfileUI()),
  ];
}
