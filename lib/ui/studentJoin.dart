import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:studentapp/controllers/controllers.dart';
import 'package:studentapp/ui/ui.dart';
import 'package:get/get.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class studentJoinUI extends StatelessWidget {
  studentJoinUI({super.key});

  RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Join a Class'.tr,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _buildLayoutSection(context),
      floatingActionButton: SpeedDial(
        foregroundColor: Colors.white,
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Color.fromARGB(255, 64, 58, 134),
        children: [
          SpeedDialChild(
              child: Icon(
                Icons.mail,
                color: Colors.white,
              ),
              onTap: () {
                Get.to(HomeUI());
              },
              backgroundColor: Color(0xff302b63)),
          SpeedDialChild(
              child: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onTap: () async {
                Get.to(HomeUI());
              },
              backgroundColor: Color(0xff302b63)),
          SpeedDialChild(
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onTap: () async {
                Get.to(SettingsUI());
              },
              backgroundColor: Color(0xff302b63)),
        ],
      ),
    );
  }

  Widget _buildLayoutSection(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [Color(0xff0f0c29), Color(0xff302b63), Color(0xff24243e)]),
      ),
      child: ListView(children: <Widget>[
        Text(
          "Add a Class",
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        Divider(
          color: Colors.white,
          height: 15,
          thickness: 2,
          indent: 190,
          endIndent: 0,
        ),
        Padding(
          padding: EdgeInsets.only(top: 100),
          child: Text(
            "Class Code",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 23),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 100),
            child: TextField(
              cursorColor: Color(0xff302b63),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: "Enter your class code",
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30)),
              ),
            )),
        SizedBox(
          height: 20,
        ),
        RoundedLoadingButton(
          color: Color.fromARGB(255, 26, 20, 95),
          child: Text('Submit', style: TextStyle(color: Colors.white)),
          controller: _btnController,
          onPressed: _doSomething,
          successColor: Colors.green,
        )
      ]),
    );
  }

  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.success();
    });
  }
}
