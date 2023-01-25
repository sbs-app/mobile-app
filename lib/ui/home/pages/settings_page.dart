import 'package:cached_network_image/cached_network_image.dart';
import 'package:classroom/core/strings.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/models/courses/course_model.dart';
import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:classroom/states/course/course_bloc.dart';
import 'package:classroom/ui/auth/pages/login_page.dart';
import 'package:classroom/ui/home/pages/course_page.dart';
import 'package:classroom/ui/home/pages/create_course_page.dart';
import 'package:classroom/ui/home/widgets/user_avatar.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:fancy_text_reveal/fancy_text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Map<String, Color>> coverUrls = [
    {"breakfast": const Color(0xffFF8A66)},
    {"code": const Color(0xff566E7A)},
    {"learnlanguage": const Color(0xff3367D5)},
    {"cooking": const Color(0xff848484)},
    {"mealfamily": const Color(0xff4FC2F8)},
    {"read": const Color(0xff566E7A)},
    {"handcraft": const Color(0xff8E22A9)},
  ];
  late CustomPopupMenuController controller;

  @override
  void initState() {
    controller = CustomPopupMenuController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  UserModel getUserModel() {
    if (getIt<Box>().get(HiveBoxNames.user) != null) {
      return getIt<Box>().get(HiveBoxNames.user) as UserModel;
    } else {
      // Invalid UserModel
      return UserModel(email: "", id: "", userName: "", classes: []);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final bool isUserStudent = getUserModel().roleId == 0;
        final String userEmail = getUserModel().email;
        final String userName = getUserModel().userName;

        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.transparent,
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Settings".toUpperCase(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                      ],
                    ),
                  ],
                ),
                Expanded(
                    child: TextButton.icon(
                        onPressed: () {
                          //
                        },
                        icon: Icon(Icons.replay_outlined),
                        label: Text("Reload data"))),
              ],
            ),
          ),
        );
      },
    );
  }
}
