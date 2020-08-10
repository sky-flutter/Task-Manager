import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager/custom/custom_progress_painter.dart';
import 'package:task_manager/utils/colors.dart';
import 'package:task_manager/utils/style.dart';
import 'package:task_manager/widget/profile_pi.dart';
import 'package:task_manager/widget/size.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  List<String> listCategory = ["Events", "To do task", "Quick notes"];
  List<Color> listColor = [
    CustomColors.colorBlue,
    CustomColors.colorRed,
    CustomColors.colorPurple
  ];

  AnimationController colorController;
  Animation<Color> color;

  @override
  void initState() {
    super.initState();
    colorController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    color = Tween<Color>(begin: Colors.grey, end: Colors.red).animate(
        CurvedAnimation(parent: colorController, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    colorController.forward();
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.05),
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: Text(
          "Profile",
          style: CustomTextStyle.styleSemiBold.copyWith(fontSize: 18),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white10,
                          offset: Offset(1, 100),
                          blurRadius: 40)
                    ]),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            child: Row(
                              children: [
                                sized_16(),
                                userProfilePic(radius: 30.0),
                                sized_16(size: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Aakash Kareliya",
                                      style: CustomTextStyle.styleSemiBold,
                                    ),
                                    sized_16(size: 4.0),
                                    Text(
                                      "aakash.kareliya786@gmail.com",
                                      style: CustomTextStyle.styleMedium
                                          .copyWith(color: Colors.grey),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            padding: EdgeInsets.only(top: 16),
                          ),
                        ),
                        IconButton(
                            icon: Icon(Icons.settings), onPressed: () {}),
                      ],
                    ),
                    sized_16(size: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        sized_16(size: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "120",
                                style: CustomTextStyle.styleMedium,
                              ),
                              Text(
                                "Create Tasks",
                                style: CustomTextStyle.styleSemiBold
                                    .copyWith(color: Colors.grey, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "80",
                                style: CustomTextStyle.styleMedium,
                              ),
                              Text(
                                "Completed Tasks",
                                style: CustomTextStyle.styleSemiBold
                                    .copyWith(color: Colors.grey, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    sized_16(size: 24.0),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 16),
                height: 100,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return taskCategory(index);
                  },
                  itemCount: 3,
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              statistics()
            ],
          ),
        ),
      ),
    );
  }

  taskCategory(index) {
    return Container(
      height: 100,
      width: 160,
      padding: EdgeInsets.only(left: 24),
      margin: EdgeInsets.only(left: index == 0 ? 16 : 0, right: 16),
      decoration: BoxDecoration(
          color: listColor[index], borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            listCategory[index],
            style: CustomTextStyle.styleSemiBold
                .copyWith(color: Colors.white, fontSize: 16),
          ),
          sized_16(size: 4.0),
          Text(
            "12 Tasks",
            style: CustomTextStyle.styleMedium
                .copyWith(color: Colors.white, fontSize: 14),
          )
        ],
      ),
    );
  }

  statistics() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
      padding: EdgeInsets.only(left: 16,top: 16,bottom: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.white10,
                offset: Offset(1, 100),
                blurRadius: 40)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Statistic",
            style: CustomTextStyle.styleSemiBold,
          ),
          Container(
            decoration: BoxDecoration(

            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                progressPercentage(0.6, "Events", CustomColors.colorRed),
                Expanded(child: Container()),
                progressPercentage(0.4, "To Do", CustomColors.colorBlue),
                Expanded(child: Container()),
                progressPercentage(0.8, "Quick Notes", CustomColors.colorPurple),
                Expanded(child: Container()),
              ],
            ),
          )
        ],
      ),
    );
  }

  progressPercentage(percentage, title, color) {
    return Container(
        margin: EdgeInsets.only(bottom: 4, top: 16),
        child: Column(
          children: [
            CustomPaint(
              child: Container(
                width: 86,
                height: 86,
                alignment: Alignment.center,
                child: Text(
                  "${percentage * 100}%",
                  style: CustomTextStyle.styleSemiBold.copyWith(fontSize: 18),
                ),
              ),
              painter: CircleProgressBarPainter(
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: color,
                  strokeWidth: 2,
                  percentage: percentage),
            ),
            sized_16(size: 6.0),
            Text(
              title,
              style: CustomTextStyle.styleSemiBold,
            )
          ],
        ));
  }
}
