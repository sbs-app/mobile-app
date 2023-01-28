import 'package:classroom/core/strings.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white10,
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: FirebaseAuth.instance.currentUser!.photoURL == null
            ? Image.asset(
                "assets/auth/man.png",
                fit: BoxFit.cover,
              )
            : Image.network(
                FirebaseAuth.instance.currentUser!.photoURL!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
