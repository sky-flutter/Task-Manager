import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/utils/style.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  String description;
  bool isFirstPage;
  bool backButton;
  Widget actions;

  CustomAppBar(
      {this.title = "",
      this.description = "",
      this.isFirstPage = false,
      this.actions,
      this.backButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              icon: backButton
                  ? Icon(Icons.keyboard_backspace)
                  : Icon(Icons.close),
              onPressed: () {
                if (!isFirstPage) {
                  Get.back();
                }
              },
              color: Colors.white),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(
                title,
                style: CustomTextStyle.styleBold
                    .copyWith(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          if (actions != null) actions
        ],
      ),
    );
  }
}
