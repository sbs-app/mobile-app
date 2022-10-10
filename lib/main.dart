import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:studentapp/login_screen.dart';
import 'package:studentapp/splash_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Student app',
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: 'assets/app_logo.png',
            nextScreen: const LoginScreen(),
            splashTransition: SplashTransition.slideTransition,
            pageTransitionType: PageTransitionType.topToBottom,
            gradient: const LinearGradient(
              colors: [(Color(0xffc31432)), Color(0xff240b36)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )));
  }
}
