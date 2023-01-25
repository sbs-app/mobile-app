import 'package:classroom/core/strings.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:hive/hive.dart';

final bool isUserLoggedIn = getIt<Box>().get(HiveBoxNames.user) != null
    ? (getIt<Box>().get(HiveBoxNames.user) as UserModel).roleId != null
    : false;
