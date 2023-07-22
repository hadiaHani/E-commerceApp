import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: ManagerHeight.h12, horizontal: ManagerWidth.w12),
        backgroundColor: ManagerColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            ManagerRadius.r10,
          ),
        ),
      ),
      icon: const Icon(
        Ionicons.logo_google,
        color: ManagerColors.redColor,
      ),
      label: Text(
        ManagerStrings.signUpGoogle,
        style: TextStyle(
          fontSize: ManagerFontSize.s16,
          color: ManagerColors.blackColor,
        ),
      ),
      onPressed: () async {},
    );
  }
}
