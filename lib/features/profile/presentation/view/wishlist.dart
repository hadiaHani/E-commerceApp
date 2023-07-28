import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_assets.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/empty_bag.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/show_error_dialog.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:ecommerce_admin_app_firebase/features/profile/presentation/controller/wishlist_provider.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/controller/search_controller.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/view/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  final bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return wishlistProvider.getWishlistItems.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: ManagerAssets.shoppingBasket,
              title: ManagerStrings.wishlistEmpty,
              subtitle: ManagerStrings.cartViewText,
              buttonText: ManagerStrings.shopNow,
            ),
          )
        : GetBuilder<SearchGController>(builder: (controller) {
            return Scaffold(
              appBar: AppBar(
                title: TitlesTextWidget(
                    label:
                        "Wishlist (${wishlistProvider.getWishlistItems.length})"),
                leading: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ManagerHeight.h8, horizontal: ManagerWidth.w8),
                  child: Image.asset(ManagerAssets.wishlistSvg),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      showErrorORWarningDialog(
                          isError: false,
                          context: context,
                          subtitle: ManagerStrings.removeItem,
                          fct: () {
                            wishlistProvider.clearLocalWishlist();
                          });
                    },
                    icon: const Icon(
                      Icons.delete_forever_rounded,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              body: DynamicHeightGridView(
                itemCount: wishlistProvider.getWishlistItems.length,
                builder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ManagerHeight.h8,
                        horizontal: ManagerWidth.w12),
                    child: productWidget(
                      controller1: controller,
                      context: context,
                      productId: wishlistProvider.getWishlistItems.values
                          .toList()[index]
                          .productId,
                    ),
                  );
                }),
                crossAxisCount: Constant.gridViewCrossAxisCount,
              ),
            );
          });
  }
}
