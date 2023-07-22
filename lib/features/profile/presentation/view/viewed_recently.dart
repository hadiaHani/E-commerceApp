import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_assets.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/empty_bag.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:ecommerce_admin_app_firebase/features/profile/presentation/controller/viewed_prod_provider.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/view/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  const ViewedRecentlyScreen({super.key});
  final bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    final viewedProvider = Provider.of<ViewedProdProvider>(context);
    return viewedProvider.getviewedProdItems.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: ManagerAssets.shoppingBasket,
              title: ManagerStrings.viewedRecentlyEmpty,
              subtitle: ManagerStrings.cartViewText,
              buttonText: ManagerStrings.shopNow,
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: TitlesTextWidget(
                  label:
                      "Viewed recently (${viewedProvider.getviewedProdItems.length})"),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(ManagerAssets.shoppingCart),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            body: DynamicHeightGridView(
              itemCount: viewedProvider.getviewedProdItems.length,
              builder: ((context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ManagerHeight.h8, horizontal: ManagerWidth.w12),
                  child: productWidget(
                    context: context,
                    productId: viewedProvider.getviewedProdItems.values
                        .toList()[index]
                        .productId,
                  ),
                );
              }),
              crossAxisCount: Constant.gridViewCrossAxisCount,
            ),
          );
  }
}
