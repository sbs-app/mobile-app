import 'package:classroom/core/strings.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      link: '',
      absence: [-1, -1],
      socials: [],
    );
  }
}

void forceUserModelUpdate() async {
  await getIt<Box>()
      .put(HiveBoxNames.user, await getFirestoreUser(getUserModel().id));
}

Future<UserModel> getFirestoreUser(String userId) async {
  return FirebaseFirestore.instance.doc('/users/$userId').get().then(
        (documentSnapshot) => UserModel.fromFirestore(documentSnapshot.data()!),
      );
}
