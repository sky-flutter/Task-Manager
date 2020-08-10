import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager/utils/border.dart';
import 'package:task_manager/utils/colors.dart';
import 'package:task_manager/utils/style.dart';
import 'package:task_manager/widget/button.dart';
import 'package:task_manager/widget/decoration.dart';
import 'package:task_manager/widget/rounded_corner_page.dart';

class AddTask extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddTask> {
  List<Color> listColors = [
    CustomColors.colorPurple,
    CustomColors.colorBlue,
    CustomColors.colorRed,
    Colors.green,
    Colors.cyan
  ];

  Color selectedColors = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RoundedCornerPage(
        title: "Add Task",
        child: Expanded(
          child: RoundedCornerDecoration(
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 16, top: 32),
                      child: Row(
                        children: [
                          Text(
                            "For",
                            style: CustomTextStyle.styleBold,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(100)),
                            child: Text("Assignee"),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Text(
                            "In",
                            style: CustomTextStyle.styleBold,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 16),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(100)),
                            child: Text("Project"),
                          ),
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    color: Colors.grey.shade200,
                    padding: EdgeInsets.only(left: 4, right: 16),
                    child: TextField(
                      style: CustomTextStyle.styleSemiBold,
                      decoration: InputDecoration(
                          border: titleBorder(color: Colors.grey.shade200),
                          hintText: "Title",
                          hintStyle: CustomTextStyle.styleSemiBold,
                          labelStyle: CustomTextStyle.styleSemiBold,
                          enabledBorder:
                              titleBorder(color: Colors.grey.shade200),
                          focusedBorder:
                              titleBorder(color: Colors.grey.shade200)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 24),
                    child: Text(
                      "Description",
                      style: CustomTextStyle.styleBold
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          style: CustomTextStyle.styleSemiBold,
                          maxLines: 3,
                          decoration: InputDecoration(
                              labelStyle: CustomTextStyle.styleSemiBold,
                              enabledBorder:
                                  titleBorder(color: Colors.transparent),
                              focusedBorder:
                                  titleBorder(color: Colors.transparent)),
                        ),
                        Container(
                          color: Colors.grey.shade100,
                          padding: EdgeInsets.only(
                              left: 16, top: 16, right: 16, bottom: 16),
                          child: Row(
                            children: [
                              Transform.rotate(
                                angle: 2.5,
                                child: Icon(
                                  Icons.attachment,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 24),
                      color: Colors.grey.shade200,
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: 16, bottom: 16),
                      child: Row(
                        children: [
                          Text(
                            "Due Date",
                            style: CustomTextStyle.styleMedium
                                .copyWith(fontSize: 14),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Text(
                              "Anytime",
                              style: CustomTextStyle.styleMedium
                                  .copyWith(color: Colors.white, fontSize: 14),
                            ),
                            padding: EdgeInsets.only(
                                left: 12, right: 12, top: 6, bottom: 6),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100)),
                          )
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 24),
                    child: Text(
                      "Add Member",
                      style: CustomTextStyle.styleBold
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 16),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(100)),
                    child: Text("Anyone"),
                  ),
                  Button(
                    "Add Task",
                    onPress: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
