import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:task_manager/ui/forgot_password.dart';
import 'package:task_manager/ui/home/home.dart';
import 'package:task_manager/utils/style.dart';
import 'package:task_manager/widget/button.dart';
import 'package:task_manager/widget/rounded_corner_page.dart';
import 'package:task_manager/widget/textfield.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPasswordShow = true;
  TextEditingController tiePassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RoundedCornerPage(
        title: "Login",
        isFirstPage: true,
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
                  CustomTextField(
                    key: Key("tefPassword"),
                    label: "Password",
                    hint: "Enter password",
                    icon: IconButton(
                        icon: Icon(
                          isPasswordShow
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordShow = !isPasswordShow;
                          });
                        }),
                    textEditingController: tiePassword,
                    isObscureText: isPasswordShow,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(ForgotPassword());
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 8, top: 16, right: 16),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        style: CustomTextStyle.styleBold,
                      ),
                    ),
                  ),
                  Button("Login",onPress: (){
                    Get.off(Home());
                  },),
                  SizedBox(
                    height: 48,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
