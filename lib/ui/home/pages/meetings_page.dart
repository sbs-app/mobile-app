import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:classroom/core/user_utils.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

class VideoCall extends StatefulWidget {
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  late TextEditingController serverText;
  late TextEditingController roomText;
  late TextEditingController subjectText;
  late TextEditingController nameText;
  late TextEditingController emailText;

  var isAudioOnly = true;
  var isAudioMuted = true;
  var isVideoMuted = true;

  @override
  void initState() {
    super.initState();
    serverText = TextEditingController();
    roomText = TextEditingController();
    subjectText = TextEditingController();
    nameText = TextEditingController();
    emailText = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final Random _rnd = Random();

  String getRandomCode() {
    const int length = 4;
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(_rnd.nextInt(chars.length)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        UserModel user = getUserModel();
        serverText.text = "https://meet.jit.si/";
        subjectText.text = user.userName;
        nameText.text = user.userName;
        emailText.text = user.email;
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
                              "Video Meeting".toUpperCase(),
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
                Flexible(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        // SvgPicture.string(
                        //   SVGAssets.meetImage,
                        //   width: MediaQuery.of(context).size.width,
                        //   fit: BoxFit.fitWidth,
                        // ),
                        const Spacer(flex: 65),
                        Container(
                          child: Text(
                            "Join or create a Meeting",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 35,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
                        ),
                        const Spacer(flex: 65),
                        Container(
                          width: 350,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xfff3f3f3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextField(
                            controller: nameText,
                            maxLines: 1,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                              errorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              suffixIcon:
                                  Icon(Icons.person, color: Colors.black),
                              hintText: "Name",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(flex: 58),
                        Container(
                          width: 350,
                          child: Text(
                            "Meeting Guidelines: \n1) For privacy reasons you may change your name if you want.\n2) By default your audio & video are muted.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff898989),
                            ),
                          ),
                        ),
                        const Spacer(flex: 58),
                        Row(
                          children: [
                            const Spacer(flex: 32),
                            GestureDetector(
                              onTap: () {
                                _onAudioMutedChanged(!isAudioMuted);
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                    color: isAudioMuted
                                        ? Color(0xffD64467)
                                        : Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.06),
                                          offset: Offset(0, 4)),
                                    ]),
                                width: 82,
                                height: 82,
                                child: Icon(
                                  isAudioMuted
                                      ? Icons.mic_off_sharp
                                      : Icons.mic_none_sharp,
                                  color: isAudioMuted
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            const Spacer(flex: 16),
                            GestureDetector(
                              onTap: () {
                                _onVideoMutedChanged(!isVideoMuted);
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                    color: isVideoMuted
                                        ? Color(0xffD64467)
                                        : Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.06),
                                          offset: Offset(0, 4)),
                                    ]),
                                width: 82,
                                height: 82,
                                child: Icon(
                                  isVideoMuted
                                      ? Icons.videocam_off_sharp
                                      : Icons.videocam,
                                  color: isVideoMuted
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            const Spacer(flex: 16),
                            GestureDetector(
                              onTap: () {
                                _createMeeting(); // Join meet on tap
                              },
                              child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                      color: Color(0xff02B3FD),
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 10,
                                            color:
                                                Colors.black.withOpacity(0.06),
                                            offset: Offset(0, 4)),
                                      ]),
                                  width: 82,
                                  height: 82,
                                  child: Center(
                                    child: Text(
                                      "Create Meeting",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),
                            const Spacer(flex: 10),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Enter meeting code',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        content: TextField(
                                          controller: roomText,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: InputDecoration(
                                            hintStyle: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            hintText: "Meeting code",
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          TextButton(
                                            child: Text('OK'),
                                            onPressed: () {
                                              _joinMeeting(); // Join meet on tap
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                      color: Color(0xff02B3FD),
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 10,
                                            color:
                                                Colors.black.withOpacity(0.06),
                                            offset: Offset(0, 4)),
                                      ]),
                                  width: 82,
                                  height: 82,
                                  child: Center(
                                    child: Text(
                                      "Join Meeting",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),
                            const Spacer(flex: 32),
                          ],
                        ),
                        const Spacer(flex: 38),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _onAudioMutedChanged(bool? value) {
    setState(() {
      isAudioMuted = value!;
    });
  }

  _onVideoMutedChanged(bool? value) {
    setState(() {
      isVideoMuted = value!;
    });
  }

  _createMeeting() async {
    // Using default serverUrl that is https://meet.jit.si/
    String? serverUrl = serverText.text;
    try {
      var options = JitsiMeetingOptions(
        roomNameOrUrl: 'ClassMate Code - ' + getRandomCode(),
        serverUrl: serverUrl,
        userDisplayName: nameText.text,
        userEmail: emailText.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
      );

      await JitsiMeetWrapper.joinMeeting(options: options);
    } catch (error) {
      debugPrint("error: $error");
    }
  }

  _joinMeeting() async {
    // Using default serverUrl that is https://meet.jit.si/
    String? serverUrl = serverText.text;
    try {
      var options = JitsiMeetingOptions(
        roomNameOrUrl: 'ClassMate Code - ${roomText.text}',
        serverUrl: serverUrl,
        userDisplayName: nameText.text,
        userEmail: emailText.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
      );

      await JitsiMeetWrapper.joinMeeting(options: options);
    } catch (error) {
      debugPrint("error: $error");
    }
  }
}
