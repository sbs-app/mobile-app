import 'package:classroom/core/strings.dart';
import 'package:classroom/core/user_utils.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/models/courses/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

class CourseModel {
  const CourseModel({
    required this.id,
    required this.code,
    required this.name,
    this.description,
    this.teacher,
    this.students,
    this.posts,
  });

  final String id;
  final String code;
  final String name;
  final String? description;
  final UserModel? teacher;
  final List<UserModel>? students;
  final List<PostModel>? posts;

  bool get isCreatedByMe =>
      (getIt<Box>().get(HiveBoxNames.user) as UserModel).id == id;

  bool get isValid => id != "invalid";

  static Future<List<PostModel>> getCoursePosts(String classId) async {
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('/classes/$classId/posts');

    // Get docs from collection reference
    final QuerySnapshot querySnapshot = await collectionRef.get();

    // Get data from docs and convert map to List
    final allPosts =
        querySnapshot.docs.map((doc) => doc.data()! as Map).toList();

    final List<PostModel> posts = [];
    for (final Map? post in allPosts) {
      posts.add(PostModel.fromFirestore(post!));
    }

    return posts;
  }

  static Future<CourseModel> fromFirestore(Map? data) async {
    if (data == null || data.isEmpty) {
      // Invalid map, return invalid course model.
      return const CourseModel(
        id: "invalid",
        code: "invalid",
        name: "invalid",
      );
    }

    final List<String> studentIds =
        List<String>.from(data['students']! as List);

    final List<UserModel> students = <UserModel>[];

    for (final String id in studentIds) {
      students.add(await getFirestoreUser(id));
    }

    final UserModel teacher =
        await getFirestoreUser(data['teacher']! as String);

    final List<PostModel> posts = await getCoursePosts(data['code'] as String);

    return CourseModel(
      id: data['id']! as String,
      code: data['code']! as String,
      name: data['name']! as String,
      description: data['description']! as String,
      teacher: teacher,
      students: students,
      posts: posts,
    );
  }

  CourseModel copyWith({
    String? id,
    String? code,
    String? name,
    String? description,
    UserModel? teacher,
    List<UserModel>? students,
    List<PostModel>? posts,
  }) =>
      CourseModel(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        description: description ?? this.description,
        students: students ?? this.students,
        teacher: teacher ?? this.teacher,
        posts: posts ?? this.posts,
      );

  Map<String, dynamic> toJson() {
    final List<String> studentIds = [];

    for (final UserModel userModel in students!) {
      studentIds.add(userModel.id);
    }

    return {
      "id": id,
      "code": code,
      "name": name,
      "description": description,
      "teacher": teacher!.id,
      "students": studentIds,
    };
  }
}
