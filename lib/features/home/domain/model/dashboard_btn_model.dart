import 'package:ecommerce_admin_app_firebase/core/resources/manager_assets.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/routes/routes.dart';
import 'package:flutter/material.dart';

class DashboardButtonsModel {
  final String text, imagePath;
  final Function onPressed;

  DashboardButtonsModel({
    required this.text,
    required this.imagePath,
    required this.onPressed,
  });

  static List<DashboardButtonsModel> dashboardBtnList(BuildContext context) => [
        DashboardButtonsModel(
          text: ManagerStrings.addProduct,
          imagePath: ManagerAssets.cloud,
          onPressed: () {
            Navigator.pushNamed(context, Routes.editOrUploadProductScreen);
          },
        ),
        DashboardButtonsModel(
          text: ManagerStrings.inspectProduct,
          imagePath: ManagerAssets.shoppingCart,
          onPressed: () {
            Navigator.pushNamed(context, Routes.dashBoardSearchView);
          },
        ),
        DashboardButtonsModel(
          text: ManagerStrings.viewOrders,
          imagePath: ManagerAssets.order,
          onPressed: () {
            Navigator.pushNamed(context, Routes.searchScreen);
          },
        ),
      ];
}
