import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager/utils/colors.dart';
import 'package:task_manager/utils/style.dart';
import 'package:task_manager/widget/button.dart';
import 'package:task_manager/widget/decoration.dart';
import 'package:task_manager/widget/rounded_corner_page.dart';
import 'package:task_manager/widget/textfield.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
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
        title: "Add Note",
        child: Expanded(
          child: RoundedCornerDecoration(
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  CustomTextField(
                    label: "Description",
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
                                  child: selectedColors != null &&
                                          selectedColors == e
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
          ),
        ),
      ),
    );
  }
}
