// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['userName'] as String?,
      id: json['id'] as String,
      imageUrl: json['photoURL'] as String?,
      metadata: const <String, dynamic>{},
      role: Role.user,
    );

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['id'] = instance.id;
  writeNotNull('photoURL', instance.imageUrl);
  // writeNotNull('metadata', instance.metadata);
  return val;
}

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.agent: 'agent',
  Role.moderator: 'moderator',
  Role.user: 'user',
};
