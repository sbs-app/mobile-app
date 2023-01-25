// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String userName, String password)
        signUpUsingUsername,
    required TResult Function(String email, String password) signInUsingEmail,
    required TResult Function() signInUsingGoogle,
    required TResult Function(int roleId) registerRole,
    required TResult Function() switchRole,
    required TResult Function() signOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String userName, String password)?
        signUpUsingUsername,
    TResult? Function(String email, String password)? signInUsingEmail,
    TResult? Function()? signInUsingGoogle,
    TResult? Function(int roleId)? registerRole,
    TResult? Function()? switchRole,
    TResult? Function()? signOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String userName, String password)?
        signUpUsingUsername,
    TResult Function(String email, String password)? signInUsingEmail,
    TResult Function()? signInUsingGoogle,
    TResult Function(int roleId)? registerRole,
    TResult Function()? switchRole,
    TResult Function()? signOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignUpUsingUsername value) signUpUsingUsername,
    required TResult Function(_signInUsingEmail value) signInUsingEmail,
    required TResult Function(_SignInUsingGoogle value) signInUsingGoogle,
    required TResult Function(_RegisterUserRole value) registerRole,
    required TResult Function(_SwitchRole value) switchRole,
    required TResult Function(_SignOut value) signOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpUsingUsername value)? signUpUsingUsername,
    TResult? Function(_signInUsingEmail value)? signInUsingEmail,
    TResult? Function(_SignInUsingGoogle value)? signInUsingGoogle,
    TResult? Function(_RegisterUserRole value)? registerRole,
    TResult? Function(_SwitchRole value)? switchRole,
    TResult? Function(_SignOut value)? signOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpUsingUsername value)? signUpUsingUsername,
    TResult Function(_signInUsingEmail value)? signInUsingEmail,
    TResult Function(_SignInUsingGoogle value)? signInUsingGoogle,
    TResult Function(_RegisterUserRole value)? registerRole,
    TResult Function(_SwitchRole value)? switchRole,
    TResult Function(_SignOut value)? signOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SignUpUsingUsernameCopyWith<$Res> {
  factory _$$_SignUpUsingUsernameCopyWith(_$_SignUpUsingUsername value,
          $Res Function(_$_SignUpUsingUsername) then) =
      __$$_SignUpUsingUsernameCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String userName, String password});
}

/// @nodoc
class __$$_SignUpUsingUsernameCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_SignUpUsingUsername>
    implements _$$_SignUpUsingUsernameCopyWith<$Res> {
  __$$_SignUpUsingUsernameCopyWithImpl(_$_SignUpUsingUsername _value,
      $Res Function(_$_SignUpUsingUsername) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_$_SignUpUsingUsername(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignUpUsingUsername implements _SignUpUsingUsername {
  const _$_SignUpUsingUsername(
      {required this.email, required this.userName, required this.password});

  @override
  final String email;
  @override
  final String userName;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signUpUsingUsername(email: $email, userName: $userName, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpUsingUsername &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, userName, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpUsingUsernameCopyWith<_$_SignUpUsingUsername> get copyWith =>
      __$$_SignUpUsingUsernameCopyWithImpl<_$_SignUpUsingUsername>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String userName, String password)
        signUpUsingUsername,
    required TResult Function(String email, String password) signInUsingEmail,
    required TResult Function() signInUsingGoogle,
    required TResult Function(int roleId) registerRole,
    required TResult Function() switchRole,
    required TResult Function() signOut,
  }) {
    return signUpUsingUsername(email, userName, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String userName, String password)?
        signUpUsingUsername,
    TResult? Function(String email, String password)? signInUsingEmail,
    TResult? Function()? signInUsingGoogle,
    TResult? Function(int roleId)? registerRole,
    TResult? Function()? switchRole,
    TResult? Function()? signOut,
  }) {
    return signUpUsingUsername?.call(email, userName, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String userName, String password)?
        signUpUsingUsername,
    TResult Function(String email, String password)? signInUsingEmail,
    TResult Function()? signInUsingGoogle,
    TResult Function(int roleId)? registerRole,
    TResult Function()? switchRole,
    TResult Function()? signOut,
    required TResult orElse(),
  }) {
    if (signUpUsingUsername != null) {
      return signUpUsingUsername(email, userName, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignUpUsingUsername value) signUpUsingUsername,
    required TResult Function(_signInUsingEmail value) signInUsingEmail,
    required TResult Function(_SignInUsingGoogle value) signInUsingGoogle,
    required TResult Function(_RegisterUserRole value) registerRole,
    required TResult Function(_SwitchRole value) switchRole,
    required TResult Function(_SignOut value) signOut,
  }) {
    return signUpUsingUsername(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpUsingUsername value)? signUpUsingUsername,
    TResult? Function(_signInUsingEmail value)? signInUsingEmail,
    TResult? Function(_SignInUsingGoogle value)? signInUsingGoogle,
    TResult? Function(_RegisterUserRole value)? registerRole,
    TResult? Function(_SwitchRole value)? switchRole,
    TResult? Function(_SignOut value)? signOut,
  }) {
    return signUpUsingUsername?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpUsingUsername value)? signUpUsingUsername,
    TResult Function(_signInUsingEmail value)? signInUsingEmail,
    TResult Function(_SignInUsingGoogle value)? signInUsingGoogle,
    TResult Function(_RegisterUserRole value)? registerRole,
    TResult Function(_SwitchRole value)? switchRole,
    TResult Function(_SignOut value)? signOut,
    required TResult orElse(),
  }) {
    if (signUpUsingUsername != null) {
      return signUpUsingUsername(this);
    }
    return orElse();
  }
}

