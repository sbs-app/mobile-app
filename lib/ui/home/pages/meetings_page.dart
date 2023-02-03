import 'dart:io';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:classroom/core/user_utils.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:jitsi_meet/room_name_constraint.dart';
import 'package:jitsi_meet/room_name_constraint_type.dart';

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
    // Adding a Listener
    JitsiMeet.addListener(JitsiMeetingListener(
        // onConferenceWillJoin: _onConferenceWillJoin,
        // onConferenceJoined: _onConferenceJoined,
        // onConferenceTerminated: _onConferenceTerminated,
        // onPictureInPictureWillEnter: _onPictureInPictureWillEnter,
        // onPictureInPictureTerminated: _onPictureInPictureTerminated,
        onError: _onError));
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        UserModel user = getUserModel();
        serverText.text = "https://meet.jit.si/";
        roomText.text = "${user.userName} ClassMate Room";
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
                            "Join a Meeting",
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
                                width: 72,
                                height: 72,
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
                                width: 72,
                                height: 72,
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
                                _joinMeeting(); // Join meet on tap
                              },
                              child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                      color: Color(0xffAA66CC),
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 10,
                                            color:
                                                Colors.black.withOpacity(0.06),
                                            offset: Offset(0, 4)),
                                      ]),
                                  width: 174,
                                  height: 72,
                                  child: Center(
                                    child: Text(
                                      "Join Meeting".toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
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
  // Can use this, to add one more button which makes the meet Audio only.
  // _onAudioOnlyChanged(bool? value) {
  //   setState(() {
  //     isAudioOnly = value!;
  //   });
  // }

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

  // Defining Join meeting function
  _joinMeeting() async {
    // Using default serverUrl that is https://meet.jit.si/
    String? serverUrl =
        (serverText.text.trim().isEmpty ? null : serverText.text);

    try {
      // Enable or disable any feature flag here
      // If feature flag are not provided, default values will be used
      // Full list of feature flags (and defaults) available in the README
      Map<FeatureFlagEnum, bool> featureFlags = HashMap();
      featureFlags[FeatureFlagEnum.WELCOME_PAGE_ENABLED] = false;
      // Here is an example, disabling features for each platform
      if (Platform.isAndroid) {
        // Disable ConnectionService usage on Android to avoid issues (see README)
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        // featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }

      //uncomment to modify video resolution
      //featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION;

      // Define meetings options here
      var options = JitsiMeetingOptions(room: roomText.text)
        ..serverURL = serverUrl
        ..subject = subjectText.text
        ..userDisplayName = nameText.text
        ..userEmail = emailText.text
        ..audioOnly = isAudioOnly
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted
        ..featureFlags = featureFlags;

      debugPrint("JitsiMeetingOptions: $options");
      // Joining meet
      await JitsiMeet.joinMeeting(
        options,
        // listener: JitsiMeetingListener(
        //     onConferenceWillJoin: ({message = const {"": ""}}) {
        //   debugPrint("${options.room} will join with message: $message");
        // }, onConferenceJoined: ({message = const {"": ""}}) {
        //   debugPrint("${options.room} joined with message: $message");
        // }, onConferenceTerminated: ({message = const {"": ""}}) {
        //   debugPrint("${options.room} terminated with message: $message");
        // }, onPictureInPictureWillEnter: ({message = const {"": ""}}) {
        //   debugPrint("${options.room} entered PIP mode with message: $message");
        // }, onPictureInPictureTerminated: ({message = const {"": ""}}) {
        //   debugPrint("${options.room} exited PIP mode with message: $message");
        // }),
        // // by default, plugin default constraints are used
        roomNameConstraints: new Map(), // to disable all constraints
        // //roomNameConstraints: customContraints, // to use your own constraint(s)
      );
    } catch (error) {
      debugPrint("error: $error");
    }
  }

  void _onConferenceWillJoin({message}) {
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined({message}) {
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated({message}) {
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  void _onPictureInPictureWillEnter({message}) {
    debugPrint(
        "_onPictureInPictureWillEnter broadcasted with message: $message");
  }

  void _onPictureInPictureTerminated({message}) {
    debugPrint(
        "_onPictureInPictureTerminated broadcasted with message: $message");
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }
}