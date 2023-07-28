import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/features/cart/presentation/controller/cart_provider.dart';
import 'package:ecommerce_admin_app_firebase/features/main/presenration/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        body: PageView(
          controller: controller.controller,
          physics: const NeverScrollableScrollPhysics(),
          children: controller.screens,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: controller.currentScreen,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 2,
          height: kBottomNavigationBarHeight,
          onDestinationSelected: (index) {
            controller.onDestinationSelected(index);

            controller.controller.jumpToPage(controller.currentScreen);
          },
          destinations: [
            const NavigationDestination(
              selectedIcon: Icon(IconlyBold.home),
              icon: Icon(IconlyLight.home),
              label: Constant.homeScreen,
            ),
            const NavigationDestination(
              selectedIcon: Icon(IconlyBold.search),
              icon: Icon(IconlyLight.search),
              label: Constant.searchScreen,
            ),
            NavigationDestination(
              selectedIcon: const Icon(IconlyBold.bag2),
              icon: Badge(
                  backgroundColor: ManagerColors.blueColor,
                  label: Text(cartProvider.getCartItems.length.toString()),
                  child: const Icon(IconlyLight.bag2)),
              label: Constant.cartScreen,
            ),
            const NavigationDestination(
              selectedIcon: Icon(IconlyBold.profile),
              icon: Icon(IconlyLight.profile),
              label: Constant.profileScreen,
            ),
          ],
        ),
      );
    });
  }
}