abstract class _SignUpUsingUsername implements AuthEvent {
  const factory _SignUpUsingUsername(
      {required final String email,
      required final String userName,
      required final String password}) = _$_SignUpUsingUsername;

  String get email;
  String get userName;
  String get password;
  @JsonKey(ignore: true)
  _$$_SignUpUsingUsernameCopyWith<_$_SignUpUsingUsername> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_signInUsingEmailCopyWith<$Res> {
  factory _$$_signInUsingEmailCopyWith(
          _$_signInUsingEmail value, $Res Function(_$_signInUsingEmail) then) =
      __$$_signInUsingEmailCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_signInUsingEmailCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_signInUsingEmail>
    implements _$$_signInUsingEmailCopyWith<$Res> {
  __$$_signInUsingEmailCopyWithImpl(
      _$_signInUsingEmail _value, $Res Function(_$_signInUsingEmail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_signInUsingEmail(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_signInUsingEmail implements _signInUsingEmail {
  const _$_signInUsingEmail({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signInUsingEmail(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_signInUsingEmail &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_signInUsingEmailCopyWith<_$_signInUsingEmail> get copyWith =>
      __$$_signInUsingEmailCopyWithImpl<_$_signInUsingEmail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String userName, String password)
        signUpUsingUsername,
    required TResult Function(String email, String password) signInUsingEmail,
    required TResult Function() signInUsingGoogle,
    required TResult Function(int roleId) registerRole,
    required TResult Function() switchRole,
    required TResult Function() signOut,
  }) {
    return signInUsingEmail(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String userName, String password)?
        signUpUsingUsername,
    TResult? Function(String email, String password)? signInUsingEmail,
    TResult? Function()? signInUsingGoogle,
    TResult? Function(int roleId)? registerRole,
    TResult? Function()? switchRole,
    TResult? Function()? signOut,
  }) {
    return signInUsingEmail?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String userName, String password)?
        signUpUsingUsername,
    TResult Function(String email, String password)? signInUsingEmail,
    TResult Function()? signInUsingGoogle,
    TResult Function(int roleId)? registerRole,
    TResult Function()? switchRole,
    TResult Function()? signOut,
    required TResult orElse(),
  }) {
    if (signInUsingEmail != null) {
      return signInUsingEmail(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignUpUsingUsername value) signUpUsingUsername,
    required TResult Function(_signInUsingEmail value) signInUsingEmail,
    required TResult Function(_SignInUsingGoogle value) signInUsingGoogle,
    required TResult Function(_RegisterUserRole value) registerRole,
    required TResult Function(_SwitchRole value) switchRole,
    required TResult Function(_SignOut value) signOut,
  }) {
    return signInUsingEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpUsingUsername value)? signUpUsingUsername,
    TResult? Function(_signInUsingEmail value)? signInUsingEmail,
    TResult? Function(_SignInUsingGoogle value)? signInUsingGoogle,
    TResult? Function(_RegisterUserRole value)? registerRole,
    TResult? Function(_SwitchRole value)? switchRole,
    TResult? Function(_SignOut value)? signOut,
  }) {
    return signInUsingEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpUsingUsername value)? signUpUsingUsername,
    TResult Function(_signInUsingEmail value)? signInUsingEmail,
    TResult Function(_SignInUsingGoogle value)? signInUsingGoogle,
    TResult Function(_RegisterUserRole value)? registerRole,
    TResult Function(_SwitchRole value)? switchRole,
    TResult Function(_SignOut value)? signOut,
    required TResult orElse(),
  }) {
    if (signInUsingEmail != null) {
      return signInUsingEmail(this);
    }
    return orElse();
  }
}

