import 'package:classroom/core/user_utils.dart';
import 'package:classroom/states/course/course_bloc.dart';
import 'package:classroom/ui/core/clean_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class JoinSocialsPage extends StatefulWidget {
  const JoinSocialsPage({Key? key}) : super(key: key);

  @override
  _JoinSocialsPageState createState() => _JoinSocialsPageState();
}

class _JoinSocialsPageState extends State<JoinSocialsPage>
    with TickerProviderStateMixin {
  bool showErrors = false;
  bool isLoading = false;

  late TextEditingController linkController;

  @override
  void initState() {
    linkController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    linkController.dispose();
    super.dispose();
  }

  Widget linkErrorWidget() {
    final bool isValidLink = cleanString(linkController.text).isNotEmpty;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: showErrors
          ? isValidLink
              ? const SizedBox.shrink()
              : const Text(
                  "Please enter a valid link",
                  style: TextStyle(color: Colors.grey),
                )
          : const SizedBox.shrink(),
    );
  }

  bool get isValid => cleanString(linkController.text).isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseBloc, CourseState>(
      listener: (context, state) {
        //put join logic pls
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
                      "Join Socials",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Enter social media link below:",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: linkController,
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(bottom: 3),
                            child: Icon(
                              Icons.link,
                              size: 18,
                              color: Colors.black12,
                            ),
                          ),
                          focusColor: Colors.black,
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Social media link",
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
                      child: linkErrorWidget(),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 60,
                      width: double.maxFinite,
                      child: TextButton(
                        onPressed: () {
                          showErrors = true;
                          if (isValid) {
                            // Handle social media joining logic here
                            // ...
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
