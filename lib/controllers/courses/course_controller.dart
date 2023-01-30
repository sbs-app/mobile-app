import 'dart:math';
import 'package:classroom/core/strings.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/models/courses/course_model.dart';
import 'package:classroom/models/courses/courses_failure.dart';
import 'package:classroom/models/courses/i_courses_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:injectable/injectable.dart';

@prod
@Injectable(as: ICoursesController)
class CourseController extends ICoursesController {
  CourseController(this.firebaseFirestore, this.box);

  final FirebaseFirestore firebaseFirestore;

  // Get the firestore class from the firestore collection
  Future<CourseModel> getFirestoreClass(String classCode) {
    return firebaseFirestore.doc('/classes/$classCode').get().then(
          (documentSnapshot) =>
              CourseModel.fromFirestore(documentSnapshot.data()!),
        );
  }

  final Random _rnd = Random();

  String getRandomCode() {
    const int length = 8;
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(_rnd.nextInt(chars.length)),
      ),
    );
  }

  UserModel getUserModel() {
    if (getIt<Box>().get(HiveBoxNames.user) != null) {
      return getIt<Box>().get(HiveBoxNames.user) as UserModel;
    } else {
      // Invalid UserModel
      return UserModel(email: "", id: "", userName: "", classes: []);
    }
  }

  final Box box;
  @override
  Future<Either<CourseFailure, List<CourseModel>>> getCourses() async {
    final UserModel cacheUser = await box.get(HiveBoxNames.user) as UserModel;
    final List<CourseModel> courses = [];

    // for (final String classCode in cacheUser.classes) {
    //   if (classCode != "") {
    //     final CourseModel course = await getFirestoreClass(classCode);
    //     courses.add(course);
    //   }
    // }

    return Right(courses);
  }

  @override
  Future<Either<CourseFailure, CourseModel>> createCourse(
    String name,
    String id,
    UserModel teacher,
  ) async {
    final String code = getRandomCode();
    final CourseModel newClass = CourseModel(
      id: id,
      code: code,
      name: name,
      description: "",
      teacher: teacher,
      students: <UserModel>[],
      posts: <String>[],
    );

    firebaseFirestore.doc('/classes/$code').set(newClass.toJson());

    await addStudentToCourse(courseCode: code, studentId: id, isTeacher: true);

    return Right(newClass);
  }

  @override
  Future<Either<CourseFailure, Unit>> addStudentToCourse({
    required String courseCode,
    required String studentId,
    bool isTeacher = false,
  }) async {
    // Check if null or empty
    if (courseCode.isEmpty) return const Left(CourseFailure.clientFailure());

    // Check if class exists
    final classDoc = await firebaseFirestore.doc('/classes/$courseCode').get();
    if (!classDoc.exists) return const Left(CourseFailure.clientFailure());

    // Check if user has class already
    if (getUserModel().classes.contains(courseCode)) {
      return const Left(CourseFailure.studentAlreadyExist());
    }

    // Add class to user
    final UserModel current = getUserModel();
    current.classes.add(courseCode);
    firebaseFirestore.doc('/users/$studentId').update(current.toJson());

    // Add user to class
    final CourseModel currentCourse = await getFirestoreClass(courseCode);

    final CourseModel updatedCourse;
    if (!isTeacher) {
      final List<UserModel> updatedStudents = currentCourse.students!;
      updatedStudents.add(getUserModel());
      updatedCourse = currentCourse.copyWith(students: updatedStudents);
    } else {
      updatedCourse = currentCourse;
    }

    firebaseFirestore
        .doc('/classes/$courseCode')
        .update(updatedCourse.toJson());

    await box.put(HiveBoxNames.user, current.copyWith());

    return const Right(unit);
  }

  @override
  Future<Either<CourseFailure, Unit>> deleteCourse(String courseCode) async {
    // Check if null or empty
    if (courseCode.isEmpty) return const Left(CourseFailure.clientFailure());

    // Remove course
    firebaseFirestore.doc('/classes/$courseCode').delete();

    removeStudentFromCourse(
      courseCode: courseCode,
      studentId: FirebaseAuth.instance.currentUser!.uid,
    );

    return const Right(unit);
  }

  @override
  Future<Either<CourseFailure, Unit>> removeStudentFromCourse({
    required String courseCode,
    required String studentId,
  }) async {
    // Check if null or empty
    if (courseCode.isEmpty) return const Left(CourseFailure.clientFailure());

    // Remove class from user
    final UserModel current = getUserModel();
    current.classes.remove(courseCode);
    firebaseFirestore.doc('/users/$studentId').update(current.toJson());

    await box.put(HiveBoxNames.user, current.copyWith());

    return const Right(unit);
  }

  @override
  Future<Either<CourseFailure, Unit>> updateCourse({
    required String courseCode,
    required String name,
  }) async {
    // Check if null or empty
    if (courseCode.isEmpty) return const Left(CourseFailure.clientFailure());

    final CourseModel updatedCourse =
        (await getFirestoreClass(courseCode)).copyWith(name: name);
    firebaseFirestore
        .doc('/classes/$courseCode')
        .update(updatedCourse.toJson());

    return const Right(unit);
  }

  @override
  Future<Either<CourseFailure, Unit>> addPostToCourse({
    required String courseCode,
    required String post,
    required bool remove,
  }) async {
    // TODO: Use a document for this?
    // Check if null or empty
    if (courseCode.isEmpty) return const Left(CourseFailure.clientFailure());

    final CourseModel currentCourse = await getFirestoreClass(courseCode);
    final List<String> currentPosts = currentCourse.posts!;

    remove ? currentPosts.remove(post) : currentPosts.add(post);

    final CourseModel updatedCourse =
        currentCourse.copyWith(posts: currentPosts);
    firebaseFirestore
        .doc('/classes/$courseCode')
        .update(updatedCourse.toJson());

    return const Right(unit);
  }
}

class GoogleAPIClient extends IOClient {
  final Map<String, String> _headers;

  GoogleAPIClient(this._headers) : super();

  @override
  Future<IOStreamedResponse> send(BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) =>
      super.head(url, headers: headers?..addAll(_headers));
}
