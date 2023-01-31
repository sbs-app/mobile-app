// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CourseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCourses,
    required TResult Function(String name, String id, UserModel teacher)
        createCourse,
    required TResult Function(String courseCode) deleteCourse,
    required TResult Function(String courseCode, String name) updateCourse,
    required TResult Function(String courseCode, PostModel post, bool remove)
        addPostToCourse,
    required TResult Function(String courseCode, String studentId)
        addStudentToCourse,
    required TResult Function(String courseCode, String studentId)
        removeStudentFromCourse,
    required TResult Function() removedUpdatedCourseName,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCourses,
    TResult? Function(String name, String id, UserModel teacher)? createCourse,
    TResult? Function(String courseCode)? deleteCourse,
    TResult? Function(String courseCode, String name)? updateCourse,
    TResult? Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult? Function(String courseCode, String studentId)? addStudentToCourse,
    TResult? Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult? Function()? removedUpdatedCourseName,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCourses,
    TResult Function(String name, String id, UserModel teacher)? createCourse,
    TResult Function(String courseCode)? deleteCourse,
    TResult Function(String courseCode, String name)? updateCourse,
    TResult Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult Function(String courseCode, String studentId)? addStudentToCourse,
    TResult Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult Function()? removedUpdatedCourseName,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCourses value) getCourses,
    required TResult Function(_CreateCourse value) createCourse,
    required TResult Function(_DeleteCourse value) deleteCourse,
    required TResult Function(_UpdateCourse value) updateCourse,
    required TResult Function(_AddPostToCourse value) addPostToCourse,
    required TResult Function(_AddStudentToCourse value) addStudentToCourse,
    required TResult Function(_RemoveStudentFromCourse value)
        removeStudentFromCourse,
    required TResult Function(_RemoveUpdatedCourseName value)
        removedUpdatedCourseName,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCourses value)? getCourses,
    TResult? Function(_CreateCourse value)? createCourse,
    TResult? Function(_DeleteCourse value)? deleteCourse,
    TResult? Function(_UpdateCourse value)? updateCourse,
    TResult? Function(_AddPostToCourse value)? addPostToCourse,
    TResult? Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult? Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult? Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult? Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCourses value)? getCourses,
    TResult Function(_CreateCourse value)? createCourse,
    TResult Function(_DeleteCourse value)? deleteCourse,
    TResult Function(_UpdateCourse value)? updateCourse,
    TResult Function(_AddPostToCourse value)? addPostToCourse,
    TResult Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseEventCopyWith<$Res> {
  factory $CourseEventCopyWith(
          CourseEvent value, $Res Function(CourseEvent) then) =
      _$CourseEventCopyWithImpl<$Res, CourseEvent>;
}

/// @nodoc
class _$CourseEventCopyWithImpl<$Res, $Val extends CourseEvent>
    implements $CourseEventCopyWith<$Res> {
  _$CourseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetCoursesCopyWith<$Res> {
  factory _$$_GetCoursesCopyWith(
          _$_GetCourses value, $Res Function(_$_GetCourses) then) =
      __$$_GetCoursesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetCoursesCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$_GetCourses>
    implements _$$_GetCoursesCopyWith<$Res> {
  __$$_GetCoursesCopyWithImpl(
      _$_GetCourses _value, $Res Function(_$_GetCourses) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetCourses implements _GetCourses {
  const _$_GetCourses();

  @override
  String toString() {
    return 'CourseEvent.getCourses()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetCourses);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCourses,
    required TResult Function(String name, String id, UserModel teacher)
        createCourse,
    required TResult Function(String courseCode) deleteCourse,
    required TResult Function(String courseCode, String name) updateCourse,
    required TResult Function(String courseCode, PostModel post, bool remove)
        addPostToCourse,
    required TResult Function(String courseCode, String studentId)
        addStudentToCourse,
    required TResult Function(String courseCode, String studentId)
        removeStudentFromCourse,
    required TResult Function() removedUpdatedCourseName,
    required TResult Function() reset,
  }) {
    return getCourses();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCourses,
    TResult? Function(String name, String id, UserModel teacher)? createCourse,
    TResult? Function(String courseCode)? deleteCourse,
    TResult? Function(String courseCode, String name)? updateCourse,
    TResult? Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult? Function(String courseCode, String studentId)? addStudentToCourse,
    TResult? Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult? Function()? removedUpdatedCourseName,
    TResult? Function()? reset,
  }) {
    return getCourses?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCourses,
    TResult Function(String name, String id, UserModel teacher)? createCourse,
    TResult Function(String courseCode)? deleteCourse,
    TResult Function(String courseCode, String name)? updateCourse,
    TResult Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult Function(String courseCode, String studentId)? addStudentToCourse,
    TResult Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult Function()? removedUpdatedCourseName,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (getCourses != null) {
      return getCourses();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCourses value) getCourses,
    required TResult Function(_CreateCourse value) createCourse,
    required TResult Function(_DeleteCourse value) deleteCourse,
    required TResult Function(_UpdateCourse value) updateCourse,
    required TResult Function(_AddPostToCourse value) addPostToCourse,
    required TResult Function(_AddStudentToCourse value) addStudentToCourse,
    required TResult Function(_RemoveStudentFromCourse value)
        removeStudentFromCourse,
    required TResult Function(_RemoveUpdatedCourseName value)
        removedUpdatedCourseName,
    required TResult Function(_Reset value) reset,
  }) {
    return getCourses(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCourses value)? getCourses,
    TResult? Function(_CreateCourse value)? createCourse,
    TResult? Function(_DeleteCourse value)? deleteCourse,
    TResult? Function(_UpdateCourse value)? updateCourse,
    TResult? Function(_AddPostToCourse value)? addPostToCourse,
    TResult? Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult? Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult? Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult? Function(_Reset value)? reset,
  }) {
    return getCourses?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCourses value)? getCourses,
    TResult Function(_CreateCourse value)? createCourse,
    TResult Function(_DeleteCourse value)? deleteCourse,
    TResult Function(_UpdateCourse value)? updateCourse,
    TResult Function(_AddPostToCourse value)? addPostToCourse,
    TResult Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (getCourses != null) {
      return getCourses(this);
    }
    return orElse();
  }
}

abstract class _GetCourses implements CourseEvent {
  const factory _GetCourses() = _$_GetCourses;
}

/// @nodoc
abstract class _$$_CreateCourseCopyWith<$Res> {
  factory _$$_CreateCourseCopyWith(
          _$_CreateCourse value, $Res Function(_$_CreateCourse) then) =
      __$$_CreateCourseCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String id, UserModel teacher});
}

