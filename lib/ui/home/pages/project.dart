import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager/utils/colors.dart';
import 'package:task_manager/utils/style.dart';
import 'package:task_manager/widget/button.dart';
import 'package:task_manager/widget/textfield.dart';

Random random = Random();

class Project extends StatefulWidget {
  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  final key = GlobalKey<ScaffoldState>();
  List<String> listTitle = ["Personal", "TeamWorks", "Home", "Meet"];
  List<Color> listColors = [
    Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1),
    Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1),
    Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1),
    Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1),
    Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1),
  ];
  var selectedColors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.white.withOpacity(.97),
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: Text(
          "Projects",
          style: CustomTextStyle.styleSemiBold.copyWith(fontSize: 18),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.only(bottom: 8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2 / 1.8),
            itemBuilder: (context, index) {
              return listTitleItem(listTitle[index], index);
            },
            itemCount: listTitle.length,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => Theme(
                      data: ThemeData(
                          bottomSheetTheme: BottomSheetThemeData(
                              backgroundColor: Colors.black,
                              modalBackgroundColor: Colors.grey)),
                      child: showAddDialogContent()));
            },
            child: Container(
              margin: EdgeInsets.only(left: 18, top: 16),
              width: 100,
              height: 100,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  color: CustomColors.colorBlue,
                  borderRadius: BorderRadius.circular(6)),
            ),
          )
        ],
      )),
    );
  }

  listTitleItem(e, index) {
    var color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    return Container(
      margin: EdgeInsets.only(
          left: index % 2 == 0 ? 20 : 4,
          top: 16,
          right: index % 2 == 0 ? 12 : 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(0, 4),
                blurRadius: 4)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: color.withOpacity(0.2), shape: BoxShape.circle),
              ),
              Container(
                  width: 12,
                  height: 12,
                  decoration:
                      BoxDecoration(color: color, shape: BoxShape.circle)),
            ],
          ),
          Spacer(
            flex: 8,
          ),
          Text(
            e,
            style: CustomTextStyle.styleSemiBold
                .copyWith(color: Colors.black, fontSize: 18),
          ),
          Spacer(
            flex: 1,
          ),
          Text(
            "10 Tasks",
            style: CustomTextStyle.styleMedium
                .copyWith(color: Colors.grey, fontSize: 14),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }

  showAddDialogContent() {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16)),
            color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 32,
            ),
            CustomTextField(
              label: "Title",
              minLines: 5,
              textEditingController: TextEditingController(),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, top: 32),
              child: Text(
                "Choose Color",
                style: CustomTextStyle.styleBold,
              ),
            ),
            Container(
              height: 56,
              margin: EdgeInsets.only(top: 24),
              child: ListView(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: listColors
                    .map((e) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColors = e;
                            });
                          },
                          child: Container(
                            width: 56,
                            height: 56,
                            child: selectedColors != null && selectedColors == e
                                ? Icon(Icons.check)
                                : Container(),
                            margin: EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                shape: BoxShape.rectangle,
                                color: e),
                          ),
                        ))
                    .toList(),
              ),
            ),
            Button(
              "Done",
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
