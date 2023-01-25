// User types
const List<String> userTypes = ["student", "parent", "teacher"];

// User model
class UserModel {
  final String uid;
  final String email;
  final String name;
  final String type;
  final String photoUrl;
  final List<String> classes;

  UserModel(
      {required this.uid,
      required this.email,
      required this.name,
      required this.type,
      required this.photoUrl,
      required this.classes});

  factory UserModel.fromMap(Map data) {
    // Handle class array
    List<String> classes = List<String>.from(data['classes']);

    return UserModel(
      uid: data['uid'],
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      type: data['type'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
      classes: classes,
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "type": type,
        "photoUrl": photoUrl,
        "classes": classes
      };
}