/// @nodoc
class __$$_CreateCourseCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$_CreateCourse>
    implements _$$_CreateCourseCopyWith<$Res> {
  __$$_CreateCourseCopyWithImpl(
      _$_CreateCourse _value, $Res Function(_$_CreateCourse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? teacher = null,
  }) {
    return _then(_$_CreateCourse(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$_CreateCourse implements _CreateCourse {
  const _$_CreateCourse(this.name, this.id, this.teacher);

  @override
  final String name;
  @override
  final String id;
  @override
  final UserModel teacher;

  @override
  String toString() {
    return 'CourseEvent.createCourse(name: $name, id: $id, teacher: $teacher)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateCourse &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.teacher, teacher) || other.teacher == teacher));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, id, teacher);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCourseCopyWith<_$_CreateCourse> get copyWith =>
      __$$_CreateCourseCopyWithImpl<_$_CreateCourse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCourses,
    required TResult Function(String name, String id, UserModel teacher)
        createCourse,
    required TResult Function(String courseCode) deleteCourse,
    required TResult Function(String courseCode, String name) updateCourse,
    required TResult Function(String courseCode, PostModel post, bool remove)
        addPostToCourse,
    required TResult Function(String courseCode, String studentId)
        addStudentToCourse,
    required TResult Function(String courseCode, String studentId)
        removeStudentFromCourse,
    required TResult Function() removedUpdatedCourseName,
    required TResult Function() reset,
  }) {
    return createCourse(name, id, teacher);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCourses,
    TResult? Function(String name, String id, UserModel teacher)? createCourse,
    TResult? Function(String courseCode)? deleteCourse,
    TResult? Function(String courseCode, String name)? updateCourse,
    TResult? Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult? Function(String courseCode, String studentId)? addStudentToCourse,
    TResult? Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult? Function()? removedUpdatedCourseName,
    TResult? Function()? reset,
  }) {
    return createCourse?.call(name, id, teacher);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCourses,
    TResult Function(String name, String id, UserModel teacher)? createCourse,
    TResult Function(String courseCode)? deleteCourse,
    TResult Function(String courseCode, String name)? updateCourse,
    TResult Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult Function(String courseCode, String studentId)? addStudentToCourse,
    TResult Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult Function()? removedUpdatedCourseName,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (createCourse != null) {
      return createCourse(name, id, teacher);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCourses value) getCourses,
    required TResult Function(_CreateCourse value) createCourse,
    required TResult Function(_DeleteCourse value) deleteCourse,
    required TResult Function(_UpdateCourse value) updateCourse,
    required TResult Function(_AddPostToCourse value) addPostToCourse,
    required TResult Function(_AddStudentToCourse value) addStudentToCourse,
    required TResult Function(_RemoveStudentFromCourse value)
        removeStudentFromCourse,
    required TResult Function(_RemoveUpdatedCourseName value)
        removedUpdatedCourseName,
    required TResult Function(_Reset value) reset,
  }) {
    return createCourse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCourses value)? getCourses,
    TResult? Function(_CreateCourse value)? createCourse,
    TResult? Function(_DeleteCourse value)? deleteCourse,
    TResult? Function(_UpdateCourse value)? updateCourse,
    TResult? Function(_AddPostToCourse value)? addPostToCourse,
    TResult? Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult? Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult? Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult? Function(_Reset value)? reset,
  }) {
    return createCourse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCourses value)? getCourses,
    TResult Function(_CreateCourse value)? createCourse,
    TResult Function(_DeleteCourse value)? deleteCourse,
    TResult Function(_UpdateCourse value)? updateCourse,
    TResult Function(_AddPostToCourse value)? addPostToCourse,
    TResult Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (createCourse != null) {
      return createCourse(this);
    }
    return orElse();
  }
}

abstract class _CreateCourse implements CourseEvent {
  const factory _CreateCourse(
          final String name, final String id, final UserModel teacher) =
      _$_CreateCourse;

