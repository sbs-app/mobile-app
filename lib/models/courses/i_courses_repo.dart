import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/models/courses/course_model.dart';
import 'package:classroom/models/courses/courses_failure.dart';
import 'package:classroom/models/courses/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class ICoursesController {
  Future<Either<CourseFailure, List<CourseModel>>> getCourses();
  Future<Either<CourseFailure, CourseModel>> createCourse(
    String name,
    String id,
    UserModel teacher,
  );
  Future<Either<CourseFailure, Unit>> deleteCourse(String courseCode);
  Future<Either<CourseFailure, Unit>> updateCourse({
    required String courseCode,
    required String name,
  });
  Future<Either<CourseFailure, PostModel>> addPostToCourse({
    required String courseCode,
    required PostModel post,
    required bool remove,
  });
  Future<Either<CourseFailure, CourseModel>> addStudentToCourse({
    required String courseCode,
    required String studentId,
  });
  Future<Either<CourseFailure, Unit>> removeStudentFromCourse({
    required String courseCode,
    required String studentId,
  });
}
