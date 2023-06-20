import 'package:classroom/core/strings.dart';
import 'package:classroom/core/user_utils.dart';
import 'package:classroom/models/courses/course_model.dart';
import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:classroom/states/course/course_bloc.dart';
import 'package:classroom/ui/auth/pages/login_page.dart';
import 'package:classroom/ui/chat/chat_rooms.dart';
import 'package:classroom/ui/home/pages/calendar/calendar_page.dart';
import 'package:classroom/ui/home/pages/course_page.dart';
import 'package:classroom/ui/home/pages/create_course_page.dart';
import 'package:classroom/ui/home/pages/join_course_page.dart';
import 'package:classroom/ui/home/pages/link_student_page.dart';
import 'package:classroom/ui/home/pages/meetings_page.dart';
import 'package:classroom/ui/home/pages/settings_page.dart';
import 'package:classroom/ui/home/pages/socials_page.dart';
import 'package:classroom/ui/home/widgets/user_avatar.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> coverUrls = [
    "assets/courses/course-1.png",
    "assets/courses/course-2.png",
    "assets/courses/course-3.png",
    "assets/courses/course-4.png",
    "assets/courses/course-5.png",
    "assets/courses/course-6.png",
    "assets/courses/course-7.png",
    "assets/courses/course-8.png",
    "assets/courses/course-9.png",
    "assets/courses/course-10.png",
    "assets/courses/course-11.png",
    "assets/courses/course-12.png",
    "assets/courses/course-13.png",
    "assets/courses/course-14.png",
    "assets/courses/course-15.png",
  ];

  late CustomPopupMenuController controller;

  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();

  @override
  void initState() {
    controller = CustomPopupMenuController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildFloatingActionButton() {
    if (getUserModel().roleId == UserTypes.student) {
      return FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const JoinCoursePage(),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.black),
      );
    } else if (getUserModel().roleId == UserTypes.parent) {
      return SpeedDial(
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
                  builder: (_) => const LinkStudentPage(),
                ),
              );
            },
            child: const Icon(
              Icons.link,
              color: Colors.white,
            ),
            label: "Link student",
            labelStyle: const TextStyle(color: Colors.white),
          ),
          SpeedDialChild(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const JoinCoursePage(),
                ),
              );
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: "Join Course",
            labelStyle: const TextStyle(color: Colors.white),
          ),
        ],
        child: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
      );
    } else {
      return FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CreateCoursePage(),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.black),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final String userName = getUserModel().userName;
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            floatingActionButton: buildFloatingActionButton(),
            body: SliderDrawer(
              appBar: SliderAppBar(
                appBarColor: Colors.black,
                drawerIconColor: Colors.white,
                isTitleCenter: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Courses".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomPopupMenu(
                      controller: controller,
                      barrierColor: Colors.black45,
                      pressType: PressType.singleClick,
                      menuBuilder: () {
                        return Container(
                          width: 200,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 35,
                                // width: 100,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  UserTypes().typeToString(
                                    getUserModel().roleId!,
                                  ),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          userName,
                                          style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    height: 1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1),
                                      color: Colors.black12,
                                    ),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(
                                        Colors.black12,
                                      ),
                                    ),
                                    onPressed: () async {
                                      await Future.delayed(
                                        const Duration(
                                          milliseconds: 400,
                                        ),
                                      );
                                      controller.hideMenu();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const SettingsPage(),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.settings,
                                          color: Colors.black87,
                                          size: 14,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Settings",
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.white,
                                      ),
                                      overlayColor: MaterialStateProperty.all(
                                        Colors.white10,
                                      ),
                                    ),
                                    onPressed: () async {
                                      await Future.delayed(
                                        const Duration(
                                          milliseconds: 400,
                                        ),
                                      );
                                      controller.hideMenu();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const CalendarPage(),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.calendar_month,
                                          color: Colors.black87,
                                          size: 14,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Calendar",
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.white,
                                      ),
                                      overlayColor: MaterialStateProperty.all(
                                        Colors.white10,
                                      ),
                                    ),
                                    onPressed: () async {
                                      await Future.delayed(
                                        const Duration(
                                          milliseconds: 400,
                                        ),
                                      );
                                      controller.hideMenu();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const ChatPage(),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.chat,
                                          color: Colors.black87,
                                          size: 14,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Chat",
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.white,
                                      ),
                                      overlayColor: MaterialStateProperty.all(
                                        Colors.white10,
                                      ),
                                    ),
                                    onPressed: () async {
                                      await Future.delayed(
                                        const Duration(
                                          milliseconds: 400,
                                        ),
                                      );
                                      controller.hideMenu();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => VideoCall(),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.video_call,
                                          color: Colors.black87,
                                          size: 14,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Meetings",
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        const Color(0xff00B4DB),
                                      ),
                                      overlayColor: MaterialStateProperty.all(
                                        Colors.white10,
                                      ),
                                    ),
                                    onPressed: () async {
                                      await Future.delayed(
                                        const Duration(
                                          milliseconds: 400,
                                        ),
                                      );
                                      controller.hideMenu();

                                      AuthBloc.addEventWithoutContext(
                                        const AuthEvent.signOut(),
                                      );
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const LoginPage(),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.logout_rounded,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Logout",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      child: UserAvatar(
                        userModel: getUserModel(),
                        height: 35,
                        width: 35,
                      ),
                    )
                  ],
                ),
              ),
              key: _sliderDrawerKey,
              sliderOpenSize: 180,
              slider: Container(
                color: Colors.black,
                padding: const EdgeInsets.only(top: 30),
                child: ListView(
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    CircleAvatar(
                      radius: 62.5,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: getUserModel().photoURL.isEmpty
                            ? Image.asset(
                                "assets/auth/man.png",
                                fit: BoxFit.cover,
                              ).image
                            : Image.network(getUserModel().photoURL).image,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      userName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 35,
                        // width: 100,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(221, 89, 83, 83),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          UserTypes().typeToString(
                            getUserModel().roleId!,
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                    ...[
                      Menu(
                        Icons.calendar_month,
                        'Calendar',
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CalendarPage(),
                          ),
                        ),
                      ),
                      Menu(
                        Icons.chat,
                        'Chat',
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ChatPage(),
                          ),
                        ),
                      ),
                      Menu(
                        Icons.video_call,
                        'Meetings',
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => VideoCall(),
                          ),
                        ),
                      ),
                      Menu(
                        Icons.numbers,
                        'Socials',
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SocialsPage(),
                          ),
                        ),
                      ),
                      Menu(
                        Icons.settings,
                        'Settings',
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SettingsPage(),
                          ),
                        ),
                      ),
                      Menu(
                        Icons.logout,
                        'Log out',
                        () {
                          AuthBloc.addEventWithoutContext(
                            const AuthEvent.signOut(),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginPage(),
                            ),
                          );
                        },
                      )
                    ]
                        .map(
                          (menu) => _SliderMenuItem(
                            title: menu.title,
                            iconData: menu.iconData,
                            onTap: menu.onTap,
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
              child: BlocConsumer<CourseBloc, CourseState>(
                listener: (context, state) {
                  // Implement listener
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          color: Colors.white,
                          onRefresh: () async {
                            CourseBloc.addEventWithoutContext(
                              const CourseEvent.getCourses(),
                            );
                            await Future.delayed(const Duration(seconds: 4));
                          },
                          child: state.courses.isEmpty
                              ? Center(
                                  child: Text(
                                    "You have not joined any courses.",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  // physics: const BouncingScrollPhysics(),
                                  itemCount: state.courses.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final CourseModel course =
                                        state.courses[index];
                                    return Container(
                                      height: 150,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white10,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: TextButton(
                                        style: ButtonStyle(
                                          overlayColor:
                                              MaterialStateProperty.all(
                                                  Colors.black),
                                        ),
                                        onPressed: () async {
                                          await Future.delayed(
                                            const Duration(milliseconds: 250),
                                          );
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => CoursePage(
                                                  courseCode: course.code,
                                                  courseCoverImageUrl:
                                                      coverUrls[index % 15],
                                                  primaryColor: Colors.black),
                                            ),
                                          );
                                        },
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            Hero(
                                              tag: course.code,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Expanded(
                                                      child: Image.asset(
                                                        coverUrls[index % 15],
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                top: 20,
                                                bottom: 20,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    course.name,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          right: 10,
                                                        ),
                                                        child: UserAvatar(
                                                          userModel:
                                                              course.teacher!,
                                                          height: 32,
                                                          width: 32,
                                                        ),
                                                      ),
                                                      Text(
                                                        course
                                                            .teacher!.userName,
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
                                    );
                                  },
                                ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function()? onTap;

  const _SliderMenuItem({
    required this.title,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      leading: Icon(iconData, color: Colors.white),
      onTap: () => onTap?.call(),
    );
  }
}

class Menu {
  final IconData iconData;
  final String title;
  final Function()? onTap;

  Menu(this.iconData, this.title, this.onTap);
}
