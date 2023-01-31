import 'package:classroom/core/strings.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:hive/hive.dart';

UserModel getUserModel() {
  if (getIt<Box>().get(HiveBoxNames.user) != null) {
    return getIt<Box>().get(HiveBoxNames.user) as UserModel;
  } else {
    // Invalid UserModel
    return UserModel(
      email: "",
      id: "",
      userName: "",
      photoURL: "",
      classes: [],
    );
  }
}
