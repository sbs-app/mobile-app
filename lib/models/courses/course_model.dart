import 'package:classroom/core/strings.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/models/auth/user_model.dart';
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
  final String? teacher;
  final List<String>? students;
  final List<String>? posts;

  bool get isCreatedByMe =>
      (getIt<Box>().get(HiveBoxNames.user) as UserModel).id == id;

  factory CourseModel.fromFirestore(Map data) {
    final List<String> students = List<String>.from(data['students']! as List);

    final List<String> posts = List<String>.from(data['posts']! as List);

    return CourseModel(
      id: data['id']! as String,
      code: data['code']! as String,
      name: data['name']! as String,
      description: data['description']! as String,
      teacher: data['teacher']! as String,
      students: students,
      posts: posts,
    );
  }

  CourseModel copyWith({
    String? id,
    String? code,
    String? name,
    String? description,
    String? teacher,
    List<String>? students,
    List<String>? posts,
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "description": description,
        "teacher": teacher,
        "students": students,
        "posts": posts
      };
}
