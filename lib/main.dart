import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/home/home.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}

