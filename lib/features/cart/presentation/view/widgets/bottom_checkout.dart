import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/subtitle_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:ecommerce_admin_app_firebase/features/cart/presentation/controller/cart_provider.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/controller/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartBottomCheckout extends StatelessWidget {
  const CartBottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
              width: ManagerWidth.w1, color: ManagerColors.greyColor),
        ),
      ),
      child: SizedBox(
        height: kBottomNavigationBarHeight + ManagerHeight.h14,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w18, vertical: ManagerHeight.h10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                        child: TitlesTextWidget(
                            label:
                                "Total (${cartProvider.getCartItems.length} products/${cartProvider.getQty()} Items)")),
                    SubtitleTextWidget(
                      label:
                          "${cartProvider.getTotal(productProvider: productProvider)}\$",
                      color: ManagerColors.blueColor,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(ManagerStrings.checkout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
