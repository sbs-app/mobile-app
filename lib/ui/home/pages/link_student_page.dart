import 'package:classroom/core/user_utils.dart';
import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:classroom/ui/core/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LinkStudentPage extends StatefulWidget {
  const LinkStudentPage({Key? key, this.courseCode}) : super(key: key);

  final String? courseCode;

  @override
  _LinkStudentPageState createState() => _LinkStudentPageState();
}

class _LinkStudentPageState extends State<LinkStudentPage>
    with TickerProviderStateMixin {
  bool showErrors = false;
  bool isLoading = false;

  late TextEditingController studentEmailController;

  @override
  void initState() {
    studentEmailController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    studentEmailController.dispose();
    super.dispose();
  }

  Widget nameErrorWidget() {
    final bool isValidName = studentEmailController.text.isValidEmail();
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: showErrors
          ? isValidName
              ? const SizedBox.shrink()
              : const Text(
                  "Invalid student email!",
                  style: TextStyle(color: Colors.grey),
                )
          : const SizedBox.shrink(),
    );
  }

  bool get isValid => studentEmailController.text.isValidEmail();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.updateUserOption.fold(
          () => null,
          (some) => some.fold(
            (l) {
              isLoading = false;
              setState(() {});
              Fluttertoast.showToast(
                msg: l.maybeMap(
                  orElse: () => "",
                  clientAuthFailure: (_) =>
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
        return Builder(builder: (context) {
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
                        "Link student",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Please enter student email below:",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: studentEmailController,
                          decoration: InputDecoration(
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(bottom: 3),
                              child: Icon(
                                Icons.email,
                                size: 18,
                                color: Colors.black12,
                              ),
                            ),
                            focusColor: Colors.black,
                            contentPadding: const EdgeInsets.all(10),
                            hintText: "Student email",
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
                              // Link student to parent account
                              AuthBloc.addEventWithoutContext(
                                AuthEvent.updateUser(
                                  getUserModel().copyWith(
                                    link: studentEmailController.text,
                                  ),
                                ),
                              );
                            }
                            setState(() {});
                          },
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.white),
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
                                  "LINK",
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
        });
      },
    );
  }
}
