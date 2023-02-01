import 'dart:io';

import 'package:classroom/core/strings.dart';
import 'package:classroom/core/user.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:classroom/ui/auth/pages/role_selection_page.dart';
import 'package:classroom/ui/home/widgets/user_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
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
                                    UserAvatar(
                                      userModel: getUserModel(),
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
                                      roleId == UserTypes.student
                                          ? "Student"
                                          : "Teacher",
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
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25.0),
                                        ),
                                      ),
                                      title: const Text(
                                        'Change name',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            controller: newName,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            decoration: const InputDecoration(
                                              icon: Icon(
                                                Icons.person_search,
                                              ),
                                              hintText: "Enter new name",
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
                                          onPressed: () =>
                                              changeName(newName.text),
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
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25.0),
                                        ),
                                      ),
                                      title: const Text(
                                        'Change email',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            controller: oldPass,
                                            obscureText: true,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            decoration: const InputDecoration(
                                              icon: Icon(
                                                Icons.password,
                                              ),
                                              hintText:
                                                  "Enter current password",
                                            ),
                                          ),
                                          TextFormField(
                                            controller: newEmail,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            decoration: const InputDecoration(
                                              icon: Icon(
                                                Icons.email,
                                              ),
                                              hintText: "Enter new email",
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
                                          onPressed: () async => changeEmail(
                                            oldPass.text,
                                            newEmail.text,
                                          ),
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
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25.0),
                                        ),
                                      ),
                                      title: const Text(
                                        'Change password',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            controller: oldPass,
                                            obscureText: true,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            decoration: const InputDecoration(
                                              icon: Icon(
                                                Icons.password,
                                              ),
                                              hintText:
                                                  "Enter current password",
                                            ),
                                          ),
                                          TextFormField(
                                            controller: newPass,
                                            obscureText: true,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            decoration: const InputDecoration(
                                              icon: Icon(
                                                Icons.password,
                                              ),
                                              hintText: "Enter new password",
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
                                          onPressed: () async => changePassword(
                                            oldPass.text,
                                            newPass.text,
                                          ),
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
                              Icons.account_circle,
                              "Change profile image",
                              () {
                                final TextEditingController oldPass =
                                    TextEditingController();
                                return showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25.0),
                                        ),
                                      ),
                                      title: const Text(
                                        'Change profile image',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            controller: oldPass,
                                            obscureText: true,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            decoration: const InputDecoration(
                                              icon: Icon(
                                                Icons.password,
                                              ),
                                              hintText:
                                                  "Enter current password",
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
                                          child: const Text('Choose image'),
                                          onPressed: () async =>
                                              updatePhotoURL(oldPass.text),
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
                              "Change role",
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

  // Setting functions
  void changeName(String newName) {
    AuthBloc.addEventWithoutContext(
      AuthEvent.updateUser(
        getUserModel().copyWith(
          userName: newName,
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
  }

  Future<void> changeEmail(
    String oldPass,
    String newEmail,
  ) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: getUserModel().email,
        password: oldPass,
      )
          .then((firebaseUser) async {
        await firebaseUser.user!.updateEmail(newEmail);
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
          email: newEmail,
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
  }

  Future<void> changePassword(
    String oldPass,
    String newPass,
  ) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: getUserModel().email,
        password: oldPass,
      )
          .then((firebaseUser) async {
        await firebaseUser.user!.updatePassword(newPass);
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
  }

  Future<void> updatePhotoURL(String oldPass) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image == null) {
      Fluttertoast.showToast(
        msg: "No photo was selected or invalid",
        textColor: Colors.black87,
        backgroundColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        fontSize: 12,
      );
      return;
    }

    final Reference ref = FirebaseStorage.instance.ref().child(
          "profile-images/${getUserModel().id}.png",
        );

    final TaskSnapshot uploadTask = await ref.putFile(File(image.path));
    String imageURL = "";
    imageURL = await uploadTask.ref.getDownloadURL();

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: getUserModel().email,
        password: oldPass,
      )
          .then((firebaseUser) async {
        await firebaseUser.user!.updatePhotoURL(imageURL);
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
          photoURL: imageURL,
        ),
      ),
    );

    Fluttertoast.showToast(
      msg: "Profile updated!",
      textColor: Colors.black87,
      backgroundColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
      fontSize: 12,
    );
    Navigator.of(context).pop();
  }
}