  String get name;
  String get id;
  UserModel get teacher;
  @JsonKey(ignore: true)
  _$$_CreateCourseCopyWith<_$_CreateCourse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteCourseCopyWith<$Res> {
  factory _$$_DeleteCourseCopyWith(
          _$_DeleteCourse value, $Res Function(_$_DeleteCourse) then) =
      __$$_DeleteCourseCopyWithImpl<$Res>;
  @useResult
  $Res call({String courseCode});
}

/// @nodoc
class __$$_DeleteCourseCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$_DeleteCourse>
    implements _$$_DeleteCourseCopyWith<$Res> {
  __$$_DeleteCourseCopyWithImpl(
      _$_DeleteCourse _value, $Res Function(_$_DeleteCourse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseCode = null,
  }) {
    return _then(_$_DeleteCourse(
      null == courseCode
          ? _value.courseCode
          : courseCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteCourse implements _DeleteCourse {
  const _$_DeleteCourse(this.courseCode);

  @override
  final String courseCode;

  @override
  String toString() {
    return 'CourseEvent.deleteCourse(courseCode: $courseCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteCourse &&
            (identical(other.courseCode, courseCode) ||
                other.courseCode == courseCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteCourseCopyWith<_$_DeleteCourse> get copyWith =>
      __$$_DeleteCourseCopyWithImpl<_$_DeleteCourse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCourses,
    required TResult Function(String name, String id, UserModel teacher)
        createCourse,
    required TResult Function(String courseCode) deleteCourse,
    required TResult Function(String courseCode, String name) updateCourse,
    required TResult Function(String courseCode, PostModel post, bool remove)
        addPostToCourse,
    required TResult Function(String courseCode, String studentId)
        addStudentToCourse,
    required TResult Function(String courseCode, String studentId)
        removeStudentFromCourse,
    required TResult Function() removedUpdatedCourseName,
    required TResult Function() reset,
  }) {
    return deleteCourse(courseCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCourses,
    TResult? Function(String name, String id, UserModel teacher)? createCourse,
    TResult? Function(String courseCode)? deleteCourse,
    TResult? Function(String courseCode, String name)? updateCourse,
    TResult? Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult? Function(String courseCode, String studentId)? addStudentToCourse,
    TResult? Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult? Function()? removedUpdatedCourseName,
    TResult? Function()? reset,
  }) {
    return deleteCourse?.call(courseCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCourses,
    TResult Function(String name, String id, UserModel teacher)? createCourse,
    TResult Function(String courseCode)? deleteCourse,
    TResult Function(String courseCode, String name)? updateCourse,
    TResult Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult Function(String courseCode, String studentId)? addStudentToCourse,
    TResult Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult Function()? removedUpdatedCourseName,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (deleteCourse != null) {
      return deleteCourse(courseCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCourses value) getCourses,
    required TResult Function(_CreateCourse value) createCourse,
    required TResult Function(_DeleteCourse value) deleteCourse,
    required TResult Function(_UpdateCourse value) updateCourse,
    required TResult Function(_AddPostToCourse value) addPostToCourse,
    required TResult Function(_AddStudentToCourse value) addStudentToCourse,
    required TResult Function(_RemoveStudentFromCourse value)
        removeStudentFromCourse,
    required TResult Function(_RemoveUpdatedCourseName value)
        removedUpdatedCourseName,
    required TResult Function(_Reset value) reset,
  }) {
    return deleteCourse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCourses value)? getCourses,
    TResult? Function(_CreateCourse value)? createCourse,
    TResult? Function(_DeleteCourse value)? deleteCourse,
    TResult? Function(_UpdateCourse value)? updateCourse,
    TResult? Function(_AddPostToCourse value)? addPostToCourse,
    TResult? Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult? Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult? Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult? Function(_Reset value)? reset,
  }) {
    return deleteCourse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCourses value)? getCourses,
    TResult Function(_CreateCourse value)? createCourse,
    TResult Function(_DeleteCourse value)? deleteCourse,
    TResult Function(_UpdateCourse value)? updateCourse,
    TResult Function(_AddPostToCourse value)? addPostToCourse,
    TResult Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (deleteCourse != null) {
      return deleteCourse(this);
    }
    return orElse();
  }
}

abstract class _DeleteCourse implements CourseEvent {
  const factory _DeleteCourse(final String courseCode) = _$_DeleteCourse;

  String get courseCode;
  @JsonKey(ignore: true)
  _$$_DeleteCourseCopyWith<_$_DeleteCourse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateCourseCopyWith<$Res> {
  factory _$$_UpdateCourseCopyWith(
          _$_UpdateCourse value, $Res Function(_$_UpdateCourse) then) =
      __$$_UpdateCourseCopyWithImpl<$Res>;
  @useResult
  $Res call({String courseCode, String name});
}

/// @nodoc
class __$$_UpdateCourseCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$_UpdateCourse>
    implements _$$_UpdateCourseCopyWith<$Res> {
  __$$_UpdateCourseCopyWithImpl(
      _$_UpdateCourse _value, $Res Function(_$_UpdateCourse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseCode = null,
    Object? name = null,
  }) {
    return _then(_$_UpdateCourse(
      courseCode: null == courseCode
          ? _value.courseCode
          : courseCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateCourse implements _UpdateCourse {
  const _$_UpdateCourse({required this.courseCode, required this.name});

  @override
  final String courseCode;
  @override
  final String name;

  @override
  String toString() {
    return 'CourseEvent.updateCourse(courseCode: $courseCode, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateCourse &&
            (identical(other.courseCode, courseCode) ||
                other.courseCode == courseCode) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseCode, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateCourseCopyWith<_$_UpdateCourse> get copyWith =>
      __$$_UpdateCourseCopyWithImpl<_$_UpdateCourse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCourses,
    required TResult Function(String name, String id, UserModel teacher)
        createCourse,
    required TResult Function(String courseCode) deleteCourse,
    required TResult Function(String courseCode, String name) updateCourse,
    required TResult Function(String courseCode, PostModel post, bool remove)
        addPostToCourse,
    required TResult Function(String courseCode, String studentId)
        addStudentToCourse,
    required TResult Function(String courseCode, String studentId)
        removeStudentFromCourse,
    required TResult Function() removedUpdatedCourseName,
    required TResult Function() reset,
  }) {
    return updateCourse(courseCode, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCourses,
    TResult? Function(String name, String id, UserModel teacher)? createCourse,
    TResult? Function(String courseCode)? deleteCourse,
    TResult? Function(String courseCode, String name)? updateCourse,
    TResult? Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult? Function(String courseCode, String studentId)? addStudentToCourse,
    TResult? Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult? Function()? removedUpdatedCourseName,
    TResult? Function()? reset,
  }) {
    return updateCourse?.call(courseCode, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCourses,
    TResult Function(String name, String id, UserModel teacher)? createCourse,
    TResult Function(String courseCode)? deleteCourse,
    TResult Function(String courseCode, String name)? updateCourse,
    TResult Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult Function(String courseCode, String studentId)? addStudentToCourse,
    TResult Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult Function()? removedUpdatedCourseName,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (updateCourse != null) {
      return updateCourse(courseCode, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCourses value) getCourses,
    required TResult Function(_CreateCourse value) createCourse,
    required TResult Function(_DeleteCourse value) deleteCourse,
    required TResult Function(_UpdateCourse value) updateCourse,
    required TResult Function(_AddPostToCourse value) addPostToCourse,
    required TResult Function(_AddStudentToCourse value) addStudentToCourse,
    required TResult Function(_RemoveStudentFromCourse value)
        removeStudentFromCourse,
    required TResult Function(_RemoveUpdatedCourseName value)
        removedUpdatedCourseName,
    required TResult Function(_Reset value) reset,
  }) {
    return updateCourse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCourses value)? getCourses,
    TResult? Function(_CreateCourse value)? createCourse,
    TResult? Function(_DeleteCourse value)? deleteCourse,
    TResult? Function(_UpdateCourse value)? updateCourse,
    TResult? Function(_AddPostToCourse value)? addPostToCourse,
    TResult? Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult? Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult? Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult? Function(_Reset value)? reset,
  }) {
    return updateCourse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCourses value)? getCourses,
    TResult Function(_CreateCourse value)? createCourse,
    TResult Function(_DeleteCourse value)? deleteCourse,
    TResult Function(_UpdateCourse value)? updateCourse,
    TResult Function(_AddPostToCourse value)? addPostToCourse,
    TResult Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (updateCourse != null) {
      return updateCourse(this);
    }
    return orElse();
  }
}

abstract class _UpdateCourse implements CourseEvent {
  const factory _UpdateCourse(
      {required final String courseCode,
      required final String name}) = _$_UpdateCourse;

  String get courseCode;
  String get name;
  @JsonKey(ignore: true)
  _$$_UpdateCourseCopyWith<_$_UpdateCourse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddPostToCourseCopyWith<$Res> {
  factory _$$_AddPostToCourseCopyWith(
          _$_AddPostToCourse value, $Res Function(_$_AddPostToCourse) then) =
      __$$_AddPostToCourseCopyWithImpl<$Res>;
  @useResult
  $Res call({String courseCode, PostModel post, bool remove});
}

/// @nodoc
class __$$_AddPostToCourseCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$_AddPostToCourse>
    implements _$$_AddPostToCourseCopyWith<$Res> {
  __$$_AddPostToCourseCopyWithImpl(
      _$_AddPostToCourse _value, $Res Function(_$_AddPostToCourse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseCode = null,
    Object? post = null,
    Object? remove = null,
  }) {
    return _then(_$_AddPostToCourse(
      courseCode: null == courseCode
          ? _value.courseCode
          : courseCode // ignore: cast_nullable_to_non_nullable
              as String,
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as PostModel,
      remove: null == remove
          ? _value.remove
          : remove // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AddPostToCourse implements _AddPostToCourse {
  const _$_AddPostToCourse(
      {required this.courseCode, required this.post, required this.remove});

  @override
  final String courseCode;
  @override
  final PostModel post;
  @override
  final bool remove;

  @override
  String toString() {
    return 'CourseEvent.addPostToCourse(courseCode: $courseCode, post: $post, remove: $remove)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddPostToCourse &&
            (identical(other.courseCode, courseCode) ||
                other.courseCode == courseCode) &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.remove, remove) || other.remove == remove));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseCode, post, remove);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddPostToCourseCopyWith<_$_AddPostToCourse> get copyWith =>
      __$$_AddPostToCourseCopyWithImpl<_$_AddPostToCourse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCourses,
    required TResult Function(String name, String id, UserModel teacher)
        createCourse,
    required TResult Function(String courseCode) deleteCourse,
    required TResult Function(String courseCode, String name) updateCourse,
    required TResult Function(String courseCode, PostModel post, bool remove)
        addPostToCourse,
    required TResult Function(String courseCode, String studentId)
        addStudentToCourse,
    required TResult Function(String courseCode, String studentId)
        removeStudentFromCourse,
    required TResult Function() removedUpdatedCourseName,
    required TResult Function() reset,
  }) {
    return addPostToCourse(courseCode, post, remove);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCourses,
    TResult? Function(String name, String id, UserModel teacher)? createCourse,
    TResult? Function(String courseCode)? deleteCourse,
    TResult? Function(String courseCode, String name)? updateCourse,
    TResult? Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult? Function(String courseCode, String studentId)? addStudentToCourse,
    TResult? Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult? Function()? removedUpdatedCourseName,
    TResult? Function()? reset,
  }) {
    return addPostToCourse?.call(courseCode, post, remove);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCourses,
    TResult Function(String name, String id, UserModel teacher)? createCourse,
    TResult Function(String courseCode)? deleteCourse,
    TResult Function(String courseCode, String name)? updateCourse,
    TResult Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult Function(String courseCode, String studentId)? addStudentToCourse,
    TResult Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult Function()? removedUpdatedCourseName,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (addPostToCourse != null) {
      return addPostToCourse(courseCode, post, remove);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCourses value) getCourses,
    required TResult Function(_CreateCourse value) createCourse,
    required TResult Function(_DeleteCourse value) deleteCourse,
    required TResult Function(_UpdateCourse value) updateCourse,
    required TResult Function(_AddPostToCourse value) addPostToCourse,
    required TResult Function(_AddStudentToCourse value) addStudentToCourse,
    required TResult Function(_RemoveStudentFromCourse value)
        removeStudentFromCourse,
    required TResult Function(_RemoveUpdatedCourseName value)
        removedUpdatedCourseName,
    required TResult Function(_Reset value) reset,
  }) {
    return addPostToCourse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCourses value)? getCourses,
    TResult? Function(_CreateCourse value)? createCourse,
    TResult? Function(_DeleteCourse value)? deleteCourse,
    TResult? Function(_UpdateCourse value)? updateCourse,
    TResult? Function(_AddPostToCourse value)? addPostToCourse,
    TResult? Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult? Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult? Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult? Function(_Reset value)? reset,
  }) {
    return addPostToCourse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCourses value)? getCourses,
    TResult Function(_CreateCourse value)? createCourse,
    TResult Function(_DeleteCourse value)? deleteCourse,
    TResult Function(_UpdateCourse value)? updateCourse,
    TResult Function(_AddPostToCourse value)? addPostToCourse,
    TResult Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (addPostToCourse != null) {
      return addPostToCourse(this);
    }
    return orElse();
  }
}

