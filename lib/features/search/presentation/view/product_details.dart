import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/cache/cache.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/app_name_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/subtitle_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:ecommerce_admin_app_firebase/features/cart/presentation/controller/cart_provider.dart';
import 'package:ecommerce_admin_app_firebase/core/widget/heart_btn.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/controller/product_provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final getCurrProduct =
        productProvider.findByProdId(CacheData().getProductID()!);

    final cartProvider = Provider.of<CartProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: AppNameTextWidget(fontSize: ManagerFontSize.s22),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: ManagerIconSize.s18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(
              imageUrl: getCurrProduct!.productImage,
              height: size.height * Constant.d_38,
              width: double.infinity,
              boxFit: BoxFit.contain,
            ),
            SizedBox(
              height: ManagerHeight.h10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ManagerHeight.h10, horizontal: ManagerWidth.w10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          getCurrProduct.productTitle,
                          style: TextStyle(
                            fontSize: ManagerFontSize.s22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ManagerWidth.w14,
                      ),
                      SubtitleTextWidget(
                        label: "${getCurrProduct.productPrice}\$",
                        color: ManagerColors.blueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: ManagerFontSize.s22,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ManagerHeight.h20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HeartButtonWidget(
                          color: Colors.blue.shade300,
                          productId: getCurrProduct.productId,
                        ),
                        SizedBox(
                          width: ManagerWidth.w10,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: kBottomNavigationBarHeight - 10,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ManagerColors.lightBlueColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    ManagerRadius.r30,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (cartProvider.isProductInCart(
                                    productId: getCurrProduct.productId)) {
                                  return;
                                }
                                cartProvider.addProductToCart(
                                    productId: getCurrProduct.productId);
                              },
                              icon: Icon(
                                cartProvider.isProductInCart(
                                        productId: getCurrProduct.productId)
                                    ? Icons.check
                                    : Icons.add_shopping_cart_rounded,
                              ),
                              label: Text(
                                cartProvider.isProductInCart(
                                        productId: getCurrProduct.productId)
                                    ? ManagerStrings.inCart
                                    : ManagerStrings.addToCart,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitlesTextWidget(label: ManagerStrings.aboutThis),
                      SubtitleTextWidget(
                          label: "In ${getCurrProduct.productCategory}")
                    ],
                  ),
                  SizedBox(
                    height: ManagerHeight.h25,
                  ),
                  SubtitleTextWidget(label: getCurrProduct.productDescription),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
