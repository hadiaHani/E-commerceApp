import 'dart:developer';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_assets.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/view/widgets/product_widget.dart';
import 'package:ecommerce_admin_app_firebase/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const TitlesTextWidget(label: Constant.searchScreen),
          leading: Padding(
            padding: EdgeInsets.symmetric(
                vertical: ManagerHeight.h8, horizontal: ManagerWidth.w8),
            child: Image.asset(ManagerAssets.shoppingCart),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: ManagerHeight.h8, horizontal: ManagerWidth.w8),
          child: Column(
            children: [
              SizedBox(
                height: ManagerHeight.h15,
              ),
              TextField(
                controller: themeProvider.searchTextController,
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      themeProvider.textFieldonTap(context);
                    },
                    child: const Icon(
                      Icons.clear,
                      color: ManagerColors.redColor,
                    ),
                  ),
                ),
                onChanged: (value) {},
                onSubmitted: (value) {
                  log(themeProvider.searchTextController.text);
                },
              ),
              SizedBox(
                height: ManagerHeight.h15,
              ),
              Expanded(
                child: DynamicHeightGridView(
                  itemCount: 220,
                  builder: ((context, index) {
                    return const ProductWidget();
                  }),
                  crossAxisCount: Constant.gridViewCrossAxisCount,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
