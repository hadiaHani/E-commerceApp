import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/cache/cache.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/subtitle_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:ecommerce_admin_app_firebase/features/cart/presentation/controller/cart_provider.dart';
import 'package:ecommerce_admin_app_firebase/features/heart_btn.dart';
import 'package:ecommerce_admin_app_firebase/features/profile/presentation/controller/viewed_prod_provider.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/controller/product_provider.dart';
import 'package:ecommerce_admin_app_firebase/routes/routes.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget productWidget(
    {required BuildContext context, required String productId}) {
  Size size = MediaQuery.of(context).size;

  final productProvider = Provider.of<ProductProvider>(context);
  final getCurrProduct = productProvider.findByProdId(productId);
  final cartProvider = Provider.of<CartProvider>(context);
  final viewedProvider = Provider.of<ViewedProdProvider>(context);

  return getCurrProduct == null
      ? const SizedBox.shrink()
      : Padding(
          padding: EdgeInsets.symmetric(
              vertical: ManagerHeight.h3, horizontal: ManagerWidth.w3),
          child: GestureDetector(
            onTap: () {},
            child: InkWell(
              onTap: () {
                viewedProvider.addProductToHistory(
                    productId: getCurrProduct.productId);
                CacheData().setProductID(getCurrProduct.productId);
                Navigator.pushNamed(
                  context,
                  Routes.productDetailesView,
                );
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(ManagerRadius.r30),
                    child: FancyShimmerImage(
                      imageUrl: getCurrProduct.productImage,
                      width: double.infinity,
                      height: size.height * Constant.d_22,
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: Constant.titleFlexible,
                        child: TitlesTextWidget(
                          fontSize: ManagerFontSize.s20,
                          label: getCurrProduct.productTitle,
                          maxLines: 2,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: HeartButtonWidget(
                            productId: getCurrProduct.productId),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ManagerHeight.h15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: Constant.priceFlexible,
                          child: SubtitleTextWidget(
                            label: "${getCurrProduct.productPrice}\$",
                          ),
                        ),
                        Flexible(
                          child: Material(
                            borderRadius:
                                BorderRadius.circular(ManagerRadius.r16),
                            color: ManagerColors.lightBlueColor,
                            child: InkWell(
                              splashColor: ManagerColors.redColor,
                              borderRadius:
                                  BorderRadius.circular(ManagerRadius.r16),
                              onTap: () {
                                if (cartProvider.isProductInCart(
                                    productId: getCurrProduct.productId)) {
                                  return;
                                }
                                cartProvider.addProductToCart(
                                    productId: getCurrProduct.productId);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: ManagerHeight.h8,
                                    horizontal: ManagerWidth.w8),
                                child: Icon(
                                  cartProvider.isProductInCart(
                                          productId: getCurrProduct.productId)
                                      ? Icons.check
                                      : Icons.add_shopping_cart_rounded,
                                  size: ManagerSize.s20,
                                  color: ManagerColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h10,
                  ),
                ],
              ),
            ),
          ),
        );
}
