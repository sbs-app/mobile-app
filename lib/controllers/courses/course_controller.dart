import 'package:classroom/core/strings.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/models/courses/course_model.dart';
import 'package:classroom/models/courses/courses_failure.dart';
import 'package:classroom/models/courses/i_courses_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:injectable/injectable.dart';

// TODO: FIX THIS (GOOGLE CLASSROOM API USAGE)

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

  final Box box;
  @override
  Future<Either<CourseFailure, List<CourseModel>>> getCourses() async {
    final UserModel cacheUser = await box.get(HiveBoxNames.user) as UserModel;
    final List<CourseModel> courses = [];

    for (final String classCode in cacheUser.classes) {
      final CourseModel course = await getFirestoreClass(classCode);
      courses.add(course);
    }

    return Right(courses);
  }

  @override
  Future<Either<CourseFailure, CourseModel>> createCourse(String name) async {
    // TODO: FIX CREATING CLASS
    // try {
    //   final GoogleSignInAccount? googleUser = await GoogleSignIn(
    //     scopes: [ClassroomApi.classroomCoursesScope],
    //   ).signIn();

    //   final GoogleAPIClient httpClient =
    //       GoogleAPIClient(await googleUser!.authHeaders);

    //   final api = ClassroomApi(httpClient);

    //   final Course request = Course(ownerId: googleUser.id, name: name);

    //   final newCourse = await api.courses.create(request);

    //   final List<Teacher> teachers = [];
    //   final List<Student> students = [];

    //   final teachersResponse = await api.courses.teachers.list(newCourse.id!);
    //   final studentsResponse = await api.courses.students.list(newCourse.id!);

    //   if (teachersResponse.teachers != null) {
    //     for (final teacher in teachersResponse.teachers!) {
    //       teachers.add(teacher);
    //     }
    //   }

    //   if (studentsResponse.students != null) {
    //     for (final student in studentsResponse.students!) {
    //       students.add(student);
    //     }
    //   }

    //   final CourseModel courseModel = CourseModel(
    //     id: newCourse.id!,
    //     name: newCourse.name!,
    //     teachers: teachers,
    //     students: students,
    //   );

    //   return Right(courseModel);
    // } catch (e) {
    //   return const Left(CourseFailure.clientFailure());
    // }
    return const Left(CourseFailure.clientFailure());
  }

  @override
  Future<Either<CourseFailure, Unit>> addStudentToCourse({
    required String courseId,
    required String studentEmail,
  }) async {
    // TODO: FIX ADDING STUDENT TO CLASS
    // try {
    //   final GoogleSignInAccount? googleUser = await GoogleSignIn(
    //     scopes: [
    //       ClassroomApi.classroomRostersScope,
    //     ],
    //   ).signIn();

    //   final GoogleAPIClient httpClient =
    //       GoogleAPIClient(await googleUser!.authHeaders);

    //   final api = ClassroomApi(httpClient);

    //   final request = Invitation(
    //     courseId: courseId,
    //     role: "STUDENT",
    //     userId: studentEmail,
    //   );

    //   await api.invitations.create(request);
    //   return const Right(unit);
    // } catch (e) {
    //   if (e is DetailedApiRequestError) {
    //     if (e.status == 409) {
    //       return const Left(CourseFailure.studentAlreadyInvited());
    //     } else if (e.status == 403) {
    //       return const Left(CourseFailure.studentAlreadyExist());
    //     } else {
    //       return const Left(CourseFailure.clientFailure());
    //     }
    //   } else {
    //     return const Left(CourseFailure.clientFailure());
    //   }
    // }
    return const Left(CourseFailure.clientFailure());
  }

  @override
  Future<Either<CourseFailure, Unit>> deleteCourse(String courseId) async {
    // TODO: FIX DELETING COURSE
    // try {
    //   final GoogleSignInAccount? googleUser = await GoogleSignIn(
    //     scopes: [
    //       ClassroomApi.classroomCoursesScope,
    //     ],
    //   ).signIn();

    //   final GoogleAPIClient httpClient =
    //       GoogleAPIClient(await googleUser!.authHeaders);

    //   final api = ClassroomApi(httpClient);
    //   await api.courses.delete(courseId);
    //   return const Right(unit);
    // } catch (e) {
    //   return const Left(CourseFailure.serverFailure());
    // }
    return const Left(CourseFailure.clientFailure());
  }

  @override
  Future<Either<CourseFailure, Unit>> removeStudentFromCourse({
    required String courseId,
    required String studentEmail,
  }) async {
    // TODO: FIX REMOVE STUDENT FROM CLASS
    // try {
    //   final GoogleSignInAccount? googleUser = await GoogleSignIn(
    //     scopes: [
    //       ClassroomApi.classroomRostersScope,
    //     ],
    //   ).signIn();

    //   final GoogleAPIClient httpClient =
    //       GoogleAPIClient(await googleUser!.authHeaders);

    //   final api = ClassroomApi(httpClient);
    //   await api.courses.students.delete(courseId, studentEmail);
    //   return const Right(unit);
    // } catch (e) {
    //   return const Left(CourseFailure.serverFailure());
    // }
    return const Left(CourseFailure.clientFailure());
  }

  @override
  Future<Either<CourseFailure, Unit>> updateCourse({
    required String name,
    required String courseId,
  }) async {
    // TODO: FIX UPDATE COURSE
    // try {
    //   final GoogleSignInAccount? googleUser = await GoogleSignIn(
    //     scopes: [
    //       ClassroomApi.classroomCoursesScope,
    //     ],
    //   ).signIn();

    //   final GoogleAPIClient httpClient =
    //       GoogleAPIClient(await googleUser!.authHeaders);

    //   final api = ClassroomApi(httpClient);
    //   final Course request = Course(ownerId: googleUser.id, name: name);

    //   await api.courses.update(request, courseId);
    //   return const Right(unit);
    // } catch (e) {
    //   return const Left(CourseFailure.serverFailure());
    // }
    return const Left(CourseFailure.clientFailure());
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
