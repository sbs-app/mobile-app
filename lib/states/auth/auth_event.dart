part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signUpUsingUsername({
    required String email,
    required String userName,
    required String password,
    String? profileImage,
  }) = _SignUpUsingUsername;

  const factory AuthEvent.signInUsingEmail({
    required String email,
    required String password,
  }) = _signInUsingEmail;

  const factory AuthEvent.signInUsingGoogle() = _SignInUsingGoogle;
  const factory AuthEvent.registerRole(int roleId) = _RegisterUserRole;
  const factory AuthEvent.updateUser(UserModel newUser) = _UpdateUser;
  const factory AuthEvent.switchRole() = _SwitchRole;
  const factory AuthEvent.signOut() = _SignOut;
}
