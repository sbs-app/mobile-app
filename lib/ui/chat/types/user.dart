import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

/// All possible roles user can have.
enum Role { admin, agent, moderator, user }

/// A class that represents user.
@JsonSerializable()
@immutable
abstract class User extends Equatable {
  /// Creates a user.
  const User._({
    this.name,
    required this.id,
    this.imageUrl,
    this.metadata,
    this.role,
  });

  const factory User({
    String? name,
    required String id,
    String? imageUrl,
    Map<String, dynamic>? metadata,
    Role? role,
  }) = _User;

  /// Creates user from a map (decoded JSON).
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Name of the user.
  final String? name;

  /// Unique ID of the user.
  final String id;

  /// Remote image URL representing user's avatar.
  final String? imageUrl;

  /// Additional custom metadata or attributes related to the user.
  final Map<String, dynamic>? metadata;

  /// User [Role].
  final Role? role;

  /// Equatable props.
  @override
  List<Object?> get props => [
        name,
        id,
        imageUrl,
        metadata,
        role,
      ];

  User copyWith({
    String? name,
    String? id,
    String? imageUrl,
    Map<String, dynamic>? metadata,
    Role? role,
  });

  /// Converts user to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

/// A utility class to enable better copyWith.
class _User extends User {
  const _User({
    super.name,
    required super.id,
    super.imageUrl,
    super.metadata,
    super.role,
  }) : super._();

  @override
  User copyWith({
    dynamic name = _Unset,
    String? id,
    dynamic imageUrl = _Unset,
    dynamic metadata = _Unset,
    dynamic role = _Unset,
  }) =>
      _User(
        name: name == _Unset ? this.name : name as String?,
        id: id ?? this.id,
        imageUrl: imageUrl == _Unset ? this.imageUrl : imageUrl as String?,
        metadata: metadata == _Unset
            ? this.metadata
            : metadata as Map<String, dynamic>?,
        role: role == _Unset ? this.role : role as Role?,
      );
}

class _Unset {}
