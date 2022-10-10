import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:studentapp/login_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clean Code',
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: 'assets/app_logo.png',
            nextScreen: LoginScreen(),
            splashTransition: SplashTransition.slideTransition,
            pageTransitionType: PageTransitionType.topToBottom,
            backgroundColor: Colors.red));
  }
}
