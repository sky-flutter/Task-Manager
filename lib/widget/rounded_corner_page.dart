import 'package:flutter/material.dart';
import 'package:task_manager/utils/colors.dart';

import 'appbar.dart';

// ignore: must_be_immutable
class RoundedCornerPage extends StatelessWidget {
  String title;
  Widget child;
  bool backButton;
  bool isFirstPage;
  Widget actions;

  RoundedCornerPage(
      {@required this.title,
      @required this.child,
      this.isFirstPage = false,
      this.actions,
      this.backButton = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.colorBlue,
      child: Column(
        children: [
          Container(
            child: CustomAppBar(
              title: title,
              actions: actions,
              isFirstPage: isFirstPage,
              backButton: backButton,
            ),
          ),
          child
        ],
      ),
    );
  }
}
