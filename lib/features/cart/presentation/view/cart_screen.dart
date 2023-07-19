import 'package:ecommerce_admin_app_firebase/core/resources/manager_assets.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/empty_bag.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:ecommerce_admin_app_firebase/features/cart/presentation/view/widgets/bottom_checkout.dart';
import 'package:ecommerce_admin_app_firebase/features/cart/presentation/view/widgets/cart_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
                imagePath: ManagerAssets.shoppingBasket,
                title: ManagerStrings.cartIsEmpty,
                subtitle: ManagerStrings.cartViewText,
                buttonText: ManagerStrings.shopNow),
          )
        : Scaffold(
            bottomSheet: const CartBottomCheckout(),
            appBar: AppBar(
              title: const TitlesTextWidget(label: "Cart (5)"),
              leading: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ManagerHeight.h8, horizontal: ManagerWidth.w8),
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
            body: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return const CartWidget();
              },
            ),
          );
  }
}