abstract class _AddPostToCourse implements CourseEvent {
  const factory _AddPostToCourse(
      {required final String courseCode,
      required final PostModel post,
      required final bool remove}) = _$_AddPostToCourse;

  String get courseCode;
  PostModel get post;
  bool get remove;
  @JsonKey(ignore: true)
  _$$_AddPostToCourseCopyWith<_$_AddPostToCourse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddStudentToCourseCopyWith<$Res> {
  factory _$$_AddStudentToCourseCopyWith(_$_AddStudentToCourse value,
          $Res Function(_$_AddStudentToCourse) then) =
      __$$_AddStudentToCourseCopyWithImpl<$Res>;
  @useResult
  $Res call({String courseCode, String studentId});
}

/// @nodoc
class __$$_AddStudentToCourseCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$_AddStudentToCourse>
    implements _$$_AddStudentToCourseCopyWith<$Res> {
  __$$_AddStudentToCourseCopyWithImpl(
      _$_AddStudentToCourse _value, $Res Function(_$_AddStudentToCourse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseCode = null,
    Object? studentId = null,
  }) {
    return _then(_$_AddStudentToCourse(
      courseCode: null == courseCode
          ? _value.courseCode
          : courseCode // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddStudentToCourse implements _AddStudentToCourse {
  const _$_AddStudentToCourse(
      {required this.courseCode, required this.studentId});

  @override
  final String courseCode;
  @override
  final String studentId;

  @override
  String toString() {
    return 'CourseEvent.addStudentToCourse(courseCode: $courseCode, studentId: $studentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddStudentToCourse &&
            (identical(other.courseCode, courseCode) ||
                other.courseCode == courseCode) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseCode, studentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddStudentToCourseCopyWith<_$_AddStudentToCourse> get copyWith =>
      __$$_AddStudentToCourseCopyWithImpl<_$_AddStudentToCourse>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCourses,
    required TResult Function(String name, String id, UserModel teacher)
        createCourse,
    required TResult Function(String courseCode) deleteCourse,
    required TResult Function(String courseCode, String name) updateCourse,
    required TResult Function(String courseCode, PostModel post, bool remove)
        addPostToCourse,
    required TResult Function(String courseCode, String studentId)
        addStudentToCourse,
    required TResult Function(String courseCode, String studentId)
        removeStudentFromCourse,
    required TResult Function() removedUpdatedCourseName,
    required TResult Function() reset,
  }) {
    return addStudentToCourse(courseCode, studentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCourses,
    TResult? Function(String name, String id, UserModel teacher)? createCourse,
    TResult? Function(String courseCode)? deleteCourse,
    TResult? Function(String courseCode, String name)? updateCourse,
    TResult? Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult? Function(String courseCode, String studentId)? addStudentToCourse,
    TResult? Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult? Function()? removedUpdatedCourseName,
    TResult? Function()? reset,
  }) {
    return addStudentToCourse?.call(courseCode, studentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCourses,
    TResult Function(String name, String id, UserModel teacher)? createCourse,
    TResult Function(String courseCode)? deleteCourse,
    TResult Function(String courseCode, String name)? updateCourse,
    TResult Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult Function(String courseCode, String studentId)? addStudentToCourse,
    TResult Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult Function()? removedUpdatedCourseName,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (addStudentToCourse != null) {
      return addStudentToCourse(courseCode, studentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCourses value) getCourses,
    required TResult Function(_CreateCourse value) createCourse,
    required TResult Function(_DeleteCourse value) deleteCourse,
    required TResult Function(_UpdateCourse value) updateCourse,
    required TResult Function(_AddPostToCourse value) addPostToCourse,
    required TResult Function(_AddStudentToCourse value) addStudentToCourse,
    required TResult Function(_RemoveStudentFromCourse value)
        removeStudentFromCourse,
    required TResult Function(_RemoveUpdatedCourseName value)
        removedUpdatedCourseName,
    required TResult Function(_Reset value) reset,
  }) {
    return addStudentToCourse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCourses value)? getCourses,
    TResult? Function(_CreateCourse value)? createCourse,
    TResult? Function(_DeleteCourse value)? deleteCourse,
    TResult? Function(_UpdateCourse value)? updateCourse,
    TResult? Function(_AddPostToCourse value)? addPostToCourse,
    TResult? Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult? Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult? Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult? Function(_Reset value)? reset,
  }) {
    return addStudentToCourse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCourses value)? getCourses,
    TResult Function(_CreateCourse value)? createCourse,
    TResult Function(_DeleteCourse value)? deleteCourse,
    TResult Function(_UpdateCourse value)? updateCourse,
    TResult Function(_AddPostToCourse value)? addPostToCourse,
    TResult Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (addStudentToCourse != null) {
      return addStudentToCourse(this);
    }
    return orElse();
  }
}

abstract class _AddStudentToCourse implements CourseEvent {
  const factory _AddStudentToCourse(
      {required final String courseCode,
      required final String studentId}) = _$_AddStudentToCourse;

