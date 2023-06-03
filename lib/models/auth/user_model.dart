import 'package:hive/hive.dart';
import 'package:http/http.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  UserModel({
    this.roleId,
    required this.email,
    required this.id,
    required this.photoURL,
    required this.userName,
    required this.classes,
    required this.link,
    required this.absence,
  });

  @HiveField(0)
  final int? roleId;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String userName;
  @HiveField(3)
  final String id;
  @HiveField(4)
  final List<String> classes;
  @HiveField(5)
  final String photoURL;
  @HiveField(6)
  final String link;
  @HiveField(7)
  final List<int> absence;

  factory UserModel.fromFirestore(Map data) {
    final List<String> classes = List<String>.from(data['classes']! as List);
    final List<int> absence = (data['absence'] != null)
        ? List<int>.from(data['absence']! as List)
        : <int>[-1, -1];

    String getLinkedStudent(Map<dynamic, dynamic> rawData) =>
        (rawData['link'] != null) ? rawData['link']! as String : '';

    return UserModel(
      email: data['email']! as String,
      id: data['id']! as String,
      photoURL: data['photoURL']! as String,
      roleId: data['roleId']! as int,
      userName: data['userName']! as String,
      classes: classes,
      link: getLinkedStudent(data),
      absence: absence,
    );
  }

  UserModel copyWith({
    int? roleId,
    String? email,
    String? userName,
    String? id,
    String? photoURL,
    String? link,
    List<String>? classes,
    List<int>? absence,
  }) =>
      UserModel(
        email: email ?? this.email,
        id: id ?? this.id,
        photoURL: photoURL ?? this.photoURL,
        roleId: roleId ?? this.roleId,
        userName: userName ?? this.userName,
        classes: classes ?? this.classes,
        link: link ?? this.link,
        absence: absence ?? this.absence,
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "userName": userName,
        "roleId": roleId,
        "id": id,
        "photoURL": photoURL,
        "classes": classes,
        "link": link,
        "absence": absence,
      };
}
