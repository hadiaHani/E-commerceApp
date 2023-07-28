import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/subtitle_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:ecommerce_admin_app_firebase/features/dashboard/home/presentation/view/edit_upload_product_form.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/controller/product_provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget dashboardProductWidget(
    {required BuildContext context, required String productId}) {
  Size size = MediaQuery.of(context).size;

  final productProvider = Provider.of<ProductProvider>(context);
  final getCurrProduct = productProvider.findByProdId(productId);

  return getCurrProduct == null
      ? const SizedBox.shrink()
      : Padding(
          padding: EdgeInsets.symmetric(
              vertical: ManagerHeight.h3, horizontal: ManagerWidth.w3),
          child: GestureDetector(
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditOrUploadProductScreen(
                      productModel: getCurrProduct,
                    ),
                  ));
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
                SizedBox(
                  height: ManagerHeight.h15,
                ),
                TitlesTextWidget(
                  fontSize: ManagerFontSize.s20,
                  label: getCurrProduct.productTitle,
                  maxLines: 2,
                ),
                SizedBox(
                  height: ManagerHeight.h15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w04),
                  child: SubtitleTextWidget(
                    label: "${getCurrProduct.productPrice}\$",
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h15,
                ),
              ],
            ),
          ),
        );
}
