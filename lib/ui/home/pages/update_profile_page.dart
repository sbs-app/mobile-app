import 'package:classroom/core/strings.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:classroom/ui/auth/pages/role_selection_page.dart';
import 'package:classroom/ui/home/widgets/user_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
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
    final int roleId = getUserModel().roleId!;

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Column(
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
                                "Update profile".toUpperCase(),
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
                              subtitle: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    const UserAvatar(
                                      height: 60,
                                      width: 60,
                                    ),
                                    const Divider(),
                                    Text(
                                      userName,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      roleId == 0 ? "Student" : "Teacher",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
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
                            ),
                            const Divider(),
                            createSettingTitle(
                              Icons.person_search,
                              "Change name",
                              () {
                                final TextEditingController newName =
                                    TextEditingController();
                                return showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Change name'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            controller: newName,
                                            decoration: const InputDecoration(
                                              icon: Icon(
                                                Icons.person_search,
                                                color: Colors.black,
                                              ),
                                              hintText: "Enter new name",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                          child: const Text('OK'),
                                          onPressed: () {
                                            AuthBloc.addEventWithoutContext(
                                              AuthEvent.updateUser(
                                                getUserModel().copyWith(
                                                  userName: newName.text,
                                                ),
                                              ),
                                            );

                                            Fluttertoast.showToast(
                                              msg: "Name updated!",
                                              textColor: Colors.black87,
                                              backgroundColor: Colors.white,
                                              toastLength: Toast.LENGTH_LONG,
                                              fontSize: 12,
                                            );
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                          child: const Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            createSettingTitle(
                              Icons.person_pin_circle,
                              "Change profile image",
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const UpdateProfilePage(),
                                  ),
                                );
                              },
                            ),
                            createSettingTitle(
                              Icons.email,
                              "Change email",
                              () {
                                final TextEditingController oldPass =
                                    TextEditingController();
                                final TextEditingController newEmail =
                                    TextEditingController();
                                return showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Change email'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            controller: oldPass,
                                            obscureText: true,
                                            decoration: const InputDecoration(
                                              icon: Icon(
                                                Icons.password,
                                                color: Colors.black,
                                              ),
                                              hintText:
                                                  "Enter current password",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: newEmail,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: const InputDecoration(
                                              icon: Icon(
                                                Icons.email,
                                                color: Colors.black,
                                              ),
                                              hintText: "Enter new email",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                          child: const Text('OK'),
                                          onPressed: () async {
                                            try {
                                              await FirebaseAuth.instance
                                                  .signInWithEmailAndPassword(
                                                email: getUserModel().email,
                                                password: oldPass.text,
                                              )
                                                  .then((firebaseUser) async {
                                                await firebaseUser.user!
                                                    .updateEmail(newEmail.text);
                                              });
                                            } catch (err) {
                                              Fluttertoast.showToast(
                                                msg: "Error: $err",
                                                textColor: Colors.black87,
                                                backgroundColor: Colors.white,
                                                toastLength: Toast.LENGTH_LONG,
                                                fontSize: 12,
                                              );
                                              return;
                                            }

                                            AuthBloc.addEventWithoutContext(
                                              AuthEvent.updateUser(
                                                getUserModel().copyWith(
                                                  email: newEmail.text,
                                                ),
                                              ),
                                            );

                                            Fluttertoast.showToast(
                                              msg: "Email updated!",
                                              textColor: Colors.black87,
                                              backgroundColor: Colors.white,
                                              toastLength: Toast.LENGTH_LONG,
                                              fontSize: 12,
                                            );
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                          child: const Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            createSettingTitle(
                              Icons.password,
                              "Change password",
                              () {
                                final TextEditingController oldPass =
                                    TextEditingController();
                                final TextEditingController newPass =
                                    TextEditingController();
                                return showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Change password'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            controller: oldPass,
                                            obscureText: true,
                                            decoration: const InputDecoration(
                                              icon: Icon(
                                                Icons.password,
                                                color: Colors.black,
                                              ),
                                              hintText:
                                                  "Enter current password",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: newPass,
                                            obscureText: true,
                                            decoration: const InputDecoration(
                                              icon: Icon(
                                                Icons.password,
                                                color: Colors.black,
                                              ),
                                              hintText: "Enter new password",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                          child: const Text('OK'),
                                          onPressed: () async {
                                            try {
                                              await FirebaseAuth.instance
                                                  .signInWithEmailAndPassword(
                                                email: getUserModel().email,
                                                password: oldPass.text,
                                              )
                                                  .then((firebaseUser) async {
                                                await firebaseUser.user!
                                                    .updatePassword(
                                                        newPass.text);
                                              });
                                            } catch (err) {
                                              Fluttertoast.showToast(
                                                msg: "Error: $err",
                                                textColor: Colors.black87,
                                                backgroundColor: Colors.white,
                                                toastLength: Toast.LENGTH_LONG,
                                                fontSize: 12,
                                              );
                                              return;
                                            }
                                            Fluttertoast.showToast(
                                              msg: "Password updated!",
                                              textColor: Colors.black87,
                                              backgroundColor: Colors.white,
                                              toastLength: Toast.LENGTH_LONG,
                                              fontSize: 12,
                                            );
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                          child: const Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            createSettingTitle(
                              Icons.repeat,
                              roleId == 0
                                  ? "Change to Teacher"
                                  : "Change to Student",
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const RoleSelectionPage(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget createSettingTitle(IconData icon, String name, Function()? function) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: function,
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
