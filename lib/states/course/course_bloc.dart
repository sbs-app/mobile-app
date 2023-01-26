import 'dart:async';

import 'package:classroom/core/utils/custom_build_context.dart';
import 'package:classroom/models/courses/course_model.dart';
import 'package:classroom/models/courses/courses_failure.dart';
import 'package:classroom/models/courses/i_courses_repo.dart';
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
            await _coursesRepo.createCourse(e.name, e.id, e.teacherName);
        yield failureOrSuccess.fold(
          (l) => state.copyWith(createCourseOption: Some(Left(l))),
          (r) {
            state.courses.insert(0, r.copyWith());
            return state.copyWith(createCourseOption: const Some(Right(unit)));
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
          (r) => state.copyWith(sendInvitationOption: Some(Right(r))),
        );
      },
      deleteCourse: (e) async* {
        yield state.copyWith(deleteCourseOption: const None());
        final failureOrSuccess = await _coursesRepo.deleteCourse(e.courseId);
        yield failureOrSuccess.fold(
          (l) => state.copyWith(deleteCourseOption: Some(Left(l))),
          (r) {
            final index =
                state.courses.indexWhere((element) => element.id == e.courseId);
            state.courses.removeAt(index);
            return state.copyWith(deleteCourseOption: Some(Right(r)));
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
            final index = state.courses
                .indexWhere((element) => element.code == e.courseCode);
            final updatedCourse = state.courses[index].copyWith(name: e.name);
            state.courses.removeAt(index);
            state.courses.insert(index, updatedCourse);
            return state.copyWith(
              updateCourseOption: Some(Right(r)),
              updatedCourseName: e.name,
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
            final index = state.courses
                .indexWhere((element) => element.code == e.courseCode);

            CourseModel updatedCourse;
            if (!e.remove) {
              updatedCourse = state.courses[index]
                  .copyWith(posts: [...state.courses[index].posts!, e.post]);
            } else {
              final List<String> newPosts = state.courses[index].posts!
                  .where((c) => c != e.post)
                  .toList();
              updatedCourse = state.courses[index].copyWith(posts: newPosts);
            }

            state.courses.removeAt(index);
            state.courses.insert(index, updatedCourse);
            return state.copyWith(
              addPostOption: Some(Right(r)),
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
            state.courses
                .firstWhere((element) => element.code == e.courseCode)
                .students!
                .removeWhere(
                  (element) => element == e.studentId,
                );

            return state.copyWith(removeStudentOption: Some(Right(r)));
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
