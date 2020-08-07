import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task_manager/utils/style.dart';

class ResetSuccess extends StatefulWidget {
  @override
  _ResetSuccessState createState() => _ResetSuccessState();
}

class _ResetSuccessState extends State<ResetSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Image.asset(
              "assets/images/ic_reset_success.png",
              width: MediaQuery.of(context).size.width * .5,
              height: MediaQuery.of(context).size.width * .5,
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Successful!",
              textAlign: TextAlign.center,
              style: CustomTextStyle.styleBold.copyWith(fontSize: 28),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "You have successfully change password.\nPlease use your new password when\nlogging in.",
              textAlign: TextAlign.center,
              style: CustomTextStyle.styleMedium
                  .copyWith(fontSize: 14, color: Colors.grey.shade700),
            ),
            Expanded(child: Container()),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