abstract class _signInUsingEmail implements AuthEvent {
  const factory _signInUsingEmail(
      {required final String email,
      required final String password}) = _$_signInUsingEmail;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$_signInUsingEmailCopyWith<_$_signInUsingEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignInUsingGoogleCopyWith<$Res> {
  factory _$$_SignInUsingGoogleCopyWith(_$_SignInUsingGoogle value,
          $Res Function(_$_SignInUsingGoogle) then) =
      __$$_SignInUsingGoogleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignInUsingGoogleCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_SignInUsingGoogle>
    implements _$$_SignInUsingGoogleCopyWith<$Res> {
  __$$_SignInUsingGoogleCopyWithImpl(
      _$_SignInUsingGoogle _value, $Res Function(_$_SignInUsingGoogle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignInUsingGoogle implements _SignInUsingGoogle {
  const _$_SignInUsingGoogle();

  @override
  String toString() {
    return 'AuthEvent.signInUsingGoogle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignInUsingGoogle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String userName, String password)
        signUpUsingUsername,
    required TResult Function(String email, String password) signInUsingEmail,
    required TResult Function() signInUsingGoogle,
    required TResult Function(int roleId) registerRole,
    required TResult Function() switchRole,
    required TResult Function() signOut,
  }) {
    return signInUsingGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String userName, String password)?
        signUpUsingUsername,
    TResult? Function(String email, String password)? signInUsingEmail,
    TResult? Function()? signInUsingGoogle,
    TResult? Function(int roleId)? registerRole,
    TResult? Function()? switchRole,
    TResult? Function()? signOut,
  }) {
    return signInUsingGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String userName, String password)?
        signUpUsingUsername,
    TResult Function(String email, String password)? signInUsingEmail,
    TResult Function()? signInUsingGoogle,
    TResult Function(int roleId)? registerRole,
    TResult Function()? switchRole,
    TResult Function()? signOut,
    required TResult orElse(),
  }) {
    if (signInUsingGoogle != null) {
      return signInUsingGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignUpUsingUsername value) signUpUsingUsername,
    required TResult Function(_signInUsingEmail value) signInUsingEmail,
    required TResult Function(_SignInUsingGoogle value) signInUsingGoogle,
    required TResult Function(_RegisterUserRole value) registerRole,
    required TResult Function(_SwitchRole value) switchRole,
    required TResult Function(_SignOut value) signOut,
  }) {
    return signInUsingGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpUsingUsername value)? signUpUsingUsername,
    TResult? Function(_signInUsingEmail value)? signInUsingEmail,
    TResult? Function(_SignInUsingGoogle value)? signInUsingGoogle,
    TResult? Function(_RegisterUserRole value)? registerRole,
    TResult? Function(_SwitchRole value)? switchRole,
    TResult? Function(_SignOut value)? signOut,
  }) {
    return signInUsingGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpUsingUsername value)? signUpUsingUsername,
    TResult Function(_signInUsingEmail value)? signInUsingEmail,
    TResult Function(_SignInUsingGoogle value)? signInUsingGoogle,
    TResult Function(_RegisterUserRole value)? registerRole,
    TResult Function(_SwitchRole value)? switchRole,
    TResult Function(_SignOut value)? signOut,
    required TResult orElse(),
  }) {
    if (signInUsingGoogle != null) {
      return signInUsingGoogle(this);
    }
    return orElse();
  }
}

