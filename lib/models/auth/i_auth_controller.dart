import 'package:classroom/models/auth/auth_failures.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthController {
  /// Sign up using username and password
  Future<Either<AuthFailure, UserModel>> signUpUsingEmailAndPassword({
    required String userName,
    required String email,
    required String password,
  });

  /// Sign in using username and password
  Future<Either<AuthFailure, UserModel>> signInUsingEmailAndPassword({
    required String email,
    required String password,
  });

  /// Sign in using google
  Future<Either<AuthFailure, UserModel>> signInUsingGoogle();

  /// Register user role:- [Student, Teacher]
  Future<Either<AuthFailure, Unit>> registerRole(int roleId);
  Future<Either<AuthFailure, Unit>> updateUser(UserModel newUser);
  Future<Either<AuthFailure, Unit>> switchRole();
  Future<Either<AuthFailure, Unit>> signOut();
}
