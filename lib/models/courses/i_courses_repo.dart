import 'package:classroom/models/courses/course_model.dart';
import 'package:classroom/models/courses/courses_failure.dart';
import 'package:dartz/dartz.dart';

abstract class ICoursesController {
  Future<Either<CourseFailure, List<CourseModel>>> getCourses();
  Future<Either<CourseFailure, CourseModel>> createCourse(
    String name,
    String id,
    String teacherName,
  );
  Future<Either<CourseFailure, Unit>> deleteCourse(String courseCode);
  Future<Either<CourseFailure, Unit>> updateCourse({
    required String courseCode,
    required String name,
  });
  Future<Either<CourseFailure, Unit>> addPostToCourse({
    required String courseCode,
    required String post,
    required bool remove,
  });
  Future<Either<CourseFailure, Unit>> addStudentToCourse({
    required String courseCode,
    required String studentId,
  });
  Future<Either<CourseFailure, Unit>> removeStudentFromCourse({
    required String courseCode,
    required String studentId,
  });
}
