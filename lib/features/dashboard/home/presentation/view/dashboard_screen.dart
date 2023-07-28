import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_assets.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:ecommerce_admin_app_firebase/features/dashboard/home/presentation/view/widgets/dashboard_btn.dart';
import 'package:ecommerce_admin_app_firebase/features/home/domain/model/dashboard_btn_model.dart';
import 'package:ecommerce_admin_app_firebase/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const TitlesTextWidget(label: ManagerStrings.dashboardView),
        leading: Padding(
          padding: EdgeInsets.symmetric(
              vertical: ManagerHeight.h8, horizontal: ManagerWidth.w8),
          child: Image.asset(ManagerAssets.shoppingCart),
        ),
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.setDarkTheme(
                  themeValue: !themeProvider.getIsDarkTheme);
            },
            icon: Icon(
              themeProvider.getIsDarkTheme ? Icons.light_mode : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: Constant.gridViewCrossAxisCount,
        childAspectRatio: Constant.childAspectRatio,
        children: List.generate(
          Constant.dashboardItemCount,
          (index) => Padding(
            padding: EdgeInsets.symmetric(
                vertical: ManagerHeight.h8, horizontal: ManagerWidth.w8),
            child: DashboardButtonsWidget(
              title:
                  DashboardButtonsModel.dashboardBtnList(context)[index].text,
              imagePath: DashboardButtonsModel.dashboardBtnList(context)[index]
                  .imagePath,
              onPressed: () {
                DashboardButtonsModel.dashboardBtnList(context)[index]
                    .onPressed();
              },
            ),
          ),
        ),
      ),
    );
  }
}
