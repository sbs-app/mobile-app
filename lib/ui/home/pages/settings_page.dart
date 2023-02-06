import 'package:classroom/core/user_utils.dart';
import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:classroom/ui/home/pages/bug_report_page.dart';
import 'package:classroom/ui/home/pages/onboarding_page.dart';
import 'package:classroom/ui/home/pages/update_profile_page.dart';
import 'package:classroom/ui/home/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                            leading: UserAvatar(
                              userModel: getUserModel(),
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
                            MaterialPageRoute(
                              builder: (_) => const UpdateProfilePage(),
                            ),
                          ),
                          createSettingTitle(
                            Icons.edit_notifications,
                            "Notificatons",
                            MaterialPageRoute(
                              builder: (_) => const ReportBugPage(),
                            ),
                          ),
                          createSettingTitle(
                            Icons.bug_report,
                            "Report Bug",
                            MaterialPageRoute(
                              builder: (_) => const ReportBugPage(),
                            ),
                          ),
                          createSettingTitle(
                            Icons.restart_alt,
                            "View onboarding",
                            MaterialPageRoute(
                              builder: (_) => OnboardingPage(),
                            ),
                          ),
                          createSettingTitle(
                            Icons.balance,
                            "Licenses",
                            MaterialPageRoute(
                              builder: (context) => Theme(
                                data: ThemeData.light().copyWith(
                                  textTheme: GoogleFonts.montserratTextTheme(),
                                  appBarTheme:
                                      const AppBarTheme(color: Colors.black),
                                ),
                                child: const LicensePage(
                                  applicationName: "ClassMate",
                                  applicationIcon: Icon(Icons.class_),
                                  applicationLegalese:
                                      "Copyright © 2023 Andrew, Shafil, Suraj\n"
                                      "ClassMate is licensed under the MIT license.\n"
                                      "Image(s) used under license from Shutterstock.com.\n"
                                      "SIL Open Font License (OFL)",
                                ),
                              ),
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

  Widget createSettingTitle(
    IconData icon,
    String name,
    MaterialPageRoute route,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          route,
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
