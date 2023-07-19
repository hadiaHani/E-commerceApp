import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:flutter/material.dart';

import 'subtitle_text.dart';
import 'title_text.dart';

class EmptyBagWidget extends StatelessWidget {
  const EmptyBagWidget(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subtitle,
      required this.buttonText});
  final String imagePath, title, subtitle, buttonText;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: ManagerHeight.h50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: size.height * Constant.d_35,
              width: double.infinity,
            ),
            TitlesTextWidget(
              label: ManagerStrings.whoops,
              fontSize: ManagerFontSize.s40,
              color: ManagerColors.redColor,
            ),
            SizedBox(
              height: ManagerHeight.h20,
            ),
            SubtitleTextWidget(
              label: title,
              fontWeight: FontWeight.w600,
              fontSize: ManagerFontSize.s25,
            ),
            SizedBox(
              height: ManagerHeight.h20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ManagerHeight.h20, horizontal: ManagerWidth.w20),
              child: SubtitleTextWidget(
                label: subtitle,
                fontWeight: FontWeight.w400,
                fontSize: ManagerFontSize.s20,
              ),
            ),
            SizedBox(
              height: ManagerHeight.h20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: ManagerHeight.h20,
                      horizontal: ManagerWidth.w20),
                  elevation: Constant.elevationButton),
              onPressed: () {},
              child: Text(
                buttonText,
                style: TextStyle(fontSize: ManagerFontSize.s22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
