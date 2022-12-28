import 'package:flutter/material.dart';
import 'package:studentapp/controllers/controllers.dart';
import 'package:get/get.dart';

class CalendarUI extends StatelessWidget {
  CalendarUI({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      // ignore: unnecessary_null_comparison
      builder: (controller) => controller.firestoreUser.value!.uid == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  color: Colors.transparent,
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xff0f0c29),
                        Color(0xff302b63),
                        Color(0xff24243e)
                      ]),
                ),
              ))),
    );
  }
}
