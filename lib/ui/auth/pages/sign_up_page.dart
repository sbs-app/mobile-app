import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:classroom/ui/auth/pages/login_page.dart';
import 'package:classroom/ui/core/validator.dart';
import 'package:classroom/ui/home/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with TickerProviderStateMixin {
  bool showErrors = false;
  bool isLoading = false;
  bool showPassword = false;

  late TextEditingController emailController;
  late TextEditingController userNameController;
  late TextEditingController passwordController;

  XFile? profileImage;

  @override
  void initState() {
    emailController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    userNameController = TextEditingController()
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
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget userNameErrorWidget() {
    final bool isValidUsername = userNameController.text.isValidUsername();
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: showErrors
          ? isValidUsername
              ? const SizedBox.shrink()
              : const Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Full name is invalid",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
          : const SizedBox.shrink(),
    );
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
                      style: TextStyle(color: Colors.white),
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
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
          : const SizedBox.shrink(),
    );
  }

  bool get isValid =>
      emailController.text.isValidEmail() &&
      userNameController.text.isValidUsername() &&
      passwordController.text.isValidPassword();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.signUpUsingEmailOption.fold(
          () => null,
          (some) => some.fold(
            (l) {
              isLoading = false;
              setState(() {});
              Fluttertoast.showToast(
                msg: l.maybeMap(
                  orElse: () => "",
                  invalidEmail: (_) => "No user found with specified email",
                  usernameAlreadyTaken: (_) =>
                      "Oops! specified username is not available",
                  userAlreadyExist: (_) =>
                      "Account already exist for specified email",
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
              MaterialPageRoute(builder: (_) => OnboardingPage()),
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
                            "assets/logo/logo.png",
                            height: 90,
                            width: 90,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 2, top: 20),
                          alignment: Alignment.bottomCenter,
                          child: const Text(
                            "Register",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                  ),
                  child: TextFormField(
                    controller: userNameController,
                    cursorColor: const Color(0xff0083B0),
                    style: const TextStyle(color: Color(0xff240b36)),
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Color(0xff0083B0),
                      ),
                      hintText: "Full Name",
                      hintStyle: TextStyle(color: Color(0xff240b36)),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                AnimatedSize(
                  duration: const Duration(milliseconds: 400),
                  child: userNameErrorWidget(),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                  ),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: const Color(0xff0083B0),
                    style: const TextStyle(color: Color(0xff240b36)),
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Color(0xff0083B0),
                      ),
                      hintText: "Email",
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
                    color: const Color(0xffEEEEEE),
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: !showPassword,
                    cursorColor: const Color(0xff0083B0),
                    style: const TextStyle(color: Color(0xff240b36)),
                    decoration: InputDecoration(
                      focusColor: const Color(0xff0083B0),
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
                const SizedBox(height: 5),
                AnimatedSize(
                  duration: const Duration(milliseconds: 400),
                  child: passwordErrorWidget(),
                ),
                TextButton(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    width: 375,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.white, Colors.white],
                      ),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                    ),
                    child: Text(
                      "Upload profile picture".toUpperCase(),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  onPressed: () async {
                    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                    final ImagePicker picker = ImagePicker();
                    final XFile? image = await picker.pickImage(
                      source: ImageSource.gallery,
                    );

                    if (image == null) {
                      Fluttertoast.showToast(
                        msg: "No photo was selected or invalid",
                        textColor: Colors.black87,
                        backgroundColor: Colors.white,
                        toastLength: Toast.LENGTH_LONG,
                        fontSize: 12,
                      );
                    } else {
                      Fluttertoast.showToast(
                        msg: "Photo was selected",
                        textColor: Colors.black87,
                        backgroundColor: Colors.white,
                        toastLength: Toast.LENGTH_LONG,
                        fontSize: 12,
                      );
                    }

                    setState(() {
                      profileImage = image;
                    });
                  },
                ),
                TextButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    showErrors = true;

                    String? imagePath =
                        profileImage == null ? null : profileImage!.path;

                    if (isValid) {
                      isLoading = true;
                      AuthBloc.addEventWithoutContext(
                        AuthEvent.signUpUsingUsername(
                          userName: userNameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          profileImage: imagePath,
                        ),
                      );
                    }
                    setState(() {});
                  },
                  child: isLoading
                      ? const SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          height: 54,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [(Color(0xff00B4DB)), Color(0xff0083B0)],
                            ),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[200],
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
                      const Text(
                        "Already a member? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        child: const Text(
                          "Login Now",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 129, 240),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginPage(),
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
