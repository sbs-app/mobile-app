import 'dart:async';
import 'package:flutter/material.dart';
import 'package:studentapp/controllers/controllers.dart';
import 'package:studentapp/ui/components/components.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CreateClassUI extends StatelessWidget {
  CreateClassUI({super.key});

  final TextEditingController controller = TextEditingController();

  final AuthController authController = AuthController.to;
  final ClassController classController = ClassController.to;

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Create a class'.tr,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _buildLayoutSection(context),
      floatingActionButton: getActions(),
    );
  }

  Widget _buildLayoutSection(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [Color(0xff0f0c29), Color(0xff302b63), Color(0xff24243e)]),
      ),
      child: ListView(children: <Widget>[
        const Text(
          "Create a Class",
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        const Divider(
          color: Colors.white,
          height: 15,
          thickness: 2,
          indent: 190,
          endIndent: 0,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 40),
          child: Text(
            "Class name",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 23),
          ),
        ),
        Text(
          "Creating class as ${authController.firestoreUser.value!.name} (${authController.firestoreUser.value!.type}) \n TODO: Only show this if teacher.",
          textAlign: TextAlign.center,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
            child: TextField(
              controller: controller,
              cursorColor: const Color(0xff302b63),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: "Enter your class name",
                filled: true,
                fillColor: Colors.grey[600],
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30)),
              ),
            )),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RoundedLoadingButton(
            color: const Color.fromARGB(255, 26, 20, 95),
            controller: _btnController,
            onPressed: _createClass,
            successColor: Colors.green,
            child: const Text('Create', style: TextStyle(color: Colors.white)),
          ),
        )
      ]),
    );
  }

  void _createClass() async {
    // Create class
    String? classCode = classController.createNewClass(
        authController.firebaseUser.value!,
        authController.firestoreUser.value!,
        controller.text);

    // Make teacher join class as owner
    String? result = await classController.addClassToUser(
        classCode,
        authController.firebaseUser.value!,
        authController.firestoreUser.value!);
    if (result == null) {
      Get.snackbar('Class', 'Created new class: $classCode',
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
      _btnController.success();
    } else {
      Get.snackbar('Class', 'Error: $result',
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
      _btnController.error();
    }

    Timer(const Duration(seconds: 2), () {
      _btnController.reset();
    });
  }
}
