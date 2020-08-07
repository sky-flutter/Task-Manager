import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/reset_success.dart';
import 'package:task_manager/widget/button.dart';
import 'package:task_manager/widget/rounded_corner_page.dart';
import 'package:task_manager/widget/textfield.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isNewPasswordShow = true, isConfirmPasswordShow = true;
  TextEditingController tieNewPassword = TextEditingController();
  TextEditingController tieConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RoundedCornerPage(
          title: "Reset Password",
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
                      key: Key("tefResetCode"),
                      label: "Reset code",
                      hint: "Enter code",
                      textEditingController: TextEditingController(),
                    ),
                    SizedBox(height: 32,),
                    CustomTextField(
                      key: Key("tefPassword"),
                      label: "New password",
                      hint: "Enter your password",
                      icon: IconButton(
                          icon: Icon(
                            isNewPasswordShow
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isNewPasswordShow = !isNewPasswordShow;
                            });
                          }),
                      textEditingController: tieNewPassword,
                      isObscureText: isNewPasswordShow,
                    ),
                    SizedBox(height: 32,),
                    CustomTextField(
                      key: Key("tefConfirmPassword"),
                      label: "Confirm password",
                      hint: "Enter your confirm password",
                      icon: IconButton(
                          icon: Icon(
                            isConfirmPasswordShow
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isConfirmPasswordShow = !isConfirmPasswordShow;
                            });
                          }),
                      textEditingController: tieConfirmPassword,
                      isObscureText: isConfirmPasswordShow,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Button(
                      "Change Password",
                      onPress: () {
                        Get.to(ResetSuccess());
                      },
                    ),
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
