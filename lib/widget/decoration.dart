import 'package:flutter/material.dart';

class RoundedCornerDecoration extends StatelessWidget {
  Widget child;

  RoundedCornerDecoration(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
    );
  }
}
