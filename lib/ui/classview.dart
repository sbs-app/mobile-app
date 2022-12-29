import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:studentapp/controllers/controllers.dart';
import 'package:studentapp/models/models.dart';
import 'package:studentapp/ui/components/actions.dart';
import 'package:studentapp/ui/ui.dart';
import 'package:get/get.dart';

class ClassViewUI extends StatelessWidget {
  ClassViewUI({super.key});

  final AuthController authController = AuthController.to;
  final ClassController classController = ClassController.to;

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
            'View Classes'.tr,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: _buildLayoutSection(context),
        floatingActionButton: getActions());
  }

  Widget _buildLayoutSection(BuildContext context) {
    final List<String> classes = authController.firestoreUser.value!.classes;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [Color(0xff0f0c29), Color(0xff302b63), Color(0xff24243e)]),
      ),
      child: ListView(children: <Widget>[
        const Text(
          "View classes",
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
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: classes.isEmpty
              ? const Text("No classes joined.")
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: classes.length,
                  itemBuilder: (context, int index) =>
                      classInfoCard(context, classes, index),
                ),
        ),
      ]),
    );
  }

  Widget classInfoCard(BuildContext context, List<String> classes, int index) {
    Future<ClassModel> classInfoFuture =
        classController.getFirestoreClass(classes[index]);
    return FutureBuilder(
      future: classInfoFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ClassModel classInfo = snapshot.data as ClassModel;
          return Card(
            color: Color.fromARGB(255, 66, 61, 127),
            child: Column(
              children: [
                ListTile(
                    leading: const Icon(
                      Icons.school,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(
                            color: Color.fromARGB(255, 17, 146, 238),
                            blurRadius: 10.0)
                      ],
                    ),
                    title: Text('Name: ${classInfo.name}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Teacher: ${classInfo.teacher}'),
                        Text('Code: ${classInfo.code}'),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    NeumorphicButton(
                      style: NeumorphicStyle(
                        intensity: 0.7,
                        surfaceIntensity: 0,
                        shape: NeumorphicShape.convex,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20)),
                        lightSource: LightSource.topLeft,
                        depth: 8, //customize depth here
                        color: Color.fromARGB(
                            244, 57, 51, 237), //customize color here
                      ),
                      child: const Text('Leave class'),
                      onPressed: () {
                        String? result = classController.removeClassFromUser(
                            classInfo.code,
                            authController.firebaseUser.value!,
                            authController.firestoreUser.value!);
                        if (result == null) {
                          Get.snackbar('Class', 'The class was removed.',
                              backgroundColor:
                                  Get.theme.snackBarTheme.backgroundColor,
                              colorText:
                                  Get.theme.snackBarTheme.actionTextColor);
                          // Reload the page
                          Get.to(() => HomeUI());
                        } else {
                          Get.snackbar('Class', 'Error: $result',
                              backgroundColor:
                                  Get.theme.snackBarTheme.backgroundColor,
                              colorText:
                                  Get.theme.snackBarTheme.actionTextColor);
                        }
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const Text("...");
        }
      },
    );
  }
}
