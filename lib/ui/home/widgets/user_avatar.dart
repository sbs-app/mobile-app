import 'package:classroom/models/auth/user_model.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.userModel,
    required this.height,
    required this.width,
  });

  final UserModel userModel;
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
        child: userModel.photoURL.isEmpty
            ? Image.asset(
                "assets/auth/man.png",
                fit: BoxFit.cover,
              )
            : Image.network(
                userModel.photoURL,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
