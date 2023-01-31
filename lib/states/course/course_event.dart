part of 'course_bloc.dart';

@freezed
class CourseEvent with _$CourseEvent {
  const factory CourseEvent.getCourses() = _GetCourses;
  const factory CourseEvent.createCourse(
    String name,
    String id,
    UserModel teacher,
  ) = _CreateCourse;
  const factory CourseEvent.deleteCourse(String courseCode) = _DeleteCourse;
  const factory CourseEvent.updateCourse({
    required String courseCode,
    required String name,
  }) = _UpdateCourse;
  const factory CourseEvent.addPostToCourse({
    required String courseCode,
    required PostModel post,
    required bool remove,
  }) = _AddPostToCourse;

  const factory CourseEvent.addStudentToCourse({
    required String courseCode,
    required String studentId,
  }) = _AddStudentToCourse;

  const factory CourseEvent.removeStudentFromCourse({
    required String courseCode,
    required String studentId,
  }) = _RemoveStudentFromCourse;
  const factory CourseEvent.removedUpdatedCourseName() =
      _RemoveUpdatedCourseName;
  const factory CourseEvent.reset() = _Reset;
}
