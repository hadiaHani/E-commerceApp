import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData({
    required bool isDarkTheme,
    required BuildContext context,
  }) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme
          ? ManagerColors.darkScaffoldColor
          : ManagerColors.lightScaffoldColor,
      cardColor: isDarkTheme
          ? ManagerColors.darkCardColor
          : ManagerColors.lightCardColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme
            ? ManagerColors.darkScaffoldColor
            : ManagerColors.lightScaffoldColor,
        elevation: Constant.elevationAppbar,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color:
              isDarkTheme ? ManagerColors.whiteColor : ManagerColors.blackColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: EdgeInsets.symmetric(
            vertical: ManagerHeight.h10, horizontal: ManagerWidth.w10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: ManagerWidth.w1,
            color: ManagerColors.transparent,
          ),
          borderRadius: BorderRadius.circular(ManagerRadius.r8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: ManagerWidth.w1,
            color: isDarkTheme
                ? ManagerColors.whiteColor
                : ManagerColors.blackColor,
          ),
          borderRadius: BorderRadius.circular(ManagerRadius.r8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: ManagerWidth.w1,
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(ManagerRadius.r8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: ManagerWidth.w1,
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(ManagerRadius.r8),
        ),
      ),
    );
  }
}
