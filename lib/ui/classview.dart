import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
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
            color: const Color.fromARGB(255, 66, 61, 127),
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
                        if (classInfo.uid ==
                            authController.firebaseUser.value!.uid)
                          const Text(
                            'You own this class.',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    if (classInfo.uid == authController.firebaseUser.value!.uid)
                      AnimatedButton(
                        onPress: () {
                          Get.snackbar("Edit class", "You own this class.");
                        },
                        text: ('Edit class'),
                        height: 30,
                        width: 80,
                        isReverse: true,
                        borderRadius: 20,
                        textStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                        animationDuration: Duration(milliseconds: 10),
                      ),
                    Container(margin: EdgeInsets.only(right: 126)),
                    AnimatedButton(
                      height: 30,
                      width: 150,
                      animationDuration: Duration(milliseconds: 10),
                      text: ("Leave Class"),
                      textStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                      gradient:
                          LinearGradient(colors: [Colors.black, Colors.blue]),
                      selectedGradientColor: LinearGradient(
                          colors: [Colors.yellow, Colors.purple]),
                      selectedTextColor: Colors.white,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      isReverse: true,
                      borderColor: Colors.white,
                      borderRadius: 20,
                      onPress: () {
                        String? result = classController.removeClassFromUser(
                            classInfo.code,
                            authController.firebaseUser.value!,
                            authController.firestoreUser.value!);
                        if (result == null) {
                          Get.snackbar('Class', 'You left the class.',
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
