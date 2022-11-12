import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:studentapp/ui/auth/auth.dart';
import 'package:studentapp/helpers/helpers.dart';
import 'package:studentapp/controllers/controllers.dart';

class SignUpUI extends StatelessWidget {
  SignUpUI({Key? key}) : super(key: key);
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
                  height: 250,
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
                        margin: const EdgeInsets.only(right: 20, top: 20),
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )
                    ],
                  )),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE)),
                    ],
                  ),
                  child: TextFormField(
                    controller: authController.nameController,
                    validator: Validator().name,
                    cursorColor: const Color(0xffF5591F),
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Color(0xffF5591F),
                      ),
                      hintText: "Full Name",
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
                    color: Colors.grey[200],
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE)),
                    ],
                  ),
                  child: TextFormField(
                    controller: authController.emailController,
                    validator: Validator().email,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: const Color(0xffF5591F),
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Color(0xffF5591F),
                      ),
                      hintText: "Email",
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
                    color: const Color(0xffEEEEEE),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 20),
                          blurRadius: 100,
                          color: Color(0xffEEEEEE)),
                    ],
                  ),
                  child: TextFormField(
                    controller: authController.passwordController,
                    validator: Validator().password,
                    obscureText: true,
                    cursorColor: const Color(0xffF5591F),
                    decoration: const InputDecoration(
                      focusColor: Color(0xffF5591F),
                      icon: Icon(
                        Icons.key,
                        color: Color(0xffF5591F),
                      ),
                      hintText: "Enter Password",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      SystemChannels.textInput.invokeMethod(
                          'TextInput.hide'); // To hide the keyboard - if any
                      authController.registerWithEmailAndPassword(context);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [(Color(0xffF5591F)), Color(0xffF2861E)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: const Text(
                      "REGISTER",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Have An Already Member? "),
                      GestureDetector(
                          child: const Text(
                            "Login Now",
                            style: TextStyle(color: Color(0xffF5591F)),
                          ),
                          onTap: () => Get.to(LoginUI()))
                    ],
                  ),
                )
              ],
            ))));
  }
}
