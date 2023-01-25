import 'dart:async';

import 'package:classroom/core/utils/custom_build_context.dart';
import 'package:classroom/models/auth/auth_failures.dart';
import 'package:classroom/models/auth/i_auth_controller.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/states/course/course_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
@prod
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.AuthController) : super(AuthState.initial());
  final IAuthController AuthController;

  static void addEventWithoutContext(AuthEvent e) =>
      BlocProvider.of<AuthBloc>(context).add(e);

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(
      signUpUsingUsername: (e) async* {
        yield state.copyWith(
          signUpUsingEmailOption: none(),
          signInUsingEmailOption: none(),
          signInUsingGoogleOption: none(),
          registerRoleOption: none(),
        );
        final failureOrSuccess =
            await AuthController.signUpUsingEmailAndPassword(
          userName: e.userName,
          email: e.email,
          password: e.password,
        );

        yield failureOrSuccess.fold(
          (l) => state.copyWith(signUpUsingEmailOption: Some(Left(l))),
          (r) => state.copyWith(
            signUpUsingEmailOption: const Some(Right(unit)),
            user: r,
          ),
        );
      },
      signInUsingEmail: (e) async* {
        yield state.copyWith(
          signUpUsingEmailOption: none(),
          signInUsingEmailOption: none(),
          signInUsingGoogleOption: none(),
          registerRoleOption: none(),
        );
        final failureOrSuccess =
            await AuthController.signInUsingEmailAndPassword(
          email: e.email,
          password: e.password,
        );

        yield failureOrSuccess.fold(
          (l) => state.copyWith(signInUsingEmailOption: Some(Left(l))),
          (r) => state.copyWith(
            signInUsingEmailOption: const Some(Right(unit)),
            user: r,
          ),
        );
      },
      signInUsingGoogle: (e) async* {
        yield state.copyWith(
          signUpUsingEmailOption: none(),
          signInUsingEmailOption: none(),
          signInUsingGoogleOption: none(),
          registerRoleOption: none(),
        );
        final failureOrSuccess = await AuthController.signInUsingGoogle();

        yield failureOrSuccess.fold(
          (l) => state.copyWith(signInUsingGoogleOption: Some(Left(l))),
          (r) => state.copyWith(
            signInUsingGoogleOption: const Some(Right(unit)),
            user: r,
          ),
        );
      },
      registerRole: (e) async* {
        yield state.copyWith(registerRoleOption: none());
        final failureOrSuccess = await AuthController.registerRole(e.roleId);

        yield failureOrSuccess.fold(
          (l) => state.copyWith(registerRoleOption: Some(Left(l))),
          (r) => state.copyWith(
            registerRoleOption: const Some(Right(unit)),
            user: state.user?.copyWith(roleId: e.roleId),
          ),
        );
      },
      switchRole: (_) async* {
        yield state.copyWith(switchRoleOption: none());
        final failureOrSuccess = await AuthController.switchRole();

        yield failureOrSuccess.fold(
          (l) => state.copyWith(switchRoleOption: Some(Left(l))),
          (r) {
            // Phoenix.rebirth(context);
            return state.copyWith(
              switchRoleOption: const Some(Right(unit)),
            );
          },
        );
      },
      signOut: (_) async* {
        yield state.copyWith(signOutOption: none());
        final failureOrSuccess = await AuthController.signOut();

        yield failureOrSuccess.fold(
          (l) => state.copyWith(signOutOption: Some(Left(l))),
          (r) {
            CourseBloc.addEventWithoutContext(const CourseEvent.reset());
            return AuthState.initial();
          },
        );
      },
    );
  }
}
