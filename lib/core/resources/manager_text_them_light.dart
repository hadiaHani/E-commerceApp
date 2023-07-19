import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';

class ManagerTextThemLight extends TextTheme {
  @override
  TextStyle get displayMedium => getMediumStyle(
        fontSize: ManagerFontSize.s20,
        color: ManagerColors.primaryTextColor,
      );

  @override
  TextStyle get displaySmall => getBoldStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.primaryTextColor,
      );

  @override
  TextStyle get headlineMedium => getMediumStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.primaryTextColor,
      );

  @override
  TextStyle get titleMedium => getMediumStyle(
        fontSize: ManagerFontSize.s14,
        color: ManagerColors.primaryTextColor,
      );

  @override
  TextStyle get bodyLarge => getRegularTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.primaryTextColor,
      );
}
