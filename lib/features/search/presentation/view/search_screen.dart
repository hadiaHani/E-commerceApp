import 'dart:developer';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_assets.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/features/home/domain/model/product_model.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/controller/search_controller.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/view/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GetBuilder<SearchGController>(
        builder: (controller) {
          final List<ProductModel> productList = controller.passedCategory ==
                  null
              ? controller.getProducts
              : controller.findByCategory(ctgName: controller.passedCategory!);
          return Scaffold(
            appBar: AppBar(
              title: TitlesTextWidget(
                  label: controller.passedCategory == ""
                      ? Constant.searchScreen
                      : controller.passedCategory ?? Constant.searchScreen),
              leading: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ManagerHeight.h8, horizontal: ManagerWidth.w8),
                child: Image.asset(ManagerAssets.shoppingCart),
              ),
            ),
            body: productList.isEmpty
                ? const Center(
                    child: TitlesTextWidget(label: ManagerStrings.noProduct),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ManagerHeight.h8,
                        horizontal: ManagerWidth.w8),
                    child: Column(
                      children: [
                        SizedBox(
                          height: ManagerHeight.h15,
                        ),
                        TextField(
                          controller: controller.searchTextController,
                          decoration: InputDecoration(
                            hintText: Constant.searchScreen,
                            filled: true,
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                controller.searchTextController.clear();
                                FocusScope.of(context).unfocus();
                              },
                              child: const Icon(
                                Icons.clear,
                                color: ManagerColors.redColor,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            controller.onSearch(productList);
                          },
                          onSubmitted: (value) {
                            controller.onSearch(productList);
                            log(controller.searchTextController.text);
                          },
                        ),
                        SizedBox(
                          height: ManagerHeight.h15,
                        ),
                        if (controller.searchTextController.text.isNotEmpty &&
                            controller.productListSearch.isEmpty) ...[
                          Center(
                              child: TitlesTextWidget(
                            label: ManagerStrings.noResult,
                            fontSize: ManagerFontSize.s35,
                          ))
                        ],
                        Expanded(
                          child: DynamicHeightGridView(
                            itemCount:
                                controller.searchTextController.text.isNotEmpty
                                    ? controller.productListSearch.length
                                    : productList.length,
                            builder: ((context, index) {
                              return productWidget(
                                  context: context,
                                  productId: controller
                                          .searchTextController.text.isNotEmpty
                                      ? controller
                                          .productListSearch[index].productId
                                      : productList[index].productId,
                                  controller1: controller);
                            }),
                            crossAxisCount: Constant.gridViewCrossAxisCount,
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
