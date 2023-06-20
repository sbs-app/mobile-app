import 'package:classroom/core/strings.dart';
import 'package:classroom/core/user_utils.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/models/courses/course_model.dart';
import 'package:classroom/states/course/course_bloc.dart';
import 'package:classroom/ui/home/pages/absence_page.dart';
import 'package:classroom/ui/home/pages/create_course_page.dart';
import 'package:classroom/ui/home/pages/create_post.dart';
import 'package:classroom/ui/home/pages/invite_student_page.dart';
import 'package:classroom/ui/home/widgets/user_avatar.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({
    super.key,
    required this.courseCode,
    required this.primaryColor,
    required this.courseCoverImageUrl,
  });
  final String courseCode;
  final String courseCoverImageUrl;
  final Color primaryColor;

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget? buildAttendeeSubtitle(UserModel attendee) {
    // Student is linked to parent account
    if (attendee.email == getUserModel().link) {
      return Text(
        'Your student',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey[400],
        ),
      );
    } else if (attendee.roleId == UserTypes.student) {
      return Text(
        'Student',
        style: TextStyle(
          fontSize: 10,
          color: Colors.grey[400],
        ),
      );
    } else if (attendee.roleId == UserTypes.parent) {
      return Text(
        'Parent',
        style: TextStyle(
          fontSize: 10,
          color: Colors.grey[400],
        ),
      );
    } else {
      return null;
    }
  }

  Widget? buildAttendeeOptions(UserModel attendee, CourseModel course) {
    // Current user owns this course, give admin.
    if (getUserModel().email == course.teacher!.email) {
      return Column(
        children: [
          PopupMenuButton(
            onSelected: (value) {
              CourseBloc.addEventWithoutContext(
                CourseEvent.removeStudentFromCourse(
                  courseCode: course.id,
                  studentId: attendee.id,
                ),
              );
            },
            child: Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  height: 20,
                  value: "Remove",
                  child: Row(
                    children: const [
                      Icon(
                        Icons.delete_outline,
                        size: 14,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Remove Student",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )
              ];
            },
          ),
        ],
      );
      // Student is linked to parent account
    } else if (attendee.email == getUserModel().link) {
      return PopupMenuButton(
        onSelected: (value) {
          if (value == "absence") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AbsencePage(),
              ),
            );
          }
        },
        child: const Icon(
          Icons.more_vert_outlined,
          color: Colors.white,
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              height: 20,
              value: "absence",
              child: Row(
                children: const [
                  Icon(
                    Icons.calendar_month,
                    size: 14,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Schedule absence",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )
          ];
        },
      );
    } else {
      return null;
    }
  }

  List<UserModel> getAbsentStudents(List<UserModel> attendees) {
    List<UserModel> absentStudent = [];

    for (UserModel attendee in attendees) {
      if (attendee.roleId == UserTypes.parent) {
        if (attendee.link != '' || attendee.link.isNotEmpty) {
          if (attendee.absence != [-1, -1]) {
            for (UserModel maybeStudent in attendees) {
              if (maybeStudent.email == attendee.link) {
                absentStudent.add(
                  maybeStudent.copyWith(absence: attendee.absence),
                );
              }
            }
          }
        }
      }
    }
    return absentStudent;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        CourseBloc.addEventWithoutContext(
          const CourseEvent.removedUpdatedCourseName(),
        );
        return true;
      },
      child: SafeArea(
        child: BlocConsumer<CourseBloc, CourseState>(
          listener: (context, state) {
            state.removeStudentOption.fold(
              () => null,
              (some) => some.fold(
                (l) => null,
                (r) async {
                  Fluttertoast.showToast(
                    msg: "Removed student from course",
                    textColor: Colors.black87,
                    backgroundColor: Colors.white,
                    toastLength: Toast.LENGTH_LONG,
                    fontSize: 12,
                  );
                  // Navigator.pop(context);
                },
              ),
            );
            // Force update
            setState(() {});
          },
          builder: (context, state) {
            final isStudentOrParent =
                getUserModel().roleId == UserTypes.student ||
                    getUserModel().roleId == UserTypes.parent;

            final index = state.courses
                .indexWhere((course) => widget.courseCode == course.code);
            if (index <= -1) Navigator.pop(context);
            final course = state.courses[index];

            List<UserModel> absentStudents = getAbsentStudents(
              course.students!,
            );

            return Scaffold(
              backgroundColor: Colors.black,
              floatingActionButton: course.isCreatedByMe && !isStudentOrParent
                  ? SpeedDial(
                      tooltip: 'Edit Course',
                      overlayColor: Colors.black12,
                      spacing: 20,
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      elevation: 10,
                      activeChild: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                      children: [
                        SpeedDialChild(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CreatePostPage(
                                  courseCode: course.code,
                                  post: "",
                                ),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          label: "Add post",
                          labelStyle: const TextStyle(color: Colors.white),
                        ),
                        SpeedDialChild(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => InviteStudentPage(
                                  courseId: course.id,
                                  courseCode: course.code,
                                ),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.person_add_alt,
                            color: Colors.white,
                          ),
                          label: "Invite Students",
                          labelStyle: const TextStyle(color: Colors.white),
                        ),
                        SpeedDialChild(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CreateCoursePage(
                                  courseCode: course.code,
                                  name: course.name,
                                ),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                          ),
                          label: "Edit Course",
                          labelStyle: const TextStyle(color: Colors.white),
                        ),
                        SpeedDialChild(
                          backgroundColor: Colors.red.shade400,
                          onTap: () {
                            CourseBloc.addEventWithoutContext(
                              CourseEvent.deleteCourse(course.code),
                            );
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          label: "Delete Course",
                          labelStyle: const TextStyle(color: Colors.white),
                        ),
                      ],
                      child: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    )
                  : SpeedDial(
                      overlayColor: Colors.black12,
                      spacing: 20,
                      backgroundColor: Colors.white,
                      activeChild: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                      children: [
                        SpeedDialChild(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CreatePostPage(
                                  courseCode: course.code,
                                  post: "",
                                ),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          label: "Add post",
                          labelStyle: const TextStyle(color: Colors.white),
                        ),
                        SpeedDialChild(
                          backgroundColor: Colors.red.shade400,
                          onTap: () {
                            CourseBloc.addEventWithoutContext(
                              CourseEvent.removeStudentFromCourse(
                                courseCode: course.code,
                                studentId: getUserModel().id,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          label: "Leave Course",
                          labelStyle: const TextStyle(color: Colors.white),
                        ),
                      ],
                      child: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    ),
              body: BlocBuilder<CourseBloc, CourseState>(
                builder: (context, state) {
                  final String? updatedCourseName = state.updatedCourseName;
                  final String courseName = updatedCourseName ?? course.name;
                  return Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Hero(
                              tag: course.code,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        widget.courseCoverImageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    courseName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        child: UserAvatar(
                                          userModel: course.teacher!,
                                          height: 32,
                                          width: 32,
                                        ),
                                      ),
                                      Text(
                                        course.teacher!.userName,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ContainedTabBarView(
                          tabBarProperties: TabBarProperties(
                            indicatorColor: widget.primaryColor,
                            indicatorSize: TabBarIndicatorSize.label,
                          ),
                          tabs: [
                            Text(
                              "Posts",
                              style: TextStyle(
                                fontFamily: GoogleFonts.montserrat().fontFamily,
                              ),
                            ),
                            Text(
                              "Attendees",
                              style: TextStyle(
                                fontFamily: GoogleFonts.montserrat().fontFamily,
                              ),
                            ),
                            Text(
                              "Absences",
                              style: TextStyle(
                                fontFamily: GoogleFonts.montserrat().fontFamily,
                              ),
                            )
                          ],
                          views: [
                            ListView.builder(
                              padding: const EdgeInsets.all(10),
                              itemCount: course.posts!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    tileColor: Colors.grey[900],
                                    leading: UserAvatar(
                                      userModel: course.teacher!,
                                      height: 35,
                                      width: 35,
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            course.teacher!.userName,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            DateFormat.yMMMd().add_jm().format(
                                                  course.posts![index].timestamp
                                                      .toDate(),
                                                ),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: course.posts![index].type ==
                                              PostTypes.text
                                          ? Text(
                                              course.posts![index].post,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                              ),
                                            )
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.network(
                                                course.posts![index].post,
                                              ),
                                            ),
                                    ),
                                    trailing: course.isCreatedByMe &&
                                            !isStudentOrParent
                                        ? IconButton(
                                            icon:
                                                const Icon(Icons.remove_circle),
                                            color: Colors.red,
                                            onPressed: () {
                                              CourseBloc.addEventWithoutContext(
                                                CourseEvent.addPostToCourse(
                                                  courseCode: course.code,
                                                  post: course.posts![index],
                                                  remove: true,
                                                ),
                                              );
                                            },
                                          )
                                        : null,
                                  ),
                                );
                              },
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.0, left: 15.0),
                                  child: Text(
                                    "Teachers",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                Flexible(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    itemCount: 1,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final UserModel teacher = course.teacher!;
                                      return ListTile(
                                        leading: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: UserAvatar(
                                            userModel: teacher,
                                            height: 35,
                                            width: 35,
                                          ),
                                        ),
                                        title: Text(
                                          teacher.userName,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                        subtitle: Text(
                                          teacher.email,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.0, left: 15.0),
                                  child: Text(
                                    "Students and Parents",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    itemCount: course.students!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final UserModel student =
                                          course.students![index];
                                      return ListTile(
                                        leading: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: UserAvatar(
                                            userModel: student,
                                            height: 35,
                                            width: 35,
                                          ),
                                        ),
                                        title: Text(
                                          student.userName,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                        subtitle:
                                            buildAttendeeSubtitle(student),
                                        trailing: buildAttendeeOptions(
                                          student,
                                          course,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.0, left: 15.0),
                                  child: Text(
                                    "Absences",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                Flexible(
                                  child: ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    itemCount: absentStudents.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final UserModel student =
                                          absentStudents[index];
                                      DateTime absenceFrom =
                                          DateTime.fromMillisecondsSinceEpoch(
                                        student.absence[0],
                                      );
                                      DateTime absenceTo =
                                          DateTime.fromMillisecondsSinceEpoch(
                                        student.absence[1],
                                      );
                                      String absenceString = "";
                                      if (absenceFrom.day == absenceTo.day)
                                        absenceString =
                                            "Student will be absent on ${DateFormat('MMMM dd').format(absenceFrom)}";
                                      else
                                        absenceString =
                                            "Student will be absent from ${DateFormat('MMMM dd').format(absenceFrom)} to ${DateFormat('MMMM dd').format(absenceTo)}";

                                      return ListTile(
                                        leading: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: UserAvatar(
                                            userModel: student,
                                            height: 35,
                                            width: 35,
                                          ),
                                        ),
                                        title: Text(
                                          student.userName,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                        subtitle: Text(
                                          absenceString,
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
