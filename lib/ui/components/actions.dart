import 'package:flutter/material.dart';
import 'package:studentapp/ui/ui.dart';
import 'package:get/get.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

SpeedDial getActions() {
  return SpeedDial(
    foregroundColor: Colors.white,
    animatedIcon: AnimatedIcons.menu_close,
    backgroundColor: const Color.fromARGB(255, 64, 58, 134),
    children: [
      SpeedDialChild(
          child: const Icon(
            Icons.list,
            color: Colors.white,
          ),
          onTap: () async {
            Get.to(() => ClassViewUI());
          },
          backgroundColor: const Color(0xff302b63)),
      SpeedDialChild(
          child: const Icon(
            Icons.people,
            color: Colors.white,
          ),
          onTap: () async {
            Get.to(() => StudentJoinUI());
          },
          backgroundColor: const Color(0xff302b63)),
      SpeedDialChild(
          child: const Icon(
            Icons.mail,
            color: Colors.white,
          ),
          onTap: () {
            Get.to(() => HomeUI());
          },
          backgroundColor: const Color(0xff302b63)),
      SpeedDialChild(
          child: const Icon(
            Icons.home,
            color: Colors.white,
          ),
          onTap: () async {
            Get.to(() => HomeUI());
          },
          backgroundColor: const Color(0xff302b63)),
      SpeedDialChild(
          child: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onTap: () async {
            Get.to(() => SettingsUI());
          },
          backgroundColor: const Color(0xff302b63)),
    ],
  );
}
