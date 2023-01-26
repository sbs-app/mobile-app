import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:studentapp/ui/auth/auth.dart';
import 'package:studentapp/helpers/helpers.dart';
import 'package:studentapp/controllers/controllers.dart';

class LoginUI extends StatelessWidget {
  LoginUI({Key? key}) : super(key: key);
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffCEBAC5),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    color: Color.fromARGB(235, 91, 2, 57),
                    gradient: LinearGradient(
                      colors: [(Color(0xffc31432)), Color(0xff240b36)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: Image.asset(
                          "assets/app_logo.png",
                          height: 90,
                          width: 90,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 2, top: 20),
                        alignment: Alignment.bottomCenter,
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )
                    ],
                  )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: const Text(
                    "Hello!",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff240b36)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: const Text(
                    "Welcome",
                    style: TextStyle(fontSize: 25, color: Color(0xff240b36)),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    // boxShadow: const [
                    //   BoxShadow(
                    //     offset: Offset(0, 10),
                    //     blurRadius: 0,
                    //   ),
                    // ],
                  ),
                  child: TextFormField(
                    controller: authController.emailController,
                    validator: Validator().email,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: const Color(0xffc31432),
                    style: TextStyle(color: Color(0xff240b36)),
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Color(0xffc31432),
                      ),
                      hintText: "Enter Email",
                      hintStyle: TextStyle(color: Color(0xff240b36)),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    // boxShadow: const [
                    //   BoxShadow(
                    //     offset: Offset(0, 10),
                    //     blurRadius: 25,
                    //   ),
                    // ],
                  ),
                  child: TextFormField(
                    controller: authController.passwordController,
                    validator: Validator().password,
                    obscureText: true,
                    cursorColor: const Color(0xffc31432),
                    style: TextStyle(color: Color(0xff240b36)),
                    decoration: const InputDecoration(
                      focusColor: Color(0xffF5591F),
                      icon: Icon(
                        Icons.key,
                        color: Color(0xffc31432),
                      ),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(color: Color(0xff240b36)),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Get.to(() => ResetPasswordUI()),
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                AnimatedButton(
                  onPress: () async {
                    if (_formKey.currentState!.validate()) {
                      authController.signInWithEmailAndPassword(context);
                    }
                  },
                  text: 'Login',
                  textStyle: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                  gradient: LinearGradient(
                    colors: [Color(0xffc31432), Color(0xff240b36)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  selectedGradientColor:
                      LinearGradient(colors: [Colors.yellow, Colors.purple]),
                  selectedTextColor: Colors.white,
                  transitionType: TransitionType.LEFT_TO_RIGHT,
                  isReverse: true,
                  borderColor: Colors.white,
                  borderRadius: 20,
                  height: 54,
                  width: 350,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? ",
                          style: TextStyle(color: Colors.black)),
                      GestureDetector(
                        child: const Text(
                          "Register Now",
                          style: TextStyle(
                              color: Color.fromARGB(255, 7, 108, 223)),
                        ),
                        onTap: () => Get.to(() => const SignUpUI()),
                      )
                    ],
                  ),
                )
              ],
            ))));
  }
}