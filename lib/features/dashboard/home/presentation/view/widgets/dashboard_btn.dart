import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';

class DashboardButtonsWidget extends StatelessWidget {
  const DashboardButtonsWidget(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.onPressed});

  final String title, imagePath;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: ManagerHeight.h64,
              width: ManagerWidth.w68,
            ),
            SizedBox(
              height: ManagerHeight.h16,
            ),
            SubtitleTextWidget(
              label: title,
              fontSize: ManagerFontSize.s22,
            )
          ],
        ),
      ),
    );
  }
}
