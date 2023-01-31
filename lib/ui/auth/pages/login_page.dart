import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:classroom/ui/auth/pages/role_selection_page.dart';
import 'package:classroom/ui/auth/pages/sign_up_page.dart';
import 'package:classroom/ui/core/validator.dart';
import 'package:fancy_text_reveal/fancy_text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  bool showErrors = false;
  bool isLoading = false;
  bool showPassword = false;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    passwordController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget emailErrorWidget() {
    final bool isValidEmail = emailController.text.isValidEmail();
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: showErrors
          ? isValidEmail
              ? const SizedBox.shrink()
              : const Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Email is invalid",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
          : const SizedBox.shrink(),
    );
  }

  Widget passwordErrorWidget() {
    final bool isValidPassword = passwordController.text.isValidPassword();
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: showErrors
          ? isValidPassword
              ? const SizedBox.shrink()
              : const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Password must contain minimum 8 characters, at least one letter and one number",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                )
          : const SizedBox.shrink(),
    );
  }

  bool get isValid =>
      emailController.text.isValidEmail() &&
      passwordController.text.isValidPassword();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.signInUsingEmailOption.fold(
          () => null,
          (some) => some.fold(
            (l) {
              isLoading = false;
              setState(() {});
              Fluttertoast.showToast(
                msg: l.maybeMap(
                  orElse: () => "",
                  invalidEmail: (_) => "No user found with specified email",
                  invalidPassword: (_) => "Incorrect Password",
                  noUserFound: (_) => "No user found with specified email",
                  server: (_) =>
                      "Oops! Server down. Please try again after sometime",
                  unexpected: (_) =>
                      "Oops something went wrong. Please try again after sometime",
                ),
                textColor: Colors.black87,
                backgroundColor: Colors.white,
                toastLength: Toast.LENGTH_LONG,
                fontSize: 12,
              );
            },
            (r) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const RoleSelectionPage()),
            ),
          ),
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 24, 29, 29),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: Color.fromARGB(235, 91, 2, 57),
                    gradient: LinearGradient(
                      colors: [(Color(0xff00B4DB)), Color(0xff0083B0)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: DefaultTextStyle(
                    style: const TextStyle(fontSize: 45, color: Colors.white),
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          FadeAnimatedText('Hello!'),
                          FadeAnimatedText('Welcome!'),
                        ],
                        repeatForever: true,
                        displayFullTextOnTap: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                AnimatedSize(
                  duration: const Duration(milliseconds: 400),
                  child: passwordErrorWidget(),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: const Color(0xffc31432),
                    style: const TextStyle(color: Color(0xff240b36)),
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Color(0xff0083B0),
                      ),
                      hintText: "Enter Email",
                      hintStyle: TextStyle(color: Color(0xff240b36)),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                AnimatedSize(
                  duration: const Duration(milliseconds: 400),
                  child: emailErrorWidget(),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: !showPassword,
                    cursorColor: const Color(0xff0083B0),
                    style: const TextStyle(color: Color(0xff240b36)),
                    decoration: InputDecoration(
                      focusColor: const Color(0xffF5591F),
                      suffixIcon: IconButton(
                        splashRadius: 25,
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off_outlined,
                          size: 20,
                        ),
                      ),
                      icon: const Icon(
                        Icons.key,
                        color: Color(0xff0083B0),
                      ),
                      hintText: "Enter Password",
                      hintStyle: const TextStyle(color: Color(0xff240b36)),
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
                    onTap: () {},
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(color: Color.fromARGB(255, 2, 129, 240)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 340,
                  child: TextButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      showErrors = true;
                      if (isValid) {
                        isLoading = true;
                        AuthBloc.addEventWithoutContext(
                          AuthEvent.signInUsingEmail(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      }
                      setState(() {});
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 54, 165, 244),
                          ),
                        ),
                      ),
                      backgroundColor: isValid
                          ? MaterialStateProperty.all(
                              const Color(0xff0083B1),
                            )
                          : MaterialStateProperty.all(
                              const Color(0xff0083B0),
                            ),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          )
                        : const Text(
                            "Login",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        child: const Text(
                          "Register Now",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 129, 240),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignUpPage(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