  String get courseCode;
  String get studentId;
  @JsonKey(ignore: true)
  _$$_AddStudentToCourseCopyWith<_$_AddStudentToCourse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemoveStudentFromCourseCopyWith<$Res> {
  factory _$$_RemoveStudentFromCourseCopyWith(_$_RemoveStudentFromCourse value,
          $Res Function(_$_RemoveStudentFromCourse) then) =
      __$$_RemoveStudentFromCourseCopyWithImpl<$Res>;
  @useResult
  $Res call({String courseCode, String studentId});
}

/// @nodoc
class __$$_RemoveStudentFromCourseCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$_RemoveStudentFromCourse>
    implements _$$_RemoveStudentFromCourseCopyWith<$Res> {
  __$$_RemoveStudentFromCourseCopyWithImpl(_$_RemoveStudentFromCourse _value,
      $Res Function(_$_RemoveStudentFromCourse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseCode = null,
    Object? studentId = null,
  }) {
    return _then(_$_RemoveStudentFromCourse(
      courseCode: null == courseCode
          ? _value.courseCode
          : courseCode // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RemoveStudentFromCourse implements _RemoveStudentFromCourse {
  const _$_RemoveStudentFromCourse(
      {required this.courseCode, required this.studentId});

  @override
  final String courseCode;
  @override
  final String studentId;

  @override
  String toString() {
    return 'CourseEvent.removeStudentFromCourse(courseCode: $courseCode, studentId: $studentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveStudentFromCourse &&
            (identical(other.courseCode, courseCode) ||
                other.courseCode == courseCode) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseCode, studentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoveStudentFromCourseCopyWith<_$_RemoveStudentFromCourse>
      get copyWith =>
          __$$_RemoveStudentFromCourseCopyWithImpl<_$_RemoveStudentFromCourse>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCourses,
    required TResult Function(String name, String id, UserModel teacher)
        createCourse,
    required TResult Function(String courseCode) deleteCourse,
    required TResult Function(String courseCode, String name) updateCourse,
    required TResult Function(String courseCode, PostModel post, bool remove)
        addPostToCourse,
    required TResult Function(String courseCode, String studentId)
        addStudentToCourse,
    required TResult Function(String courseCode, String studentId)
        removeStudentFromCourse,
    required TResult Function() removedUpdatedCourseName,
    required TResult Function() reset,
  }) {
    return removeStudentFromCourse(courseCode, studentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCourses,
    TResult? Function(String name, String id, UserModel teacher)? createCourse,
    TResult? Function(String courseCode)? deleteCourse,
    TResult? Function(String courseCode, String name)? updateCourse,
    TResult? Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult? Function(String courseCode, String studentId)? addStudentToCourse,
    TResult? Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult? Function()? removedUpdatedCourseName,
    TResult? Function()? reset,
  }) {
    return removeStudentFromCourse?.call(courseCode, studentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCourses,
    TResult Function(String name, String id, UserModel teacher)? createCourse,
    TResult Function(String courseCode)? deleteCourse,
    TResult Function(String courseCode, String name)? updateCourse,
    TResult Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult Function(String courseCode, String studentId)? addStudentToCourse,
    TResult Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult Function()? removedUpdatedCourseName,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (removeStudentFromCourse != null) {
      return removeStudentFromCourse(courseCode, studentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCourses value) getCourses,
    required TResult Function(_CreateCourse value) createCourse,
    required TResult Function(_DeleteCourse value) deleteCourse,
    required TResult Function(_UpdateCourse value) updateCourse,
    required TResult Function(_AddPostToCourse value) addPostToCourse,
    required TResult Function(_AddStudentToCourse value) addStudentToCourse,
    required TResult Function(_RemoveStudentFromCourse value)
        removeStudentFromCourse,
    required TResult Function(_RemoveUpdatedCourseName value)
        removedUpdatedCourseName,
    required TResult Function(_Reset value) reset,
  }) {
    return removeStudentFromCourse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCourses value)? getCourses,
    TResult? Function(_CreateCourse value)? createCourse,
    TResult? Function(_DeleteCourse value)? deleteCourse,
    TResult? Function(_UpdateCourse value)? updateCourse,
    TResult? Function(_AddPostToCourse value)? addPostToCourse,
    TResult? Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult? Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult? Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult? Function(_Reset value)? reset,
  }) {
    return removeStudentFromCourse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCourses value)? getCourses,
    TResult Function(_CreateCourse value)? createCourse,
    TResult Function(_DeleteCourse value)? deleteCourse,
    TResult Function(_UpdateCourse value)? updateCourse,
    TResult Function(_AddPostToCourse value)? addPostToCourse,
    TResult Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (removeStudentFromCourse != null) {
      return removeStudentFromCourse(this);
    }
    return orElse();
  }
}

abstract class _RemoveStudentFromCourse implements CourseEvent {
  const factory _RemoveStudentFromCourse(
      {required final String courseCode,
      required final String studentId}) = _$_RemoveStudentFromCourse;

