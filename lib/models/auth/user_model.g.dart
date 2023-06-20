// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    String getLinkedStudent(Map<int, dynamic> rawData) =>
        (rawData[6] != null) ? rawData[6] as String : '';
    List<int> getAbsenceInfo(Map<int, dynamic> rawData) =>
        (rawData[7] != null) ? (rawData[7] as List).cast<int>() : <int>[-1, -1];
    List<String> getSocials(Map<int, dynamic> rawData) =>
        (rawData[8] != null) ? (rawData[8] as List).cast<String>() : <String>[];
    return UserModel(
      roleId: fields[0] as int?,
      email: fields[1] as String,
      id: fields[3] as String,
      photoURL: fields[5] as String,
      userName: fields[2] as String,
      classes: (fields[4] as List).cast<String>(),
      link: getLinkedStudent(fields),
      absence: getAbsenceInfo(fields),
      socials: getSocials(fields),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.roleId)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.classes)
      ..writeByte(5)
      ..write(obj.photoURL)
      ..writeByte(6)
      ..write(obj.link)
      ..writeByte(7)
      ..write(obj.absence)
      ..writeByte(8)
      ..write(obj.socials);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
