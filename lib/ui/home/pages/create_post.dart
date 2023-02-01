import 'dart:io';

import 'package:classroom/core/strings.dart';
import 'package:classroom/core/user_utils.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/models/courses/post_model.dart';
import 'package:classroom/states/course/course_bloc.dart';
import 'package:classroom/ui/core/clean_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_text_reveal/fancy_text_reveal.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key, this.post, this.courseCode})
      : super(key: key);

  final String? post;
  final String? courseCode;

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage>
    with TickerProviderStateMixin {
  bool showErrors = false;
  bool isLoading = false;

  late TextEditingController postController;

  @override
  void initState() {
    postController = TextEditingController(text: widget.post)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    postController.dispose();
    super.dispose();
  }

  Widget nameErrorWidget() {
    final bool isValidName = cleanString(postController.text).isNotEmpty;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: showErrors
          ? isValidName
              ? const SizedBox.shrink()
              : const Text(
                  "Post should have atleast one character",
                  style: TextStyle(color: Colors.white24),
                )
          : const SizedBox.shrink(),
    );
  }

  bool get isValid => cleanString(postController.text).isNotEmpty;

  String currentType = PostTypes.text;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseBloc, CourseState>(
      listener: (context, state) {
        state.addPostOption.fold(
          () => null,
          (some) => some.fold(
            (l) {
              isLoading = false;
              setState(() {});
              Fluttertoast.showToast(
                msg: l.maybeMap(
                  orElse: () => "",
                  clientFailure: (_) => "Oops! Invalid post",
                  serverFailure: (_) =>
                      "Oops! You cannot post to this course or other error.",
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
                    const FancyTextReveal(
                      properties: Properties(
                        milliseconds: 400,
                        // horizontalSpacing: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      child: Text(
                        "New Post",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Please fill below details to continue",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text("Type: "),
                    DropdownButton(
                      value: currentType,
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        setState(() {
                          currentType = value.toString();
                        });
                      },
                      items: PostTypes.allTypes.map((type) {
                        return DropdownMenuItem(
                          value: type,
                          child: Text(type.toUpperCase()),
                        );
                      }).toList(),
                    ),
                    if (currentType == PostTypes.text)
                      Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              controller: postController,
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
                                hintText: "Enter your message here",
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
                                  final PostModel model = PostModel(
                                    id: getUserModel().id,
                                    docid: "",
                                    type: currentType,
                                    post: postController.text,
                                    timestamp: Timestamp.now(),
                                  );
                                  CourseBloc.addEventWithoutContext(
                                    CourseEvent.addPostToCourse(
                                      courseCode: widget.courseCode!,
                                      post: model,
                                      remove: false,
                                    ),
                                  );
                                }
                                setState(() {});
                              },
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                                backgroundColor: isValid
                                    ? MaterialStateProperty.all(
                                        const Color(0xff0DF5E3),
                                      )
                                    : MaterialStateProperty.all(
                                        Colors.white10,
                                      ),
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
                                      "POST",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      )
                    else
                      Column(
                        children: [
                          SizedBox(
                            height: 60,
                            width: double.maxFinite,
                            child: TextButton(
                              onPressed: () async {
                                final ImagePicker picker = ImagePicker();
                                final XFile? image = await picker.pickImage(
                                  source: ImageSource.gallery,
                                );

                                if (image == null) {
                                  Fluttertoast.showToast(
                                    msg: "No photo was selected or invalid",
                                    textColor: Colors.black87,
                                    backgroundColor: Colors.white,
                                    toastLength: Toast.LENGTH_LONG,
                                    fontSize: 12,
                                  );
                                  return;
                                }

                                final Reference ref =
                                    FirebaseStorage.instance.ref().child(
                                          "uploads/${getUserModel().id}-${widget.courseCode}-${DateTime.now().toIso8601String()}.png",
                                        );

                                final TaskSnapshot uploadTask =
                                    await ref.putFile(File(image.path));
                                String imageURL = "";
                                imageURL =
                                    await uploadTask.ref.getDownloadURL();

                                final PostModel model = PostModel(
                                  id: getUserModel().id,
                                  docid: "",
                                  type: currentType,
                                  post: imageURL,
                                  timestamp: Timestamp.now(),
                                );
                                CourseBloc.addEventWithoutContext(
                                  CourseEvent.addPostToCourse(
                                    courseCode: widget.courseCode!,
                                    post: model,
                                    remove: false,
                                  ),
                                );

                                Fluttertoast.showToast(
                                  msg: "Image uploaded!",
                                  textColor: Colors.black87,
                                  backgroundColor: Colors.white,
                                  toastLength: Toast.LENGTH_LONG,
                                  fontSize: 12,
                                );

                                setState(() {});
                              },
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                                backgroundColor: isValid
                                    ? MaterialStateProperty.all(
                                        const Color(0xff0DF5E3),
                                      )
                                    : MaterialStateProperty.all(
                                        Colors.white10,
                                      ),
                              ),
                              child: const Text(
                                "Pick image to upload",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        ],
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
