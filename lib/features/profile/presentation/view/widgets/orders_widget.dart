import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_assets.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/subtitle_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class OrdersWidgetFree extends StatelessWidget {
  const OrdersWidgetFree({super.key});
  final bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ManagerWidth.w8,
        vertical: ManagerHeight.h2,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(ManagerRadius.r12),
            child: FancyShimmerImage(
              height: size.width * Constant.d_24,
              width: size.width * Constant.d_24,
              imageUrl: ManagerAssets.productImageUrl,
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w12,
                vertical: ManagerHeight.h12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TitlesTextWidget(
                          label: 'productTitle',
                          maxLines: Constant.titleMaxLines,
                          fontSize: ManagerFontSize.s18,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.clear,
                            color: ManagerColors.redColor,
                            size: ManagerIconSize.s22,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      TitlesTextWidget(
                        label: 'Price:  ',
                        fontSize: ManagerFontSize.s16,
                      ),
                      Flexible(
                        child: SubtitleTextWidget(
                          label: "11.99 \$",
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.blueColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ManagerHeight.h6,
                  ),
                  SubtitleTextWidget(
                    label: "Qty: 10",
                    fontSize: ManagerFontSize.s16,
                  ),
                  // const Row(
                  //   children: [
                  //     Flexible(
                  //       child: TitlesTextWidget(
                  //         label: 'Qty:  ',
                  //         fontSize: 15,
                  //       ),
                  //     ),
                  //     Flexible(
                  //       child: SubtitleTextWidget(
                  //         label: "10",
                  //         fontSize: 15,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: ManagerHeight.h6,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
