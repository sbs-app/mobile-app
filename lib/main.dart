/*
 Main entry point for classroom app.
 Copyright (c) 2023 Andrew, Shafil, Suraj 
*/
import 'dart:io';

import 'package:classroom/core/strings.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/models/auth/user_model.dart';
import 'package:classroom/ui/core/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Connect to Firebase backend
  await Firebase.initializeApp();

  // Set up folder to cache user data
  final Directory directory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>(HiveBoxNames.user);

  // Use production code and inject Auth + Course controllers
  configureInjection(Environment.prod);

  // Run app
  runApp(Phoenix(child: AppWidget()));
}
