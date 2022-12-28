// Class model
class ClassModel {
  final String name;
  final String code;
  final String uid;
  final String teacher;

  ClassModel(
      {required this.name,
      required this.code,
      required this.uid,
      required this.teacher});

  factory ClassModel.fromMap(Map data) {
    return ClassModel(
        name: data['name'] ?? '',
        code: data['code'] ?? '',
        uid: data['uid'] ?? '',
        teacher: data['teacher'] ?? '');
  }

  Map<String, dynamic> toJson() =>
      {"name": name, "code": code, "uid": uid, "teacher": teacher};
}
