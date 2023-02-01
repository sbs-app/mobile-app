import 'package:cached_network_image/cached_network_image.dart';
import 'package:classroom/core/strings.dart';
import 'package:classroom/core/user_utils.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/models/courses/course_model.dart';
import 'package:classroom/states/course/course_bloc.dart';
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
import 'package:hive/hive.dart';
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
            final isUserStudent =
                (getIt<Box>().get(HiveBoxNames.user) as UserModel).roleId ==
                    UserTypes.student;

            final index = state.courses
                .indexWhere((course) => widget.courseCode == course.code);
            if (index <= -1) Navigator.pop(context);
            final course = state.courses[index];

            return Scaffold(
              backgroundColor: Colors.black,
              floatingActionButton: course.isCreatedByMe && !isUserStudent
                  ? SpeedDial(
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
                  final String teacherEmail = course.teacher!.email;
                  final String myEmail =
                      (getIt<Box>().get(HiveBoxNames.user) as UserModel).email;
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
                        padding: const EdgeInsets.all(8),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Hero(
                              tag: course.code,
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: widget.courseCoverImageUrl,
                                  fit: BoxFit.cover,
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
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    course.teacher!.userName,
                                    style: const TextStyle(
                                      color: Colors.white54,
                                    ),
                                  ),
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
                                            !isUserStudent
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
                                const Divider(),
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
                                      );
                                    },
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.0, left: 15.0),
                                  child: Text(
                                    "Students",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Divider(),
                                Flexible(
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
                                        trailing: isUserStudent ||
                                                myEmail != teacherEmail
                                            ? null
                                            : PopupMenuButton(
                                                onSelected: (value) {
                                                  CourseBloc
                                                      .addEventWithoutContext(
                                                    CourseEvent
                                                        .removeStudentFromCourse(
                                                      courseCode: course.id,
                                                      studentId:
                                                          getUserModel().id,
                                                    ),
                                                  );
                                                },
                                                child: const Icon(
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
                                                            Icons
                                                                .delete_outline,
                                                            size: 14,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            "Remove Student",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ];
                                                },
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