abstract class _SignInUsingGoogle implements AuthEvent {
  const factory _SignInUsingGoogle() = _$_SignInUsingGoogle;
}

/// @nodoc
abstract class _$$_RegisterUserRoleCopyWith<$Res> {
  factory _$$_RegisterUserRoleCopyWith(
          _$_RegisterUserRole value, $Res Function(_$_RegisterUserRole) then) =
      __$$_RegisterUserRoleCopyWithImpl<$Res>;
  @useResult
  $Res call({int roleId});
}

/// @nodoc
class __$$_RegisterUserRoleCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_RegisterUserRole>
    implements _$$_RegisterUserRoleCopyWith<$Res> {
  __$$_RegisterUserRoleCopyWithImpl(
      _$_RegisterUserRole _value, $Res Function(_$_RegisterUserRole) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleId = null,
  }) {
    return _then(_$_RegisterUserRole(
      null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RegisterUserRole implements _RegisterUserRole {
  const _$_RegisterUserRole(this.roleId);

  @override
  final int roleId;

  @override
  String toString() {
    return 'AuthEvent.registerRole(roleId: $roleId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterUserRole &&
            (identical(other.roleId, roleId) || other.roleId == roleId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roleId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterUserRoleCopyWith<_$_RegisterUserRole> get copyWith =>
      __$$_RegisterUserRoleCopyWithImpl<_$_RegisterUserRole>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String userName, String password)
        signUpUsingUsername,
    required TResult Function(String email, String password) signInUsingEmail,
    required TResult Function() signInUsingGoogle,
    required TResult Function(int roleId) registerRole,
    required TResult Function() switchRole,
    required TResult Function() signOut,
  }) {
    return registerRole(roleId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String userName, String password)?
        signUpUsingUsername,
    TResult? Function(String email, String password)? signInUsingEmail,
    TResult? Function()? signInUsingGoogle,
    TResult? Function(int roleId)? registerRole,
    TResult? Function()? switchRole,
    TResult? Function()? signOut,
  }) {
    return registerRole?.call(roleId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String userName, String password)?
        signUpUsingUsername,
    TResult Function(String email, String password)? signInUsingEmail,
    TResult Function()? signInUsingGoogle,
    TResult Function(int roleId)? registerRole,
    TResult Function()? switchRole,
    TResult Function()? signOut,
    required TResult orElse(),
  }) {
    if (registerRole != null) {
      return registerRole(roleId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignUpUsingUsername value) signUpUsingUsername,
    required TResult Function(_signInUsingEmail value) signInUsingEmail,
    required TResult Function(_SignInUsingGoogle value) signInUsingGoogle,
    required TResult Function(_RegisterUserRole value) registerRole,
    required TResult Function(_SwitchRole value) switchRole,
    required TResult Function(_SignOut value) signOut,
  }) {
    return registerRole(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpUsingUsername value)? signUpUsingUsername,
    TResult? Function(_signInUsingEmail value)? signInUsingEmail,
    TResult? Function(_SignInUsingGoogle value)? signInUsingGoogle,
    TResult? Function(_RegisterUserRole value)? registerRole,
    TResult? Function(_SwitchRole value)? switchRole,
    TResult? Function(_SignOut value)? signOut,
  }) {
    return registerRole?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpUsingUsername value)? signUpUsingUsername,
    TResult Function(_signInUsingEmail value)? signInUsingEmail,
    TResult Function(_SignInUsingGoogle value)? signInUsingGoogle,
    TResult Function(_RegisterUserRole value)? registerRole,
    TResult Function(_SwitchRole value)? switchRole,
    TResult Function(_SignOut value)? signOut,
    required TResult orElse(),
  }) {
    if (registerRole != null) {
      return registerRole(this);
    }
    return orElse();
  }
}

abstract class _RegisterUserRole implements AuthEvent {
  const factory _RegisterUserRole(final int roleId) = _$_RegisterUserRole;

