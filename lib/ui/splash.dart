import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/onboarding/onboarding.dart';
import 'package:task_manager/utils/style.dart';
import 'package:task_manager/widget/size.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Get.off(OnBoarding());
    });
  }

  @override
  Widget build(BuildContext context) {
    var imageWidth = MediaQuery.of(context).size.width/4;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/ic_logo.png",width: imageWidth,height: imageWidth,),
            sized_16(),
            Text(
              "Task Manager",
              style: CustomTextStyle.styleBold.copyWith(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
