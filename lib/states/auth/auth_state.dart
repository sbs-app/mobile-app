part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required UserModel? user,
    required Option<Either<AuthFailure, Unit>> signUpUsingEmailOption,
    required Option<Either<AuthFailure, Unit>> signInUsingEmailOption,
    required Option<Either<AuthFailure, Unit>> signInUsingGoogleOption,
    required Option<Either<AuthFailure, Unit>> registerRoleOption,
    required Option<Either<AuthFailure, Unit>> updateUserOption,
    required Option<Either<AuthFailure, Unit>> switchRoleOption,
    required Option<Either<AuthFailure, Unit>> signOutOption,
  }) = _AuthState;

  factory AuthState.initial() => AuthState(
        user: null,
        signUpUsingEmailOption: none(),
        signInUsingEmailOption: none(),
        signInUsingGoogleOption: none(),
        registerRoleOption: none(),
        updateUserOption: none(),
        signOutOption: none(),
        switchRoleOption: none(),
      );
}
