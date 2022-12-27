import 'dart:async';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studentapp/models/models.dart';
import 'package:studentapp/helpers/helpers.dart';

class ClassController extends GetxController {
  static ClassController to = Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Rxn<UserModel> firestoreClass = Rxn<UserModel>();

  // Get the firestore class from the firestore collection
  Future<UserModel> getFirestoreClass(String classCode) {
    return _db.doc('/classes/$classCode').get().then(
        (documentSnapshot) => UserModel.fromMap(documentSnapshot.data()!));
  }

  // Add class to firestore user
  Future<String?> addClassToUser(
      String newClass, User firebaseUser, UserModel firestoreUser) async {
    // Check if null or empty
    if (newClass.isEmpty) return "Class code is empty";

    // Check if class exists
    var classDoc = await _db.doc('/classes/$newClass').get();
    if (!classDoc.exists) return "Class does not exist.";

    // Check if user has class already
    if (firestoreUser.classes.contains(newClass)) return "Class already added.";

    // Add class to user
    UserModel current = firestoreUser;
    current.classes.add(newClass);
    _db.doc('/users/${firebaseUser.uid}').update(current.toJson());
    return null;
  }
}
