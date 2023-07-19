import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/subtitle_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:ecommerce_admin_app_firebase/features/cart/presentation/view/widgets/quantity_btm_sheet.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: ManagerHeight.h8, horizontal: ManagerWidth.w8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(ManagerRadius.r12),
                child: FancyShimmerImage(
                  imageUrl:
                      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png',
                  height: size.height * Constant.d_2,
                  width: size.height * Constant.d_2,
                ),
              ),
              SizedBox(
                width: ManagerWidth.w10,
              ),
              IntrinsicWidth(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * Constant.d_6,
                          child: TitlesTextWidget(
                            label: "Title" * Constant.d_10,
                            maxLines: Constant.titleMaxLines,
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.clear,
                                color: ManagerColors.redColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                IconlyLight.heart,
                                color: ManagerColors.redColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubtitleTextWidget(
                          label: "16\$",
                          fontSize: ManagerFontSize.s20,
                          color: ManagerColors.blueColor,
                        ),
                        const Spacer(),
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(ManagerRadius.r30),
                            ),
                            side: BorderSide(
                              width: ManagerWidth.w2,
                              color: ManagerColors.blueColor,
                            ),
                          ),
                          onPressed: () async {
                            await showModalBottomSheet(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(ManagerRadius.r20),
                                  topRight: Radius.circular(ManagerRadius.r20),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return const QuantityBottomSheetWidget();
                              },
                            );
                          },
                          icon: const Icon(IconlyLight.arrowDown2),
                          label: const Text("Qty: 6 "),
                        ),
                      ],
                    )
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
