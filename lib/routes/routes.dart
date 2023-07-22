import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/features/auth/presentation/view/forgot_password.dart';
import 'package:ecommerce_admin_app_firebase/features/auth/presentation/view/login.dart';
import 'package:ecommerce_admin_app_firebase/features/auth/presentation/view/register.dart';
import 'package:ecommerce_admin_app_firebase/features/product_details.dart';
import 'package:ecommerce_admin_app_firebase/features/profile/presentation/view/orders.dart';
import 'package:ecommerce_admin_app_firebase/features/profile/presentation/view/viewed_recently.dart';
import 'package:ecommerce_admin_app_firebase/features/profile/presentation/view/wishlist.dart';
import 'package:ecommerce_admin_app_firebase/features/root_screen.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/view/search_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String productDetailesView = "/product_detailes_view";
  static const String routeView = "/route_view";
  static const String wishlistScreen = "/wishlist_view";
  static const String viewedRecentlyScreen = "/viewed_recently_view";
  static const String loginScreen = "/login_view";
  static const String registerView = "/register_view";
  static const String orderScreen = "/OrderScreen";
  static const String searchScreen = "/SearchScreen";

  static const String forgotPasswordScreen = "/forgot_password_screen";
}

class RoutGenerator {
  static Route<dynamic> getRout(RouteSettings settings) {
    switch (settings.name) {
      case Routes.productDetailesView:
        return MaterialPageRoute(
          builder: (context) => const ProductDetails(),
        );
      case Routes.routeView:
        return MaterialPageRoute(
          builder: (context) => const RootScreen(),
        );
      case Routes.wishlistScreen:
        return MaterialPageRoute(
          builder: (context) => const WishlistScreen(),
        );
      case Routes.viewedRecentlyScreen:
        return MaterialPageRoute(
          builder: (context) => const ViewedRecentlyScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.registerView:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case Routes.orderScreen:
        return MaterialPageRoute(
          builder: (context) => const OrdersScreenFree(),
        );
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      default:
        return unDefindRout();
    }
  }

  static Route<dynamic> unDefindRout() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text(ManagerStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(ManagerStrings.noRouteFound),
        ),
      ),
    );
  }
}
