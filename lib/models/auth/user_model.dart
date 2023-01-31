import 'package:hive/hive.dart';

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

  factory UserModel.fromFirestore(Map data) {
    final List<String> classes = List<String>.from(data['classes']! as List);
    return UserModel(
      email: data['email']! as String,
      id: data['id']! as String,
      photoURL: data['photoURL']! as String,
      roleId: data['roleId']! as int,
      userName: data['userName']! as String,
      classes: classes,
    );
  }

  UserModel copyWith({
    int? roleId,
    String? email,
    String? userName,
    String? id,
    String? photoURL,
    List<String>? classes,
  }) =>
      UserModel(
        email: email ?? this.email,
        id: id ?? this.id,
        photoURL: photoURL ?? this.photoURL,
        roleId: roleId ?? this.roleId,
        userName: userName ?? this.userName,
        classes: classes ?? this.classes,
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "userName": userName,
        "roleId": roleId,
        "id": id,
        "photoURL": photoURL,
        "classes": classes
      };
}
