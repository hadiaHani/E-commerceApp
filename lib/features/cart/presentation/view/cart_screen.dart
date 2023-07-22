import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_assets.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/empty_bag.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/show_error_dialog.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:ecommerce_admin_app_firebase/features/cart/presentation/controller/cart_provider.dart';
import 'package:ecommerce_admin_app_firebase/features/cart/presentation/view/widgets/bottom_checkout.dart';
import 'package:ecommerce_admin_app_firebase/features/cart/presentation/view/widgets/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.getCartItems.isEmpty
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
              title: TitlesTextWidget(
                  label: "Cart (${cartProvider.getCartItems.length})"),
              leading: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ManagerHeight.h8, horizontal: ManagerWidth.w8),
                child: Image.asset(ManagerAssets.shoppingCart),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showErrorORWarningDialog(
                        isError: false,
                        context: context,
                        subtitle: ManagerStrings.removeItem,
                        fct: () {
                          cartProvider.clearLocalCart();
                        });
                  },
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.getCartItems.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: cartProvider.getCartItems.values
                            .toList()
                            .reversed
                            .toList()[index],
                        child: const CartWidget(),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: kBottomNavigationBarHeight +
                      Constant.cartBottomCheckoutHeight,
                )
              ],
            ),
          );
  }
}
