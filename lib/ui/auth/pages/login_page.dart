import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:classroom/ui/auth/pages/role_selection_page.dart';
import 'package:classroom/ui/auth/pages/sign_up_page.dart';
import 'package:classroom/ui/core/validator.dart';
import 'package:fancy_text_reveal/fancy_text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
              : const Text(
                  "Email is invalid",
                  style: TextStyle(color: Colors.white24),
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
              : const Text(
                  "Password must contain minimum 8 characters, at least one letter and one number",
                  style: TextStyle(color: Colors.white24),
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
        state.signInUsingGoogleOption.fold(
          () => null,
          (some) => some.fold(
            (l) {
              Fluttertoast.showToast(
                msg: l.maybeMap(
                  orElse: () => "",
                  googleSignInAborted: (_) => "Google SignIn Aborted",
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
        return SafeArea(
            child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                color: Color.fromARGB(235, 91, 2, 57),
                gradient: LinearGradient(
                  colors: [(Color(0xff00B4DB)), Color(0xff0083B0)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.all(40.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FancyTextReveal(
                      properties: Properties(
                        milliseconds: 400,
                        // horizontalSpacing: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Please sign in to continue.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),

                    const SizedBox(height: 5),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 400),
                      child: passwordErrorWidget(),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(bottom: 2),
                            child: Icon(
                              Icons.mail_outline_outlined,
                              size: 18,
                              color: Colors.black12,
                            ),
                          ),
                          focusColor: Colors.black,
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Email",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 400),
                      child: emailErrorWidget(),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: !showPassword,
                        decoration: InputDecoration(
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
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(bottom: 3),
                            child: Icon(
                              Icons.vpn_key_outlined,
                              size: 18,
                              color: Colors.black12,
                            ),
                          ),
                          focusColor: Colors.black,
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Password",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: double.maxFinite,
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
                          backgroundColor: isValid
                              ? MaterialStateProperty.all(
                                  const Color(0xff0DF5E3),
                                )
                              : MaterialStateProperty.all(
                                  Color.fromARGB(240, 125, 115, 115)),
                        ),
                        child: isLoading
                            ? const SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.black,
                                ),
                              )
                            : const Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1),
                              color: Colors.white10,
                            ),
                          ),
                        ),
                        const Text(
                          "OR",
                          style: TextStyle(color: Colors.white10),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1),
                              color: Colors.white10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    //const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignUpPage(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account?",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff0DF5E3),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
      },
    );
  }
}
