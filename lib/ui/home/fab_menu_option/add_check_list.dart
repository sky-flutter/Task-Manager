import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager/utils/colors.dart';
import 'package:task_manager/utils/style.dart';
import 'package:task_manager/widget/button.dart';
import 'package:task_manager/widget/decoration.dart';
import 'package:task_manager/widget/rounded_corner_page.dart';
import 'package:task_manager/widget/textfield.dart';

class AddCheckList extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddCheckList> {
  List<Color> listColors = [
    CustomColors.colorPurple,
    CustomColors.colorBlue,
    CustomColors.colorRed,
    Colors.green,
    Colors.cyan
  ];

  Color selectedColors = null;

  var isCheckBoxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RoundedCornerPage(
        title: "Add Check List",
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
                    label: "Title",
                    minLines: 2,
                    textEditingController: TextEditingController(),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 8),
                    primary: false,
                    itemBuilder: (context, index) {
                      return checkListItem(index);
                    },
                    itemCount: 4,
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
                    padding: EdgeInsets.only(left: 16),
                    margin: EdgeInsets.only(top: 24),
                    child: Scrollbar(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: listColors
                          .map((e) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColors = e;
                                  });
                                },
                                child: Container(
                                  height: 56,
                                  width: 56,
                                  child: selectedColors != null &&
                                          selectedColors == e
                                      ? Icon(Icons.check)
                                      : Container(),
                                  margin: EdgeInsets.only(right: 16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      shape: BoxShape.rectangle,
                                      color: e),
                                ),
                              ))
                          .toList(),
                    )),
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

  checkListItem(index) {
    return Container(
      child: Row(
        children: [
          Checkbox(
              value: isCheckBoxSelected,
              onChanged: (checked) {
                setState(() {
                  isCheckBoxSelected = checked;
                });
              }),
          Text(
            "List Item ${index + 1}",
            style: CustomTextStyle.styleMedium,
          )
        ],
      ),
    );
  }
}
