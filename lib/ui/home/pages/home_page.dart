import 'package:cached_network_image/cached_network_image.dart';
import 'package:classroom/core/strings.dart';
import 'package:classroom/core/user.dart';
import 'package:classroom/core/utils/chat.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/models/courses/course_model.dart';
import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:classroom/states/course/course_bloc.dart';
import 'package:classroom/ui/auth/pages/login_page.dart';
import 'package:classroom/ui/chat/chat_rooms.dart';
import 'package:classroom/ui/home/pages/calendar_page.dart';
import 'package:classroom/ui/home/pages/course_page.dart';
import 'package:classroom/ui/home/pages/create_course_page.dart';
import 'package:classroom/ui/home/pages/join_course_page.dart';
import 'package:classroom/ui/home/pages/settings_page.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, Color>> coverUrls = [
    {"breakfast": const Color(0xffFF8A66)},
    {"code": const Color(0xff566E7A)},
    {"learnlanguage": const Color(0xff3367D5)},
    {"cooking": const Color(0xff848484)},
    {"mealfamily": const Color(0xff4FC2F8)},
    {"read": const Color(0xff566E7A)},
    {"handcraft": const Color(0xff8E22A9)},
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final bool isUserStudent = getUserModel().roleId == UserTypes.student;
        final String userName = getUserModel().userName;
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            floatingActionButton: isUserStudent
                ? FloatingActionButton(
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
                  )
                : FloatingActionButton(
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
                  ),
            body: SliderDrawer(
              appBar: SliderAppBar(
                appBarColor: Colors.black,
                drawerIconColor: Colors.white,
                isTitleCenter: false,
                title: Text(
                  "My Courses".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
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
                      radius: 65,
                      backgroundColor: Colors.transparent,
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
                  // TODO: implement listener
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
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            // physics: const BouncingScrollPhysics(),
                            itemCount: state.courses.length,
                            itemBuilder: (BuildContext context, int index) {
                              final CourseModel course = state.courses[index];
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
                                    overlayColor: MaterialStateProperty.all(
                                      coverUrls[index % 7]
                                          .values
                                          .first
                                          .withOpacity(0.5),
                                    ),
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
                                              "https://www.gstatic.com/classroom/themes/img_${coverUrls[index % 7].entries.first.key}.jpg",
                                          primaryColor:
                                              coverUrls[index % 7].values.first,
                                        ),
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
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                "https://www.gstatic.com/classroom/themes/img_${coverUrls[index % 7].entries.first.key}.jpg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              course.name,
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
