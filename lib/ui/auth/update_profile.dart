import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:studentapp/models/models.dart';
import 'package:studentapp/helpers/helpers.dart';
import 'package:studentapp/controllers/controllers.dart';
import 'package:studentapp/ui/auth/auth.dart';

class UpdateProfileUI extends StatelessWidget {
  UpdateProfileUI({super.key});

  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    authController.nameController.text =
        authController.firestoreUser.value!.name;
    authController.emailController.text =
        authController.firestoreUser.value!.email;
    return Scaffold(
      appBar: AppBar(title: Text('auth.updateProfileTitle'.tr)),
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
                    controller: authController.nameController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.person), hintText: 'Name'),
                    validator: Validator().name,
                    onSaved: (value) =>
                        authController.nameController.text = value!,
                  ),
                  // FormVerticalSpace(),
                  TextFormField(
                    controller: authController.emailController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.email), hintText: "Email"),
                    validator: Validator().email,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) =>
                        authController.emailController.text = value!,
                  ),
                  // FormVerticalSpace(),
                  TextButton(
                      child: Text('auth.updateUser'.tr),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          SystemChannels.textInput
                              .invokeMethod('TextInput.hide');
                          UserModel updatedUser = UserModel(
                              uid: authController.firestoreUser.value!.uid,
                              name: authController.nameController.text,
                              email: authController.emailController.text,
                              type: userTypes[0], // student
                              photoUrl:
                                  authController.firestoreUser.value!.photoUrl);
                          _updateUserConfirm(context, updatedUser,
                              authController.firestoreUser.value!.email);
                        }
                      }),
                  // FormVerticalSpace(),
                  TextButton(
                    child: Text('auth.resetPasswordLabelButton'.tr),
                    onPressed: () => Get.to(ResetPasswordUI()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updateUserConfirm(
      BuildContext context, UserModel updatedUser, String oldEmail) async {
    final AuthController authController = AuthController.to;
    final TextEditingController password = TextEditingController();
    return Get.dialog(
      AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        title: Text(
          'auth.enterPassword'.tr,
        ),
        content: TextFormField(
          controller: password,
          decoration: const InputDecoration(
              icon: Icon(Icons.lock), hintText: "Password"),
          validator: Validator().password,
          obscureText: true,
          onSaved: (value) => password.text = value!,
          maxLines: 1,
        ),
        actions: <Widget>[
          TextButton(
            child: Text('auth.cancel'.tr.toUpperCase()),
            onPressed: () {
              Get.back();
            },
          ),
          TextButton(
            child: Text('auth.submit'.tr.toUpperCase()),
            onPressed: () async {
              Get.back();
              await authController.updateUser(
                  context, updatedUser, oldEmail, password.text);
            },
          )
        ],
      ),
    );
  }
}