  String get courseCode;
  String get studentId;
  @JsonKey(ignore: true)
  _$$_RemoveStudentFromCourseCopyWith<_$_RemoveStudentFromCourse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemoveUpdatedCourseNameCopyWith<$Res> {
  factory _$$_RemoveUpdatedCourseNameCopyWith(_$_RemoveUpdatedCourseName value,
          $Res Function(_$_RemoveUpdatedCourseName) then) =
      __$$_RemoveUpdatedCourseNameCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RemoveUpdatedCourseNameCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$_RemoveUpdatedCourseName>
    implements _$$_RemoveUpdatedCourseNameCopyWith<$Res> {
  __$$_RemoveUpdatedCourseNameCopyWithImpl(_$_RemoveUpdatedCourseName _value,
      $Res Function(_$_RemoveUpdatedCourseName) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RemoveUpdatedCourseName implements _RemoveUpdatedCourseName {
  const _$_RemoveUpdatedCourseName();

  @override
  String toString() {
    return 'CourseEvent.removedUpdatedCourseName()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveUpdatedCourseName);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCourses,
    required TResult Function(String name, String id, UserModel teacher)
        createCourse,
    required TResult Function(String courseCode) deleteCourse,
    required TResult Function(String courseCode, String name) updateCourse,
    required TResult Function(String courseCode, PostModel post, bool remove)
        addPostToCourse,
    required TResult Function(String courseCode, String studentId)
        addStudentToCourse,
    required TResult Function(String courseCode, String studentId)
        removeStudentFromCourse,
    required TResult Function() removedUpdatedCourseName,
    required TResult Function() reset,
  }) {
    return removedUpdatedCourseName();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCourses,
    TResult? Function(String name, String id, UserModel teacher)? createCourse,
    TResult? Function(String courseCode)? deleteCourse,
    TResult? Function(String courseCode, String name)? updateCourse,
    TResult? Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult? Function(String courseCode, String studentId)? addStudentToCourse,
    TResult? Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult? Function()? removedUpdatedCourseName,
    TResult? Function()? reset,
  }) {
    return removedUpdatedCourseName?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCourses,
    TResult Function(String name, String id, UserModel teacher)? createCourse,
    TResult Function(String courseCode)? deleteCourse,
    TResult Function(String courseCode, String name)? updateCourse,
    TResult Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult Function(String courseCode, String studentId)? addStudentToCourse,
    TResult Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult Function()? removedUpdatedCourseName,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (removedUpdatedCourseName != null) {
      return removedUpdatedCourseName();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCourses value) getCourses,
    required TResult Function(_CreateCourse value) createCourse,
    required TResult Function(_DeleteCourse value) deleteCourse,
    required TResult Function(_UpdateCourse value) updateCourse,
    required TResult Function(_AddPostToCourse value) addPostToCourse,
    required TResult Function(_AddStudentToCourse value) addStudentToCourse,
    required TResult Function(_RemoveStudentFromCourse value)
        removeStudentFromCourse,
    required TResult Function(_RemoveUpdatedCourseName value)
        removedUpdatedCourseName,
    required TResult Function(_Reset value) reset,
  }) {
    return removedUpdatedCourseName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCourses value)? getCourses,
    TResult? Function(_CreateCourse value)? createCourse,
    TResult? Function(_DeleteCourse value)? deleteCourse,
    TResult? Function(_UpdateCourse value)? updateCourse,
    TResult? Function(_AddPostToCourse value)? addPostToCourse,
    TResult? Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult? Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult? Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult? Function(_Reset value)? reset,
  }) {
    return removedUpdatedCourseName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCourses value)? getCourses,
    TResult Function(_CreateCourse value)? createCourse,
    TResult Function(_DeleteCourse value)? deleteCourse,
    TResult Function(_UpdateCourse value)? updateCourse,
    TResult Function(_AddPostToCourse value)? addPostToCourse,
    TResult Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (removedUpdatedCourseName != null) {
      return removedUpdatedCourseName(this);
    }
    return orElse();
  }
}

abstract class _RemoveUpdatedCourseName implements CourseEvent {
  const factory _RemoveUpdatedCourseName() = _$_RemoveUpdatedCourseName;
}

