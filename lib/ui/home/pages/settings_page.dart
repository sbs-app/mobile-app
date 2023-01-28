import 'package:classroom/core/strings.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:classroom/ui/home/pages/bug_report_page.dart';
import 'package:classroom/ui/home/pages/update_profile_page.dart';
import 'package:classroom/ui/home/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
    final String userName = getUserModel().userName;
    final String email = getUserModel().email;

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            tileColor: Colors.grey[900],
                            leading: const UserAvatar(
                              height: 35,
                              width: 35,
                            ),
                            title: Text(
                              userName,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  email,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          createSettingTitle(
                            Icons.person,
                            "Update profile",
                            const UpdateProfilePage(),
                          ),
                          createSettingTitle(
                            Icons.bug_report,
                            "Report Bug",
                            const ReportBugPage(),
                          ),
                          createSettingTitle(
                            Icons.balance,
                            "Licenses",
                            const LicensePage(
                              applicationName: "Classroom App",
                              applicationIcon: Icon(Icons.class_),
                              applicationLegalese:
                                  "Copyright (c) 2023 Andrew, Shafil, Suraj",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget createSettingTitle(IconData icon, String name, Widget page) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => page,
          ),
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          tileColor: Colors.grey[900],
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              Text(
                name,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
          trailing: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
