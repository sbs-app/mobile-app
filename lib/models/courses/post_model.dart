import 'package:classroom/core/strings.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

class PostModel {
  const PostModel({
    required this.id,
    required this.docid,
    required this.post,
    required this.type,
    required this.timestamp,
  });

  final String id;
  final String docid;
  final String post;
  final String type;
  final Timestamp timestamp;

  bool get isCreatedByMe =>
      (getIt<Box>().get(HiveBoxNames.user) as UserModel).id == id;

  factory PostModel.fromFirestore(Map data) => PostModel(
        id: data['id']! as String,
        docid: data['docid']! as String,
        post: data['post']! as String,
        type: data['type']! as String,
        timestamp: data['timestamp']! as Timestamp,
      );

  PostModel copyWith({
    String? id,
    String? docid,
    String? type,
    String? post,
    Timestamp? timestamp,
  }) =>
      PostModel(
        id: id ?? this.id,
        docid: docid ?? this.docid,
        post: post ?? this.post,
        type: type ?? this.type,
        timestamp: timestamp ?? this.timestamp,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "docid": docid,
        "post": post,
        "type": type,
        "timestamp": timestamp,
      };
}
