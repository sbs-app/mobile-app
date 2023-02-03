import 'package:classroom/core/user_utils.dart';
import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReportBugPage extends StatefulWidget {
  const ReportBugPage({super.key});

  @override
  _ReportBugPageState createState() => _ReportBugPageState();
}

class _ReportBugPageState extends State<ReportBugPage> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.transparent,
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Report Bug".toUpperCase(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Enter your message here for your bug report.",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextFormField(
                            controller: controller,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.bug_report,
                                color: Colors.white,
                              ),
                              hintText: "Enter message",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                          TextButton(
                            child: const Text(
                              "Send report",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('/reports')
                                  .add({
                                "user": getUserModel().userName,
                                "message": controller.text
                              });
                              Fluttertoast.showToast(
                                msg: "Bug report sent!",
                                textColor: Colors.black87,
                                backgroundColor: Colors.white,
                                toastLength: Toast.LENGTH_LONG,
                                fontSize: 12,
                              );
                              controller.clear();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
