import 'package:flutter/material.dart';
import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';

Widget mainButton(
    {required Widget child,
    ShapeBorder? shapeBorder,
    Color? color,
    double? minWidth,
    double? height,
    double? elevation,
    borderSide,
    void Function()? onPressed}) {
  return MaterialButton(
    onPressed: onPressed ?? () {},
    shape: shapeBorder ??
        RoundedRectangleBorder(
          side: borderSide ?? BorderSide.none,
          borderRadius: BorderRadius.circular(
            ManagerRadius.r12,
          ),
        ),
    color: color ?? ManagerColors.primaryColor,
    minWidth: minWidth ?? ManagerWidth.w363,
    height: height ?? ManagerHeight.h60,
    elevation: elevation ?? Constant.elevationButton,
    child: child,
  );
}

IconButton customBackButton({void Function()? onPressed}) {
  return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.arrow_back,
        color: ManagerColors.primaryTextColor,
      ));
}
