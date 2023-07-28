import 'package:ecommerce_admin_app_firebase/core/cache/cache.dart';
import 'package:ecommerce_admin_app_firebase/features/cart/presentation/view/cart_screen.dart';
import 'package:ecommerce_admin_app_firebase/features/home/presentation/view/home_screen.dart';
import 'package:ecommerce_admin_app_firebase/features/profile/presentation/view/profile_screen.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/view/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  late PageController controller;
  int currentScreen = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];

  @override
  void onInit() {
    controller = PageController(
      initialPage: currentScreen,
    );
    super.onInit();
  }

  onDestinationSelected(int index) {
    currentScreen = index;
    CacheData().setName("");

    update();
  }
}
