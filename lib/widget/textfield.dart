import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/utils/colors.dart';
import 'package:task_manager/utils/style.dart';

class CustomTextField extends StatelessWidget {
  TextInputType textInputType;
  TextEditingController textEditingController;
  bool isObscureText = false;
  String label = "";
  String hint = "";
  IconButton icon;
  Key key;
  int minLines;

  CustomTextField(
      {this.key,
      this.label,
      this.hint,
      this.textInputType = TextInputType.text,
      this.textEditingController,
      this.icon,
      this.minLines = 1,
      this.isObscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: CustomTextStyle.styleBold,
          ),
          TextField(
            controller: textEditingController,
            keyboardType: textInputType,
            minLines: minLines,
            maxLines: minLines,
            obscureText: isObscureText,
            style: CustomTextStyle.styleMedium,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 16),
              border: border(),
              focusedBorder: border(color: CustomColors.colorBlue),
              hintText: hint,
              hintStyle: CustomTextStyle.styleMedium
                  .copyWith(fontSize: 12, color: Colors.grey),
              suffixIcon: icon,
              enabledBorder: border(),
              alignLabelWithHint: true,
            ),
          )
        ],
      ),
    );
  }

  border({color: Colors.grey}) {
    return UnderlineInputBorder(borderSide: BorderSide(color: color, width: 1));
  }
}
