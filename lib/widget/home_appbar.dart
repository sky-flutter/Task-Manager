import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/utils/colors.dart';
import 'package:task_manager/utils/style.dart';

class HomeAppBar {
  final Widget leading;
  final String title;
  final List<Widget> actions;
  var bottomMenu;

  HomeAppBar({this.leading, this.title, this.actions,this.bottomMenu});

  AppBar build() {
    return AppBar(
      elevation: 0,
      backgroundColor: CustomColors.colorBlue,
      leading: leading,
      title: Text(
        title,
        style: CustomTextStyle.styleBold.copyWith(color: Colors.white),
      ),
      centerTitle: true,
      actions: actions,
      bottom:bottomMenu
    );
  }
}
