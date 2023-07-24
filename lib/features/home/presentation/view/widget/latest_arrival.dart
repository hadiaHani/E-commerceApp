import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/cache/cache.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/subtitle_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widget/heart_btn.dart';
import 'package:ecommerce_admin_app_firebase/features/home/domain/model/product_model.dart';
import 'package:ecommerce_admin_app_firebase/features/profile/presentation/controller/viewed_prod_provider.dart';
import 'package:ecommerce_admin_app_firebase/routes/routes.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LatestArrivalProductsWidget extends StatelessWidget {
  const LatestArrivalProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productsModel = Provider.of<ProductModel>(context);
    final viewedProvider = Provider.of<ViewedProdProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ManagerWidth.w8, vertical: ManagerHeight.h8),
      child: GestureDetector(
        onTap: () async {
          CacheData().setProductID(productsModel.productId);
          viewedProvider.addProductToHistory(
              productId: productsModel.productId);
          await Navigator.pushNamed(context, Routes.productDetailesView);
        },
        child: SizedBox(
          width: size.width * Constant.d_45,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(ManagerRadius.r10),
                  child: FancyShimmerImage(
                      imageUrl: productsModel.productImage,
                      width: size.width * Constant.d_28,
                      height: size.width * Constant.d_28),
                ),
              ),
              SizedBox(
                width: ManagerWidth.w7,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productsModel.productTitle,
                      maxLines: Constant.buttonFlexible,
                      overflow: TextOverflow.ellipsis,
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          HeartButtonWidget(productId: productsModel.productId),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_shopping_cart_rounded,
                              size: ManagerIconSize.s18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FittedBox(
                      child: SubtitleTextWidget(
                        label: "${productsModel.productPrice}\$",
                        color: ManagerColors.blueColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
