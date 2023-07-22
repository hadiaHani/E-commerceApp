import 'dart:developer';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/cache/cache.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_assets.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/features/home/domain/model/product_model.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/controller/product_provider.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/view/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? passedCategory = CacheData().getName();

    final productProvider = Provider.of<ProductProvider>(context);

    final List<ProductModel> productList = passedCategory == null
        ? productProvider.getProducts
        : productProvider.findByCategory(ctgName: passedCategory);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: TitlesTextWidget(
              label: passedCategory == ""
                  ? Constant.searchScreen
                  : passedCategory ?? Constant.searchScreen),
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
                    vertical: ManagerHeight.h8, horizontal: ManagerWidth.w8),
                child: Column(
                  children: [
                    SizedBox(
                      height: ManagerHeight.h15,
                    ),
                    TextField(
                      controller: productProvider.searchTextController,
                      decoration: InputDecoration(
                        hintText: Constant.searchScreen,
                        filled: true,
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            productProvider.searchTextController.clear();
                            FocusScope.of(context).unfocus();
                          },
                          child: const Icon(
                            Icons.clear,
                            color: ManagerColors.redColor,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        Provider.of<ProductProvider>(context, listen: false)
                            .onSearch(productList);
                      },
                      onSubmitted: (value) {
                        Provider.of<ProductProvider>(context, listen: false)
                            .onSearch(productList);
                        log(productProvider.searchTextController.text);
                      },
                    ),
                    SizedBox(
                      height: ManagerHeight.h15,
                    ),
                    if (productProvider.searchTextController.text.isNotEmpty &&
                        productProvider.productListSearch.isEmpty) ...[
                      Center(
                          child: TitlesTextWidget(
                        label: ManagerStrings.noResult,
                        fontSize: ManagerFontSize.s35,
                      ))
                    ],
                    Expanded(
                      child: DynamicHeightGridView(
                        itemCount:
                            productProvider.searchTextController.text.isNotEmpty
                                ? productProvider.productListSearch.length
                                : productList.length,
                        builder: ((context, index) {
                          return productWidget(
                              context: context,
                              productId: productProvider
                                      .searchTextController.text.isNotEmpty
                                  ? productProvider
                                      .productListSearch[index].productId
                                  : productList[index].productId);
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
