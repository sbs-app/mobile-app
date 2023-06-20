class HiveBoxNames {
  static const user = "USER_MODEL";
}

class UserTypes {
  static const student = 0;
  static const teacher = 1;
  static const parent = 2;

  String typeToString(int type) {
    switch (type) {
      case 0:
        return "Student";
      case 1:
        return "Teacher";
      case 2:
        return "Parent";
      default:
        return "Student";
    }
  }
}

class PostTypes {
  static const allTypes = [text, image];
  static const text = "text";
  static const image = "image";
}

class SocialTypes {
  static const allTypes = [twitter, instagram];
  static const twitter = "twitter";
  static const instagram = "instagram";
}
