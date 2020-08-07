import 'package:flutter/material.dart';
import 'package:task_manager/utils/colors.dart';

import 'appbar.dart';

class RoundedCornerPage extends StatelessWidget {
  String title;
  Widget child;
  bool isFirstPage;

  RoundedCornerPage(
      {@required this.title, @required this.child, this.isFirstPage = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.colorBlue,
      child: Column(
        children: [
          Container(
            child: CustomAppBar(title: title, isFirstPage: isFirstPage),
          ),
          child
        ],
      ),
    );
  }
}
