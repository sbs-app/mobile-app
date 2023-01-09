import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studentapp/models/models.dart';

class ClassController extends GetxController {
  static ClassController to = Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Rxn<ClassModel> firestoreClass = Rxn<ClassModel>();

  final Random _rnd = Random();

  String getRandomCode() {
    int length = 8;
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(_rnd.nextInt(chars.length))));
  }

  String createNewClass(
      User firebaseUser, UserModel firestoreUser, String className) {
    String code = getRandomCode();
    ClassModel newClass = ClassModel(
        name: className,
        code: code,
        uid: firebaseUser.uid,
        teacher: firestoreUser.name);

    _db.doc('/classes/$code').set(newClass.toJson());
    update();
    return code;
  }

  // Get the firestore class from the firestore collection
  Future<ClassModel> getFirestoreClass(String classCode) {
    return _db.doc('/classes/$classCode').get().then(
        (documentSnapshot) => ClassModel.fromMap(documentSnapshot.data()!));
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

  String? removeClassFromUser(
      String classCode, User firebaseUser, UserModel firestoreUser) {
    // Check if null or empty
    if (classCode.isEmpty) return "Class code is empty";

    // Remove class from user
    UserModel current = firestoreUser;
    current.classes.remove(classCode);
    _db.doc('/users/${firebaseUser.uid}').update(current.toJson());
    return null;
  }
}
