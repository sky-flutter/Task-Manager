import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/reset_password.dart';
import 'package:task_manager/widget/button.dart';
import 'package:task_manager/widget/rounded_corner_page.dart';
import 'package:task_manager/widget/textfield.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RoundedCornerPage(
          title: "Forgot Password",
          child: Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    CustomTextField(
                      key: Key("tefUsername"),
                      label: "Username",
                      hint: "Enter username",
                      textEditingController: TextEditingController(),
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Button("Send Request",onPress: (){
                      Get.to(ResetPassword());
                    },),
                    SizedBox(
                      height: 48,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
