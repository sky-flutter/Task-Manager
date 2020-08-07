import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:task_manager/custom/curve_painter.dart';
import 'package:task_manager/utils/colors.dart';
import 'package:task_manager/utils/style.dart';

import '../login.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<Color> listColors = [
    CustomColors.colorRed,
    CustomColors.colorBlue,
    CustomColors.colorPurple
  ];
  List<String> listTitle = [
    "Welcome to Task Manager",
    "Work happens",
    "Tasks and assign"
  ];
  List<String> listDescription = [
    "Whats going to happen tomorrow?",
    "Get notify when work happens",
    "Task and assign them to colleagues"
  ];
  List<String> listImage = [
    "assets/images/ic_ob1.png",
    "assets/images/ic_ob2.png",
    "assets/images/ic_ob3.png"
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            CustomPaint(
              painter: CurvePainter(color: listColors[currentPage]),
              child: Container(),
            ),
            CustomPaint(
              painter: CurvePainter1(
                  color: listColors[currentPage].withOpacity(0.2)),
              child: Container(),
            ),
            CustomPaint(
              painter: CurvePainter2(
                  color: listColors[currentPage].withOpacity(0.2)),
              child: Container(),
            ),
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemBuilder: (context, index) {
                      return pageItem(index);
                    },
                    onPageChanged: (page) {
                      setState(() {
                        currentPage = page;
                      });
                    },
                    itemCount: listTitle.length,
                  ),
                  flex: 55,
                ),
                Expanded(
                  flex: 20,
                  child: Container(
                      alignment: Alignment.center,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentPage == index
                                    ? Colors.black
                                    : Colors.grey),
                            margin: EdgeInsets.only(
                                right: index == listTitle.length ? 0 : 8),
                          );
                        },
                        itemCount: listTitle.length,
                      )),
                ),
                Expanded(
                  child: Container(),
                  flex: 25,
                )
              ],
            ),
            Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 32, right: 32),
                      child: RaisedButton(
                        color: Colors.white,
                        elevation: 2,
                        splashColor: listColors[currentPage].withOpacity(.2),
                        padding: EdgeInsets.only(top: 12, bottom: 12),
                        onPressed: () {
                          Get.off(Login());
                        },
                        child: Text("Get Started",
                            style: CustomTextStyle.styleBold
                                .copyWith(color: Colors.black, fontSize: 14)),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.off(Login());
                      },
                      child: Text(
                        "Login",
                        style: CustomTextStyle.styleBold
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  pageItem(int index) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: Image.asset(listImage[index]),
          ),
          Container(
            child: Text(
              listTitle[index],
              style: CustomTextStyle.styleBold.copyWith(fontSize: 20),
            ),
          ),
          Container(
            child: Text(
              listDescription[index],
              style: CustomTextStyle.styleRegular.copyWith(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
