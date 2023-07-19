import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/features/cart/presentation/view/cart_screen.dart';
import 'package:ecommerce_admin_app_firebase/features/home_screen.dart';
import 'package:ecommerce_admin_app_firebase/features/profile/presentation/view/profile_screen.dart';
import 'package:ecommerce_admin_app_firebase/features/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  late PageController controller;
  int currentScreen = 3;
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];
  void initState() {
    controller = PageController(
      initialPage: currentScreen,
    );
  }

  onDestinationSelected(int index) {
    currentScreen = index;
    notifyListeners();
  }

  bool _darkTheme = false;
  bool get getIsDarkTheme => _darkTheme;

  ThemeProvider() {
    getTheme();
    initState();
  }
  Future<void> setDarkTheme({required bool themeValue}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(ConstantsPrefsKeys.themeStatusKey, themeValue);
    _darkTheme = themeValue;
    notifyListeners();
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _darkTheme = prefs.getBool(ConstantsPrefsKeys.themeStatusKey) ?? false;
    notifyListeners();
    return _darkTheme;
  }
}
