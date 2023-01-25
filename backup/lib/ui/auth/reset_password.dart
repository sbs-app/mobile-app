import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/ui/auth/auth.dart';
import 'package:studentapp/helpers/helpers.dart';
import 'package:studentapp/controllers/controllers.dart';

class ResetPasswordUI extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ResetPasswordUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 48.0),
                  TextFormField(
                    controller: authController.emailController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.email), hintText: "Email"),
                    validator: Validator().email,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) =>
                        authController.emailController.text = value as String,
                  ),
                  // FormVerticalSpace(),
                  TextButton(
                      child: Text('auth.resetPasswordButton'.tr),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await authController.sendPasswordResetEmail(context);
                        }
                      }),
                  // FormVerticalSpace(),
                  signInLink(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  appBar(BuildContext context) {
    if (authController.emailController.text == '') {
      return null;
    }
    return AppBar(title: Text('auth.resetPasswordTitle'.tr));
  }

  signInLink(BuildContext context) {
    if (authController.emailController.text == '') {
      return TextButton(
        child: Text('auth.signInonResetPasswordLabelButton'.tr),
        onPressed: () => Get.offAll(() => LoginUI()),
      );
    }
    return const SizedBox(width: 0, height: 0);
  }
}
