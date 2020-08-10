import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task_manager/utils/border.dart';
import 'package:task_manager/utils/colors.dart';
import 'package:task_manager/utils/style.dart';
import 'package:task_manager/widget/button.dart';
import 'package:task_manager/widget/decoration.dart';
import 'package:task_manager/widget/profile_pi.dart';
import 'package:task_manager/widget/rounded_corner_page.dart';
import 'package:task_manager/widget/size.dart';

class TaskDetails extends StatefulWidget {
  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  var isCommentDisplay = false;
  int selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RoundedCornerPage(
          title: "",
          backButton: false,
          actions: Container(
            margin: EdgeInsets.only(right: 8),
            child: popupMenu(),
          ),
          child: Expanded(
              child: RoundedCornerDecoration(Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 16, right: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Meeting according with design team in Central Park",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyle.styleBold.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  sized_16(size: 32.0),
                  item(
                      Row(
                        children: [
                          userProfilePic(),
                          sized_16(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              title("Assigned To"),
                              sized_16(size: 4.0),
                              Text(
                                "Saksi Malik",
                                style: CustomTextStyle.styleSemiBold
                                    .copyWith(fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                      isFirst: true),
                  item(Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.date_range,
                        color: Colors.grey,
                      ),
                      sized_16(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title("Date"),
                          sized_16(size: 4.0),
                          Text(
                            "Aug 5,2020",
                            style: CustomTextStyle.styleSemiBold
                                .copyWith(fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  )),
                  item(Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.description,
                        color: Colors.grey,
                      ),
                      sized_16(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title("Description"),
                          sized_16(size: 4.0),
                          Text(
                            "Lorem ipsum dolor sit amet,\nconsectetur adipiscing.",
                            style: CustomTextStyle.styleSemiBold
                                .copyWith(fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  )),
                  item(Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.device_hub,
                        color: Colors.grey,
                      ),
                      sized_16(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title("Members"),
                          sized_16(size: 16.0),
                          Row(
                            children: [
                              userProfilePic(),
                              sized_16(size: 4.0),
                              userProfilePic(),
                              sized_16(size: 4.0),
                              userProfilePic(),
                              sized_16(size: 4.0),
                              userProfilePic(),
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
                  item(Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.rotate(
                        angle: 2.5,
                        child: Icon(
                          Icons.insert_link,
                          color: Colors.grey,
                        ),
                      ),
                      sized_16(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title("Tag"),
                          sized_16(size: 10.0),
                          Container(
                            child: Text("Personal"),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.blue.shade50),
                                color: Colors.white),
                            padding: EdgeInsets.all(8),
                          )
                        ],
                      ),
                    ],
                  )),
                  commentSection(),
                  Button(
                    "Complete Task",
                    onPress: () {},
                    horizontalMargin: 0,
                    verticalMargin: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCommentDisplay = !isCommentDisplay;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Comment",
                          style: CustomTextStyle.styleBold,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              alignment: Alignment.topCenter,
                              child: Transform.rotate(
                                angle: isCommentDisplay ? 3 : 0,
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ),
                            Transform.rotate(
                              angle: isCommentDisplay ? 3 : 0,
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  sized_16()
                ],
              ),
            ),
          )))),
    );
  }

  commentSection() {
    return Visibility(
      visible: isCommentDisplay,
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 0, right: 0, top: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  TextField(
                    style: CustomTextStyle.styleMedium,
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintStyle: CustomTextStyle.styleMedium
                            .copyWith(color: Colors.grey),
                        hintText: "Write a comment",
                        labelStyle: CustomTextStyle.styleSemiBold,
                        enabledBorder: titleBorder(color: Colors.transparent),
                        focusedBorder: titleBorder(color: Colors.transparent)),
                  ),
                  Container(
                    color: Colors.grey.shade100,
                    padding: EdgeInsets.only(
                        left: 16, top: 10, right: 16, bottom: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_photo_alternate,
                          color: Colors.grey.shade400,
                        ),
                        sized_16(size: 8.0),
                        Transform.rotate(
                          angle: 2.5,
                          child: Icon(
                            Icons.attachment,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          "Send",
                          style: CustomTextStyle.styleBold
                              .copyWith(color: CustomColors.colorBlue),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            listComment()
          ],
        ),
      ),
    );
  }

  listComment() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return commentItem(index);
      },
      itemCount: 2,
      primary: false,
      shrinkWrap: true,
    );
  }

  item(Widget child, {isFirst: false, isLast: false}) {
    return Column(
      children: [if (!isFirst) divider(), sized_16(), child, sized_16()],
    );
  }

  commentItem(index) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              userProfilePic(),
              sized_16(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Stephen Chow",
                    style: CustomTextStyle.styleSemiBold.copyWith(fontSize: 16),
                  ),
                  sized_16(size: 4.0),
                  Text(
                    "3 Days ago",
                    style: CustomTextStyle.styleMedium
                        .copyWith(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Visibility(
            visible: index == 0,
            child: Container(
              margin: EdgeInsets.only(left: 0, top: 8),
              child: Text(
                "Lorem ipsum dolor sit amet,consectetur\nadipiscing.",
                style:
                    CustomTextStyle.styleMedium.copyWith(color: Colors.black),
              ),
            ),
          ),
          Visibility(
              visible: index == 1,
              child: Container(
                margin: EdgeInsets.only(top: 12),
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "https://starsunfolded.com/wp-content/uploads/2018/03/Sakshi-Malik.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  title(String title) {
    return Text(
      title,
      style: CustomTextStyle.styleMedium
          .copyWith(color: Colors.grey, fontSize: 16),
    );
  }

  divider() {
    return Divider(
      height: 2,
      indent: 8,
    );
  }

  popupMenu() {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Text(
              "Add to Project",
              style: CustomTextStyle.styleMedium,
            ),
            value: 1,
          ),
          PopupMenuItem(
            child: Text(
              "Add Member",
              style: CustomTextStyle.styleMedium,
            ),
            value: 2,
          ),
          PopupMenuItem(
            child: Text(
              "Delete Task",
              style: CustomTextStyle.styleMedium,
            ),
            value: 3,
          ),
        ];
      },
      onSelected: (value) {
        setState(() {
          selectedMenu = value;
        });
      },
      initialValue: selectedMenu,
      offset: Offset(
          0, selectedMenu == 3 ? 300 : selectedMenu == 2 ? 200 : 100),
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)),
      icon: Icon(Icons.settings,color: Colors.white,),
    );
  }
}
