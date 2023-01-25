import 'package:cached_network_image/cached_network_image.dart';
import 'package:classroom/core/strings.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/models/courses/course_model.dart';
import 'package:classroom/states/course/course_bloc.dart';
import 'package:classroom/ui/home/pages/create_course_page.dart';
import 'package:classroom/ui/home/pages/invite_student_page.dart';
import 'package:classroom/ui/home/widgets/user_avatar.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({
    Key? key,
    required this.course,
    required this.primaryColor,
    required this.courseCoverImageUrl,
  }) : super(key: key);
  final CourseModel course;
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
          },
          builder: (context, state) {
            final isUserStudent =
                (getIt<Box>().get(HiveBoxNames.user) as UserModel).roleId == 0;
            return Scaffold(
              backgroundColor: Colors.black,
              floatingActionButton:
                  widget.course.isCreatedByMe && !isUserStudent
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
                                    builder: (_) => InviteStudentPage(
                                      courseId: widget.course.id,
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.person_add_alt,
                                color: Colors.black,
                              ),
                              label: "Invite Student",
                            ),
                            SpeedDialChild(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CreateCoursePage(
                                      courseId: widget.course.id,
                                      name: widget.course.name,
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.edit_outlined,
                                color: Colors.black,
                              ),
                              label: "Edit Course",
                            ),
                            SpeedDialChild(
                              backgroundColor: Colors.red.shade400,
                              onTap: () {
                                CourseBloc.addEventWithoutContext(
                                  CourseEvent.deleteCourse(widget.course.id),
                                );
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.black54,
                              ),
                              label: "Delete Course",
                            ),
                          ],
                          child: const Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                        )
                      : null,
              body: BlocBuilder<CourseBloc, CourseState>(
                builder: (context, state) {
                  final String? updatedCourseName = state.updatedCourseName;
                  final String courseName =
                      updatedCourseName ?? widget.course.name;
                  final String teacherEmail =
                      widget.course.teacher ?? "teacher@fixme.com";
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
                              tag: widget.course.id,
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
                                    widget.course.teacher ??
                                        "teacher@fixme.com",
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
                              "Students",
                              style: TextStyle(
                                fontFamily: GoogleFonts.montserrat().fontFamily,
                              ),
                            ),
                            Text(
                              "Teachers",
                              style: TextStyle(
                                fontFamily: GoogleFonts.montserrat().fontFamily,
                              ),
                            ),
                          ],
                          views: [
                            ListView.builder(
                              padding: const EdgeInsets.all(10),
                              itemCount: widget.course.posts!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    tileColor: Colors.grey[900],
                                    leading: const UserAvatar(),
                                    title: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        widget.course.teacher ?? "Teacher",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        widget.course.posts![index],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.comment),
                                      color: Colors.white,
                                      onPressed: () {},
                                    ),
                                  ),
                                );
                              },
                            ),
                            ListView.builder(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              itemCount: widget.course.students!.length,
                              itemBuilder: (BuildContext context, int index) {
                                final String student =
                                    widget.course.students![index];
                                return ListTile(
                                  leading: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: UserAvatar(),
                                  ),
                                  title: Text(
                                    student ?? "student@fixme.com",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white60,
                                    ),
                                  ),
                                  trailing: isUserStudent ||
                                          myEmail != teacherEmail
                                      ? null
                                      : PopupMenuButton(
                                          onSelected: (value) {
                                            CourseBloc.addEventWithoutContext(
                                              CourseEvent
                                                  .removeStudentFromCourse(
                                                courseId: "0",
                                                studentEmail: student ??
                                                    "student@fixme.com",
                                              ),
                                            );
                                          },
                                          child: const Icon(
                                            Icons.more_vert_outlined,
                                            color: Colors.white30,
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
                                                      // color: Colors.black38,
                                                      size: 14,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "Remove Student",
                                                      style: TextStyle(
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
                            ListView.builder(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                final String teacher = widget.course.teacher!;
                                return ListTile(
                                  leading: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: UserAvatar(),
                                  ),
                                  title: Text(
                                    teacher ?? "teacher@fixme.com",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white60,
                                    ),
                                  ),
                                );
                              },
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
