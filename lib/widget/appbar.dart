import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/utils/style.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String description;
  final bool isFirstPage;
  const CustomAppBar({this.title = "", this.description = "",this.isFirstPage=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40,bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(icon: Icon(Icons.keyboard_backspace), onPressed: () {
            if(!isFirstPage){
              Get.back();
            }
          },color: Colors.white),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(
              title,
              style: CustomTextStyle.styleBold.copyWith(fontSize: 18,color: Colors.white),
            ),
          ),
          Visibility(
            visible: false,
            child: Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(
                description,
                style: CustomTextStyle.styleMedium
                    .copyWith(fontSize: 14, color: Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }
}