  int get roleId;
  @JsonKey(ignore: true)
  _$$_RegisterUserRoleCopyWith<_$_RegisterUserRole> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SwitchRoleCopyWith<$Res> {
  factory _$$_SwitchRoleCopyWith(
          _$_SwitchRole value, $Res Function(_$_SwitchRole) then) =
      __$$_SwitchRoleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SwitchRoleCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_SwitchRole>
    implements _$$_SwitchRoleCopyWith<$Res> {
  __$$_SwitchRoleCopyWithImpl(
      _$_SwitchRole _value, $Res Function(_$_SwitchRole) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SwitchRole implements _SwitchRole {
  const _$_SwitchRole();

  @override
  String toString() {
    return 'AuthEvent.switchRole()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SwitchRole);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String userName, String password)
        signUpUsingUsername,
    required TResult Function(String email, String password) signInUsingEmail,
    required TResult Function() signInUsingGoogle,
    required TResult Function(int roleId) registerRole,
    required TResult Function() switchRole,
    required TResult Function() signOut,
  }) {
    return switchRole();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String userName, String password)?
        signUpUsingUsername,
    TResult? Function(String email, String password)? signInUsingEmail,
    TResult? Function()? signInUsingGoogle,
    TResult? Function(int roleId)? registerRole,
    TResult? Function()? switchRole,
    TResult? Function()? signOut,
  }) {
    return switchRole?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String userName, String password)?
        signUpUsingUsername,
    TResult Function(String email, String password)? signInUsingEmail,
    TResult Function()? signInUsingGoogle,
    TResult Function(int roleId)? registerRole,
    TResult Function()? switchRole,
    TResult Function()? signOut,
    required TResult orElse(),
  }) {
    if (switchRole != null) {
      return switchRole();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignUpUsingUsername value) signUpUsingUsername,
    required TResult Function(_signInUsingEmail value) signInUsingEmail,
    required TResult Function(_SignInUsingGoogle value) signInUsingGoogle,
    required TResult Function(_RegisterUserRole value) registerRole,
    required TResult Function(_SwitchRole value) switchRole,
    required TResult Function(_SignOut value) signOut,
  }) {
    return switchRole(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpUsingUsername value)? signUpUsingUsername,
    TResult? Function(_signInUsingEmail value)? signInUsingEmail,
    TResult? Function(_SignInUsingGoogle value)? signInUsingGoogle,
    TResult? Function(_RegisterUserRole value)? registerRole,
    TResult? Function(_SwitchRole value)? switchRole,
    TResult? Function(_SignOut value)? signOut,
  }) {
    return switchRole?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpUsingUsername value)? signUpUsingUsername,
    TResult Function(_signInUsingEmail value)? signInUsingEmail,
    TResult Function(_SignInUsingGoogle value)? signInUsingGoogle,
    TResult Function(_RegisterUserRole value)? registerRole,
    TResult Function(_SwitchRole value)? switchRole,
    TResult Function(_SignOut value)? signOut,
    required TResult orElse(),
  }) {
    if (switchRole != null) {
      return switchRole(this);
    }
    return orElse();
  }
}

abstract class _SwitchRole implements AuthEvent {
  const factory _SwitchRole() = _$_SwitchRole;
}

