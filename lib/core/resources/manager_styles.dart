import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle _textStyle(
    {required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    required TextDecoration decoration}) {
  return GoogleFonts.arapey(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      decoration: decoration);
}

TextStyle getRegularTextStyle(
    {required double fontSize,
    required Color color,
    TextDecoration decoration = TextDecoration.none}) {
  return _textStyle(
      fontSize: fontSize,
      fontWeight: ManagerFontWeight.regular,
      color: color,
      decoration: decoration);
}

TextStyle getMediumStyle(
    {required double fontSize,
    required Color color,
    TextDecoration decoration = TextDecoration.none}) {
  return _textStyle(
      fontSize: fontSize,
      fontWeight: ManagerFontWeight.medium,
      color: color,
      decoration: decoration);
}

// Bold TextStyle
TextStyle getBoldStyle(
    {required double fontSize,
    required Color color,
    TextDecoration decoration = TextDecoration.none}) {
  return _textStyle(
      fontSize: fontSize,
      fontWeight: ManagerFontWeight.bold,
      color: color,
      decoration: decoration);
}

TextStyle getTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
  FontWeight? weight,
}) {
  return _textStyle(
    fontSize: fontSize,
    fontWeight: weight ?? ManagerFontWeight.medium,
    color: color,
    decoration: decoration,
  );
}
