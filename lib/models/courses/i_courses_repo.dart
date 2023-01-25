import 'package:classroom/models/courses/course_model.dart';
import 'package:classroom/models/courses/courses_failure.dart';
import 'package:dartz/dartz.dart';

abstract class ICoursesController {
  Future<Either<CourseFailure, List<CourseModel>>> getCourses();
  Future<Either<CourseFailure, CourseModel>> createCourse(String name);
  Future<Either<CourseFailure, Unit>> deleteCourse(String courseId);
  Future<Either<CourseFailure, Unit>> updateCourse({
    required String courseId,
    required String name,
  });
  Future<Either<CourseFailure, Unit>> addStudentToCourse({
    required String courseId,
    required String studentEmail,
  });
  Future<Either<CourseFailure, Unit>> removeStudentFromCourse({
    required String courseId,
    required String studentEmail,
  });
}
