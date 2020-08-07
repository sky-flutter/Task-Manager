import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static var styleRegular = GoogleFonts.lato(
      fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400);

  static var styleLight = styleRegular.copyWith(fontWeight: FontWeight.w200);

  static var styleMedium = styleRegular.copyWith(fontWeight: FontWeight.w500);

  static var styleSemiBold = styleRegular.copyWith(fontWeight: FontWeight.w600);

  static var styleBold = styleRegular.copyWith(fontWeight: FontWeight.w700);

  static var styleBlack = styleRegular.copyWith(fontWeight: FontWeight.w900);
}
