import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_styles.dart';
import 'package:ecommerce_admin_app_firebase/core/widget/main_button.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/app_name_text.dart';
import 'package:ecommerce_admin_app_firebase/routes/routes.dart';
import 'package:flutter/material.dart';

class StartScrren extends StatelessWidget {
  const StartScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: AppNameTextWidget(fontSize: ManagerFontSize.s22)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            mainButton(
              child: Text(
                "User",
                style: getBoldStyle(
                    fontSize: ManagerFontSize.s22,
                    color: ManagerColors.lightBlueColor),
              ),
              color: ManagerColors.primaryColor,
              onPressed: () {
                Navigator.pushNamed(context, Routes.routeView);
              },
            ),
            mainButton(
              child: Text(
                "Admin",
                style: getBoldStyle(
                    fontSize: ManagerFontSize.s22,
                    color: ManagerColors.lightBlueColor),
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.dashBoardView);
              },
            )
          ],
        ),
      ),
    );
  }
}
