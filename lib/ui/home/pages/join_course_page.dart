import 'package:classroom/core/user_utils.dart';
import 'package:classroom/states/course/course_bloc.dart';
import 'package:classroom/ui/core/clean_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class JoinCoursePage extends StatefulWidget {
  const JoinCoursePage({Key? key, this.courseCode}) : super(key: key);

  final String? courseCode;

  @override
  _JoinCoursePageState createState() => _JoinCoursePageState();
}

class _JoinCoursePageState extends State<JoinCoursePage>
    with TickerProviderStateMixin {
  bool showErrors = false;
  bool isLoading = false;

  late TextEditingController classNameController;

  @override
  void initState() {
    classNameController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    classNameController.dispose();
    super.dispose();
  }

  Widget nameErrorWidget() {
    final bool isValidName = cleanString(classNameController.text).isNotEmpty;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: showErrors
          ? isValidName
              ? const SizedBox.shrink()
              : const Text(
                  "Class code should have atleast one character",
                  style: TextStyle(color: Colors.grey),
                )
          : const SizedBox.shrink(),
    );
  }

  bool get isValid => cleanString(classNameController.text).isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseBloc, CourseState>(
      listener: (context, state) {
        state.sendInvitationOption.fold(
          () => null,
          (some) => some.fold(
            (l) {
              isLoading = false;
              setState(() {});
              Fluttertoast.showToast(
                msg: l.maybeMap(
                  orElse: () => "",
                  clientFailure: (_) =>
                      "Oops! Course code not found or invalid.",
                  studentAlreadyExist: (_) =>
                      "Oops! You are already part of this course.",
                  serverFailure: (_) =>
                      "Oops! Server down. Please try again after sometime.",
                ),
                textColor: Colors.black87,
                backgroundColor: Colors.white,
                toastLength: Toast.LENGTH_LONG,
                fontSize: 12,
              );
            },
            (r) => Navigator.pop(context),
          ),
        );
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                splashColor: Colors.transparent,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.keyboard_backspace_outlined,
                    color: Colors.white30,
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(40.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Join Course",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Enter class code below:",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: classNameController,
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(bottom: 3),
                            child: Icon(
                              Icons.title,
                              size: 18,
                              color: Colors.black12,
                            ),
                          ),
                          focusColor: Colors.black,
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Class code",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 400),
                      child: nameErrorWidget(),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 60,
                      width: double.maxFinite,
                      child: TextButton(
                        onPressed: () {
                          showErrors = true;
                          if (isValid) {
                            isLoading = true;
                            CourseBloc.addEventWithoutContext(
                              CourseEvent.addStudentToCourse(
                                courseCode: classNameController.text,
                                studentId: getUserModel().id,
                              ),
                            );
                          }
                          setState(() {});
                        },
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.white),
                          backgroundColor: isValid
                              ? MaterialStateProperty.all(
                                  const Color(0xff0DF5E3),
                                )
                              : MaterialStateProperty.all(Colors.white10),
                        ),
                        child: isLoading
                            ? const SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.black,
                                ),
                              )
                            : const Text(
                                "JOIN",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
