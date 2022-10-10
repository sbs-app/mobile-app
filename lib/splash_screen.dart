import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // video controller
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      'assets/video.mp4',
    )
      ..initialize().then((_) {
        setState(() {});
      })
      ..setVolume(0.0);

    _playVideo();
  }

//Navigator.pushReplacement(
  // context, MaterialPageRoute(builder: (context) => LoginScreen()));
  void _playVideo() async {
    _controller.play();

    await Future.delayed(const Duration(seconds: 4));

    Navigator.pushNamed(context, '/login_screen');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      )),
    );
    Widget buildFullScreen({
      required Widget child,
    }) {
      final Size = _controller.value.size;
      final width = Size.width;
      final height = Size.height;

      return FittedBox(
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: width,
          height: height,
          child: child,
        ),
      );
    }
  }
}