/// @nodoc
abstract class _$$_SignOutCopyWith<$Res> {
  factory _$$_SignOutCopyWith(
          _$_SignOut value, $Res Function(_$_SignOut) then) =
      __$$_SignOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignOutCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_SignOut>
    implements _$$_SignOutCopyWith<$Res> {
  __$$_SignOutCopyWithImpl(_$_SignOut _value, $Res Function(_$_SignOut) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignOut implements _SignOut {
  const _$_SignOut();

  @override
  String toString() {
    return 'AuthEvent.signOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String userName, String password)
        signUpUsingUsername,
    required TResult Function(String email, String password) signInUsingEmail,
    required TResult Function() signInUsingGoogle,
    required TResult Function(int roleId) registerRole,
    required TResult Function() switchRole,
    required TResult Function() signOut,
  }) {
    return signOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String userName, String password)?
        signUpUsingUsername,
    TResult? Function(String email, String password)? signInUsingEmail,
    TResult? Function()? signInUsingGoogle,
    TResult? Function(int roleId)? registerRole,
    TResult? Function()? switchRole,
    TResult? Function()? signOut,
  }) {
    return signOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String userName, String password)?
        signUpUsingUsername,
    TResult Function(String email, String password)? signInUsingEmail,
    TResult Function()? signInUsingGoogle,
    TResult Function(int roleId)? registerRole,
    TResult Function()? switchRole,
    TResult Function()? signOut,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignUpUsingUsername value) signUpUsingUsername,
    required TResult Function(_signInUsingEmail value) signInUsingEmail,
    required TResult Function(_SignInUsingGoogle value) signInUsingGoogle,
    required TResult Function(_RegisterUserRole value) registerRole,
    required TResult Function(_SwitchRole value) switchRole,
    required TResult Function(_SignOut value) signOut,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpUsingUsername value)? signUpUsingUsername,
    TResult? Function(_signInUsingEmail value)? signInUsingEmail,
    TResult? Function(_SignInUsingGoogle value)? signInUsingGoogle,
    TResult? Function(_RegisterUserRole value)? registerRole,
    TResult? Function(_SwitchRole value)? switchRole,
    TResult? Function(_SignOut value)? signOut,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpUsingUsername value)? signUpUsingUsername,
    TResult Function(_signInUsingEmail value)? signInUsingEmail,
    TResult Function(_SignInUsingGoogle value)? signInUsingGoogle,
    TResult Function(_RegisterUserRole value)? registerRole,
    TResult Function(_SwitchRole value)? switchRole,
    TResult Function(_SignOut value)? signOut,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class _SignOut implements AuthEvent {
  const factory _SignOut() = _$_SignOut;
}

/// @nodoc
mixin _$AuthState {
  UserModel? get user => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get signUpUsingEmailOption =>
      throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get signInUsingEmailOption =>
      throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get signInUsingGoogleOption =>
      throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get registerRoleOption =>
      throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get switchRoleOption =>
      throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get signOutOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {UserModel? user,
      Option<Either<AuthFailure, Unit>> signUpUsingEmailOption,
      Option<Either<AuthFailure, Unit>> signInUsingEmailOption,
      Option<Either<AuthFailure, Unit>> signInUsingGoogleOption,
      Option<Either<AuthFailure, Unit>> registerRoleOption,
      Option<Either<AuthFailure, Unit>> switchRoleOption,
      Option<Either<AuthFailure, Unit>> signOutOption});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? signUpUsingEmailOption = null,
    Object? signInUsingEmailOption = null,
    Object? signInUsingGoogleOption = null,
    Object? registerRoleOption = null,
    Object? switchRoleOption = null,
    Object? signOutOption = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      signUpUsingEmailOption: null == signUpUsingEmailOption
          ? _value.signUpUsingEmailOption
          : signUpUsingEmailOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      signInUsingEmailOption: null == signInUsingEmailOption
          ? _value.signInUsingEmailOption
          : signInUsingEmailOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      signInUsingGoogleOption: null == signInUsingGoogleOption
          ? _value.signInUsingGoogleOption
          : signInUsingGoogleOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      registerRoleOption: null == registerRoleOption
          ? _value.registerRoleOption
          : registerRoleOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      switchRoleOption: null == switchRoleOption
          ? _value.switchRoleOption
          : switchRoleOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      signOutOption: null == signOutOption
          ? _value.signOutOption
          : signOutOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthStateCopyWith(
          _$_AuthState value, $Res Function(_$_AuthState) then) =
      __$$_AuthStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserModel? user,
      Option<Either<AuthFailure, Unit>> signUpUsingEmailOption,
      Option<Either<AuthFailure, Unit>> signInUsingEmailOption,
      Option<Either<AuthFailure, Unit>> signInUsingGoogleOption,
      Option<Either<AuthFailure, Unit>> registerRoleOption,
      Option<Either<AuthFailure, Unit>> switchRoleOption,
      Option<Either<AuthFailure, Unit>> signOutOption});
}

