import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/home/fab_menu_option/add_check_list.dart';
import 'package:task_manager/ui/home/fab_menu_option/add_note.dart';
import 'package:task_manager/ui/home/fab_menu_option/add_task.dart';
import 'package:task_manager/ui/home/home.dart';
import 'package:task_manager/ui/home/pages/profile.dart';
import 'package:task_manager/ui/home/pages/project.dart';
import 'package:task_manager/ui/home/pages/quick_notes.dart';
import 'package:task_manager/ui/home/task/task_details.dart';
import 'package:task_manager/ui/login.dart';
import 'package:task_manager/ui/onboarding/onboarding.dart';
import 'package:task_manager/ui/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}

