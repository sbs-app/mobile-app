// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:hive/hive.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import 'controllers/auth/auth_controller.dart' as _i8;
import 'controllers/courses/course_controller.dart' as _i10;
import 'controllers/injection_module.dart' as _i14;
import 'core/services/navigation_service.dart' as _i11;
import 'models/auth/i_auth_controller.dart' as _i7;
import 'models/courses/i_courses_repo.dart' as _i9;
import 'states/auth/auth_bloc.dart' as _i12;
import 'states/course/course_bloc.dart' as _i13;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final authInjectableModule = _$AuthInjectableModule();
  gh.lazySingleton<_i3.Box<dynamic>>(() => authInjectableModule.userBox);
  gh.lazySingleton<_i4.FirebaseAuth>(() => authInjectableModule.firebaseAuth);
  gh.lazySingleton<_i5.FirebaseFirestore>(
      () => authInjectableModule.firebaseFirestore);
  gh.lazySingleton<_i6.GoogleSignIn>(() => authInjectableModule.googleSignIn);
  gh.factory<_i7.IAuthController>(
    () => _i8.AuthController(
      get<_i4.FirebaseAuth>(),
      get<_i6.GoogleSignIn>(),
      get<_i5.FirebaseFirestore>(),
      get<_i3.Box<dynamic>>(),
    ),
    registerFor: {_prod},
  );
  gh.factory<_i9.ICoursesController>(
    () => _i10.CourseController(
      get<_i5.FirebaseFirestore>(),
      get<_i3.Box<dynamic>>(),
    ),
    registerFor: {_prod},
  );
  gh.lazySingleton<_i11.NavigationService>(() => _i11.NavigationService());
  gh.factory<_i12.AuthBloc>(
    () => _i12.AuthBloc(get<_i7.IAuthController>()),
    registerFor: {_prod},
  );
  gh.factory<_i13.CourseBloc>(
    () => _i13.CourseBloc(get<_i9.ICoursesController>()),
    registerFor: {_prod},
  );
  return get;
}

class _$AuthInjectableModule extends _i14.AuthInjectableModule {}
