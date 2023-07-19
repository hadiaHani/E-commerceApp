import 'dart:developer';

import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_assets.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/subtitle_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ManagerHeight.h3, horizontal: ManagerWidth.w3),
      child: GestureDetector(
        onTap: () {
          log("TODO navigate to the product details screen");
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(ManagerRadius.r30),
              child: FancyShimmerImage(
                imageUrl: ManagerAssets.productImageUrl,
                width: double.infinity,
                height: size.height * Constant.d_22,
              ),
            ),
            Row(
              children: [
                Flexible(
                  flex: Constant.titleFlexible,
                  child: TitlesTextWidget(label: "Title " * 10),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(IconlyLight.heart),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  flex: Constant.priceFlexible,
                  child: SubtitleTextWidget(label: "166.5\$"),
                ),
                Flexible(
                  child: Material(
                    borderRadius: BorderRadius.circular(ManagerRadius.r16),
                    color: ManagerColors.lightBlueColor,
                    child: InkWell(
                      splashColor: ManagerColors.redColor,
                      borderRadius: BorderRadius.circular(ManagerRadius.r16),
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ManagerHeight.h8,
                            horizontal: ManagerWidth.w8),
                        child: const Icon(Icons.add_shopping_cart_rounded),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ManagerHeight.h10,
            ),
          ],
        ),
      ),
    );
  }
}