/// @nodoc
class __$$_AuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthState>
    implements _$$_AuthStateCopyWith<$Res> {
  __$$_AuthStateCopyWithImpl(
      _$_AuthState _value, $Res Function(_$_AuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? signUpUsingEmailOption = null,
    Object? signInUsingEmailOption = null,
    Object? signInUsingGoogleOption = null,
    Object? registerRoleOption = null,
    Object? switchRoleOption = null,
    Object? signOutOption = null,
  }) {
    return _then(_$_AuthState(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      signUpUsingEmailOption: null == signUpUsingEmailOption
          ? _value.signUpUsingEmailOption
          : signUpUsingEmailOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      signInUsingEmailOption: null == signInUsingEmailOption
          ? _value.signInUsingEmailOption
          : signInUsingEmailOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      signInUsingGoogleOption: null == signInUsingGoogleOption
          ? _value.signInUsingGoogleOption
          : signInUsingGoogleOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      registerRoleOption: null == registerRoleOption
          ? _value.registerRoleOption
          : registerRoleOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      switchRoleOption: null == switchRoleOption
          ? _value.switchRoleOption
          : switchRoleOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      signOutOption: null == signOutOption
          ? _value.signOutOption
          : signOutOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState(
      {required this.user,
      required this.signUpUsingEmailOption,
      required this.signInUsingEmailOption,
      required this.signInUsingGoogleOption,
      required this.registerRoleOption,
      required this.switchRoleOption,
      required this.signOutOption});

  @override
  final UserModel? user;
  @override
  final Option<Either<AuthFailure, Unit>> signUpUsingEmailOption;
  @override
  final Option<Either<AuthFailure, Unit>> signInUsingEmailOption;
  @override
  final Option<Either<AuthFailure, Unit>> signInUsingGoogleOption;
  @override
  final Option<Either<AuthFailure, Unit>> registerRoleOption;
  @override
  final Option<Either<AuthFailure, Unit>> switchRoleOption;
  @override
  final Option<Either<AuthFailure, Unit>> signOutOption;

  @override
  String toString() {
    return 'AuthState(user: $user, signUpUsingEmailOption: $signUpUsingEmailOption, signInUsingEmailOption: $signInUsingEmailOption, signInUsingGoogleOption: $signInUsingGoogleOption, registerRoleOption: $registerRoleOption, switchRoleOption: $switchRoleOption, signOutOption: $signOutOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.signUpUsingEmailOption, signUpUsingEmailOption) ||
                other.signUpUsingEmailOption == signUpUsingEmailOption) &&
            (identical(other.signInUsingEmailOption, signInUsingEmailOption) ||
                other.signInUsingEmailOption == signInUsingEmailOption) &&
            (identical(
                    other.signInUsingGoogleOption, signInUsingGoogleOption) ||
                other.signInUsingGoogleOption == signInUsingGoogleOption) &&
            (identical(other.registerRoleOption, registerRoleOption) ||
                other.registerRoleOption == registerRoleOption) &&
            (identical(other.switchRoleOption, switchRoleOption) ||
                other.switchRoleOption == switchRoleOption) &&
            (identical(other.signOutOption, signOutOption) ||
                other.signOutOption == signOutOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      signUpUsingEmailOption,
      signInUsingEmailOption,
      signInUsingGoogleOption,
      registerRoleOption,
      switchRoleOption,
      signOutOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      __$$_AuthStateCopyWithImpl<_$_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {required final UserModel? user,
      required final Option<Either<AuthFailure, Unit>> signUpUsingEmailOption,
      required final Option<Either<AuthFailure, Unit>> signInUsingEmailOption,
      required final Option<Either<AuthFailure, Unit>> signInUsingGoogleOption,
      required final Option<Either<AuthFailure, Unit>> registerRoleOption,
      required final Option<Either<AuthFailure, Unit>> switchRoleOption,
      required final Option<Either<AuthFailure, Unit>>
          signOutOption}) = _$_AuthState;

  @override
  UserModel? get user;
  @override
  Option<Either<AuthFailure, Unit>> get signUpUsingEmailOption;
  @override
  Option<Either<AuthFailure, Unit>> get signInUsingEmailOption;
  @override
  Option<Either<AuthFailure, Unit>> get signInUsingGoogleOption;
  @override
  Option<Either<AuthFailure, Unit>> get registerRoleOption;
  @override
  Option<Either<AuthFailure, Unit>> get switchRoleOption;
  @override
  Option<Either<AuthFailure, Unit>> get signOutOption;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