/// @nodoc
abstract class _$$_ResetCopyWith<$Res> {
  factory _$$_ResetCopyWith(_$_Reset value, $Res Function(_$_Reset) then) =
      __$$_ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResetCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$_Reset>
    implements _$$_ResetCopyWith<$Res> {
  __$$_ResetCopyWithImpl(_$_Reset _value, $Res Function(_$_Reset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Reset implements _Reset {
  const _$_Reset();

  @override
  String toString() {
    return 'CourseEvent.reset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCourses,
    required TResult Function(String name, String id, UserModel teacher)
        createCourse,
    required TResult Function(String courseCode) deleteCourse,
    required TResult Function(String courseCode, String name) updateCourse,
    required TResult Function(String courseCode, PostModel post, bool remove)
        addPostToCourse,
    required TResult Function(String courseCode, String studentId)
        addStudentToCourse,
    required TResult Function(String courseCode, String studentId)
        removeStudentFromCourse,
    required TResult Function() removedUpdatedCourseName,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCourses,
    TResult? Function(String name, String id, UserModel teacher)? createCourse,
    TResult? Function(String courseCode)? deleteCourse,
    TResult? Function(String courseCode, String name)? updateCourse,
    TResult? Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult? Function(String courseCode, String studentId)? addStudentToCourse,
    TResult? Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult? Function()? removedUpdatedCourseName,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCourses,
    TResult Function(String name, String id, UserModel teacher)? createCourse,
    TResult Function(String courseCode)? deleteCourse,
    TResult Function(String courseCode, String name)? updateCourse,
    TResult Function(String courseCode, PostModel post, bool remove)?
        addPostToCourse,
    TResult Function(String courseCode, String studentId)? addStudentToCourse,
    TResult Function(String courseCode, String studentId)?
        removeStudentFromCourse,
    TResult Function()? removedUpdatedCourseName,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCourses value) getCourses,
    required TResult Function(_CreateCourse value) createCourse,
    required TResult Function(_DeleteCourse value) deleteCourse,
    required TResult Function(_UpdateCourse value) updateCourse,
    required TResult Function(_AddPostToCourse value) addPostToCourse,
    required TResult Function(_AddStudentToCourse value) addStudentToCourse,
    required TResult Function(_RemoveStudentFromCourse value)
        removeStudentFromCourse,
    required TResult Function(_RemoveUpdatedCourseName value)
        removedUpdatedCourseName,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCourses value)? getCourses,
    TResult? Function(_CreateCourse value)? createCourse,
    TResult? Function(_DeleteCourse value)? deleteCourse,
    TResult? Function(_UpdateCourse value)? updateCourse,
    TResult? Function(_AddPostToCourse value)? addPostToCourse,
    TResult? Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult? Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult? Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult? Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCourses value)? getCourses,
    TResult Function(_CreateCourse value)? createCourse,
    TResult Function(_DeleteCourse value)? deleteCourse,
    TResult Function(_UpdateCourse value)? updateCourse,
    TResult Function(_AddPostToCourse value)? addPostToCourse,
    TResult Function(_AddStudentToCourse value)? addStudentToCourse,
    TResult Function(_RemoveStudentFromCourse value)? removeStudentFromCourse,
    TResult Function(_RemoveUpdatedCourseName value)? removedUpdatedCourseName,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements CourseEvent {
  const factory _Reset() = _$_Reset;
}

/// @nodoc
mixin _$CourseState {
  List<CourseModel> get courses => throw _privateConstructorUsedError;
  String? get updatedCourseName => throw _privateConstructorUsedError;
  Option<Either<CourseFailure, List<CourseModel>>> get getCoursesOption =>
      throw _privateConstructorUsedError;
  Option<Either<CourseFailure, Unit>> get createCourseOption =>
      throw _privateConstructorUsedError;
  Option<Either<CourseFailure, Unit>> get deleteCourseOption =>
      throw _privateConstructorUsedError;
  Option<Either<CourseFailure, Unit>> get updateCourseOption =>
      throw _privateConstructorUsedError;
  Option<Either<CourseFailure, PostModel>> get addPostOption =>
      throw _privateConstructorUsedError;
  Option<Either<CourseFailure, CourseModel>> get sendInvitationOption =>
      throw _privateConstructorUsedError;
  Option<Either<CourseFailure, Unit>> get removeStudentOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CourseStateCopyWith<CourseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseStateCopyWith<$Res> {
  factory $CourseStateCopyWith(
          CourseState value, $Res Function(CourseState) then) =
      _$CourseStateCopyWithImpl<$Res, CourseState>;
  @useResult
  $Res call(
      {List<CourseModel> courses,
      String? updatedCourseName,
      Option<Either<CourseFailure, List<CourseModel>>> getCoursesOption,
      Option<Either<CourseFailure, Unit>> createCourseOption,
      Option<Either<CourseFailure, Unit>> deleteCourseOption,
      Option<Either<CourseFailure, Unit>> updateCourseOption,
      Option<Either<CourseFailure, PostModel>> addPostOption,
      Option<Either<CourseFailure, CourseModel>> sendInvitationOption,
      Option<Either<CourseFailure, Unit>> removeStudentOption});
}

/// @nodoc
class _$CourseStateCopyWithImpl<$Res, $Val extends CourseState>
    implements $CourseStateCopyWith<$Res> {
  _$CourseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courses = null,
    Object? updatedCourseName = freezed,
    Object? getCoursesOption = null,
    Object? createCourseOption = null,
    Object? deleteCourseOption = null,
    Object? updateCourseOption = null,
    Object? addPostOption = null,
    Object? sendInvitationOption = null,
    Object? removeStudentOption = null,
  }) {
    return _then(_value.copyWith(
      courses: null == courses
          ? _value.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<CourseModel>,
      updatedCourseName: freezed == updatedCourseName
          ? _value.updatedCourseName
          : updatedCourseName // ignore: cast_nullable_to_non_nullable
              as String?,
      getCoursesOption: null == getCoursesOption
          ? _value.getCoursesOption
          : getCoursesOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CourseFailure, List<CourseModel>>>,
      createCourseOption: null == createCourseOption
          ? _value.createCourseOption
          : createCourseOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CourseFailure, Unit>>,
      deleteCourseOption: null == deleteCourseOption
          ? _value.deleteCourseOption
          : deleteCourseOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CourseFailure, Unit>>,
      updateCourseOption: null == updateCourseOption
          ? _value.updateCourseOption
          : updateCourseOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CourseFailure, Unit>>,
      addPostOption: null == addPostOption
          ? _value.addPostOption
          : addPostOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CourseFailure, PostModel>>,
      sendInvitationOption: null == sendInvitationOption
          ? _value.sendInvitationOption
          : sendInvitationOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CourseFailure, CourseModel>>,
      removeStudentOption: null == removeStudentOption
          ? _value.removeStudentOption
          : removeStudentOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CourseFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CourseStateCopyWith<$Res>
    implements $CourseStateCopyWith<$Res> {
  factory _$$_CourseStateCopyWith(
          _$_CourseState value, $Res Function(_$_CourseState) then) =
      __$$_CourseStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CourseModel> courses,
      String? updatedCourseName,
      Option<Either<CourseFailure, List<CourseModel>>> getCoursesOption,
      Option<Either<CourseFailure, Unit>> createCourseOption,
      Option<Either<CourseFailure, Unit>> deleteCourseOption,
      Option<Either<CourseFailure, Unit>> updateCourseOption,
      Option<Either<CourseFailure, PostModel>> addPostOption,
      Option<Either<CourseFailure, CourseModel>> sendInvitationOption,
      Option<Either<CourseFailure, Unit>> removeStudentOption});
}

/// @nodoc
class __$$_CourseStateCopyWithImpl<$Res>
    extends _$CourseStateCopyWithImpl<$Res, _$_CourseState>
    implements _$$_CourseStateCopyWith<$Res> {
  __$$_CourseStateCopyWithImpl(
      _$_CourseState _value, $Res Function(_$_CourseState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courses = null,
    Object? updatedCourseName = freezed,
    Object? getCoursesOption = null,
    Object? createCourseOption = null,
    Object? deleteCourseOption = null,
    Object? updateCourseOption = null,
    Object? addPostOption = null,
    Object? sendInvitationOption = null,
    Object? removeStudentOption = null,
  }) {
    return _then(_$_CourseState(
      courses: null == courses
          ? _value._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<CourseModel>,
      updatedCourseName: freezed == updatedCourseName
          ? _value.updatedCourseName
          : updatedCourseName // ignore: cast_nullable_to_non_nullable
              as String?,
      getCoursesOption: null == getCoursesOption
          ? _value.getCoursesOption
          : getCoursesOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CourseFailure, List<CourseModel>>>,
      createCourseOption: null == createCourseOption
          ? _value.createCourseOption
          : createCourseOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CourseFailure, Unit>>,
      deleteCourseOption: null == deleteCourseOption
          ? _value.deleteCourseOption
          : deleteCourseOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CourseFailure, Unit>>,
      updateCourseOption: null == updateCourseOption
          ? _value.updateCourseOption
          : updateCourseOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CourseFailure, Unit>>,
      addPostOption: null == addPostOption
          ? _value.addPostOption
          : addPostOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CourseFailure, PostModel>>,
      sendInvitationOption: null == sendInvitationOption
          ? _value.sendInvitationOption
          : sendInvitationOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CourseFailure, CourseModel>>,
      removeStudentOption: null == removeStudentOption
          ? _value.removeStudentOption
          : removeStudentOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CourseFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_CourseState implements _CourseState {
  const _$_CourseState(
      {required final List<CourseModel> courses,
      required this.updatedCourseName,
      required this.getCoursesOption,
      required this.createCourseOption,
      required this.deleteCourseOption,
      required this.updateCourseOption,
      required this.addPostOption,
      required this.sendInvitationOption,
      required this.removeStudentOption})
      : _courses = courses;

  final List<CourseModel> _courses;
  @override
  List<CourseModel> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  @override
  final String? updatedCourseName;
  @override
  final Option<Either<CourseFailure, List<CourseModel>>> getCoursesOption;
  @override
  final Option<Either<CourseFailure, Unit>> createCourseOption;
  @override
  final Option<Either<CourseFailure, Unit>> deleteCourseOption;
  @override
  final Option<Either<CourseFailure, Unit>> updateCourseOption;
  @override
  final Option<Either<CourseFailure, PostModel>> addPostOption;
  @override
  final Option<Either<CourseFailure, CourseModel>> sendInvitationOption;
  @override
  final Option<Either<CourseFailure, Unit>> removeStudentOption;

  @override
  String toString() {
    return 'CourseState(courses: $courses, updatedCourseName: $updatedCourseName, getCoursesOption: $getCoursesOption, createCourseOption: $createCourseOption, deleteCourseOption: $deleteCourseOption, updateCourseOption: $updateCourseOption, addPostOption: $addPostOption, sendInvitationOption: $sendInvitationOption, removeStudentOption: $removeStudentOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CourseState &&
            const DeepCollectionEquality().equals(other._courses, _courses) &&
            (identical(other.updatedCourseName, updatedCourseName) ||
                other.updatedCourseName == updatedCourseName) &&
            (identical(other.getCoursesOption, getCoursesOption) ||
                other.getCoursesOption == getCoursesOption) &&
            (identical(other.createCourseOption, createCourseOption) ||
                other.createCourseOption == createCourseOption) &&
            (identical(other.deleteCourseOption, deleteCourseOption) ||
                other.deleteCourseOption == deleteCourseOption) &&
            (identical(other.updateCourseOption, updateCourseOption) ||
                other.updateCourseOption == updateCourseOption) &&
            (identical(other.addPostOption, addPostOption) ||
                other.addPostOption == addPostOption) &&
            (identical(other.sendInvitationOption, sendInvitationOption) ||
                other.sendInvitationOption == sendInvitationOption) &&
            (identical(other.removeStudentOption, removeStudentOption) ||
                other.removeStudentOption == removeStudentOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_courses),
      updatedCourseName,
      getCoursesOption,
      createCourseOption,
      deleteCourseOption,
      updateCourseOption,
      addPostOption,
      sendInvitationOption,
      removeStudentOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CourseStateCopyWith<_$_CourseState> get copyWith =>
      __$$_CourseStateCopyWithImpl<_$_CourseState>(this, _$identity);
}

abstract class _CourseState implements CourseState {
  const factory _CourseState(
      {required final List<CourseModel> courses,
      required final String? updatedCourseName,
      required final Option<Either<CourseFailure, List<CourseModel>>>
          getCoursesOption,
      required final Option<Either<CourseFailure, Unit>> createCourseOption,
      required final Option<Either<CourseFailure, Unit>> deleteCourseOption,
      required final Option<Either<CourseFailure, Unit>> updateCourseOption,
      required final Option<Either<CourseFailure, PostModel>> addPostOption,
      required final Option<Either<CourseFailure, CourseModel>>
          sendInvitationOption,
      required final Option<Either<CourseFailure, Unit>>
          removeStudentOption}) = _$_CourseState;

  @override
  List<CourseModel> get courses;
  @override
  String? get updatedCourseName;
  @override
  Option<Either<CourseFailure, List<CourseModel>>> get getCoursesOption;
  @override
  Option<Either<CourseFailure, Unit>> get createCourseOption;
  @override
  Option<Either<CourseFailure, Unit>> get deleteCourseOption;
  @override
  Option<Either<CourseFailure, Unit>> get updateCourseOption;
  @override
  Option<Either<CourseFailure, PostModel>> get addPostOption;
  @override
  Option<Either<CourseFailure, CourseModel>> get sendInvitationOption;
  @override
  Option<Either<CourseFailure, Unit>> get removeStudentOption;
  @override
  @JsonKey(ignore: true)
  _$$_CourseStateCopyWith<_$_CourseState> get copyWith =>
      throw _privateConstructorUsedError;
}
