import 'dart:async';

import 'package:classroom/core/utils/custom_build_context.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/models/courses/course_model.dart';
import 'package:classroom/models/courses/courses_failure.dart';
import 'package:classroom/models/courses/i_courses_repo.dart';
import 'package:classroom/models/courses/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'course_bloc.freezed.dart';
part 'course_event.dart';
part 'course_state.dart';

@injectable
@prod
class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc(this._coursesRepo) : super(CourseState.initial());
  final ICoursesController _coursesRepo;

  static void addEventWithoutContext(CourseEvent e) =>
      BlocProvider.of<CourseBloc>(context).add(e);

  @override
  Stream<CourseState> mapEventToState(
    CourseEvent event,
  ) async* {
    yield* event.map(
      getCourses: (_) async* {
        yield state.copyWith(getCoursesOption: const None());
        final failureOrSuccess = await _coursesRepo.getCourses();
        yield failureOrSuccess.fold(
          (l) => state.copyWith(getCoursesOption: Some(Left(l))),
          (r) => state.copyWith(getCoursesOption: Some(Right(r)), courses: r),
        );
      },
      createCourse: (e) async* {
        yield state.copyWith(createCourseOption: const None());
        final failureOrSuccess =
            await _coursesRepo.createCourse(e.name, e.id, e.teacher);
        yield failureOrSuccess.fold(
          (l) => state.copyWith(createCourseOption: Some(Left(l))),
          (r) {
            final newCourses = state.courses.toList();
            newCourses.add(r.copyWith());
            return state.copyWith(
              createCourseOption: const Some(Right(unit)),
              courses: newCourses,
            );
          },
        );
      },
      addStudentToCourse: (e) async* {
        yield state.copyWith(sendInvitationOption: const None());
        final failureOrSuccess = await _coursesRepo.addStudentToCourse(
          courseCode: e.courseCode,
          studentId: e.studentId,
        );
        yield failureOrSuccess.fold(
          (l) => state.copyWith(sendInvitationOption: Some(Left(l))),
          (r) {
            final newCourses = state.courses.toList();
            newCourses.add(r);
            return state.copyWith(
              sendInvitationOption: Some(Right(r)),
              courses: newCourses,
            );
          },
        );
      },
      deleteCourse: (e) async* {
        yield state.copyWith(deleteCourseOption: const None());
        final failureOrSuccess = await _coursesRepo.deleteCourse(e.courseCode);
        yield failureOrSuccess.fold(
          (l) => state.copyWith(deleteCourseOption: Some(Left(l))),
          (r) {
            final newCourses = state.courses.toList();
            final index = newCourses
                .indexWhere((element) => element.code == e.courseCode);
            newCourses.removeAt(index);
            return state.copyWith(
              deleteCourseOption: Some(Right(r)),
              courses: newCourses,
            );
          },
        );
      },
      updateCourse: (e) async* {
        yield state.copyWith(updateCourseOption: const None());
        final failureOrSuccess = await _coursesRepo.updateCourse(
          courseCode: e.courseCode,
          name: e.name,
        );
        yield failureOrSuccess.fold(
          (l) => state.copyWith(updateCourseOption: Some(Left(l))),
          (r) {
            final newCourses = state.courses.toList();

            final index = newCourses
                .indexWhere((element) => element.code == e.courseCode);
            final updatedCourse = newCourses[index].copyWith(name: e.name);
            newCourses.removeAt(index);
            newCourses.insert(index, updatedCourse);
            return state.copyWith(
              updateCourseOption: Some(Right(r)),
              updatedCourseName: e.name,
              courses: newCourses,
            );
          },
        );
      },
      addPostToCourse: (e) async* {
        yield state.copyWith(addPostOption: const None());
        final failureOrSuccess = await _coursesRepo.addPostToCourse(
          courseCode: e.courseCode,
          post: e.post,
          remove: e.remove,
        );
        yield failureOrSuccess.fold(
          (l) => state.copyWith(addPostOption: Some(Left(l))),
          (r) {
            final newCourses = state.courses.toList();

            final index = newCourses
                .indexWhere((element) => element.code == e.courseCode);

            CourseModel updatedCourse;
            if (!e.remove) {
              updatedCourse = state.courses[index]
                  .copyWith(posts: [...newCourses[index].posts!, r]);
            } else {
              final List<PostModel> newPosts = newCourses[index]
                  .posts!
                  .where((c) => c.post != r.post)
                  .toList();
              updatedCourse = newCourses[index].copyWith(posts: newPosts);
            }

            newCourses.removeAt(index);
            newCourses.insert(index, updatedCourse);
            return state.copyWith(
              addPostOption: Some(Right(r)),
              courses: newCourses,
            );
          },
        );
      },
      removeStudentFromCourse: (e) async* {
        yield state.copyWith(removeStudentOption: const None());
        final failureOrSuccess = await _coursesRepo.removeStudentFromCourse(
          courseCode: e.courseCode,
          studentId: e.studentId,
        );
        yield failureOrSuccess.fold(
          (l) => state.copyWith(removeStudentOption: Some(Left(l))),
          (r) {
            final newCourses = state.courses.toList();
            final index = newCourses
                .indexWhere((element) => element.code == e.courseCode);
            newCourses.removeAt(index);
            return state.copyWith(
              removeStudentOption: Some(Right(r)),
              courses: newCourses,
            );
          },
        );
      },
      removedUpdatedCourseName: (_) async* {
        yield state.copyWith(updatedCourseName: null);
      },
      reset: (_) async* {
        yield CourseState.initial();
      },
    );
  }
}
