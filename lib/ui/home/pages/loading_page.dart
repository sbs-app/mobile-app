import 'package:classroom/states/course/course_bloc.dart';
import 'package:classroom/ui/core/fade_animations.dart';
import 'package:classroom/ui/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  bool isVisible = false;
  @override
  void initState() {
    CourseBloc.addEventWithoutContext(const CourseEvent.getCourses());
    Future.delayed(const Duration(seconds: 6), () {
      isVisible = true;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseBloc, CourseState>(
      listener: (context, state) {
        state.getCoursesOption.fold(
          () => null,
          (some) => some.fold(
            (l) => null,
            (r) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            ),
          ),
        );
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 0.75,
                    child: Lottie.asset(
                      'assets/core/loading.json',
                      frameRate: FrameRate.max,
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 600),
                    child: Visibility(
                      visible: !isVisible,
                      child: const FadeFromDownAnimation(
                        child: Text(
                          "Loading...",
                          style: TextStyle(
                            color: Colors.white24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 600),
                    child: Visibility(
                      visible: isVisible,
                      child: const FadeFromUpAnimation(
                        child: Text(
                          "Almost there!",
                          style: TextStyle(
                            color: Colors.white24,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
