import 'package:ecommerce_admin_app_firebase/config/dependency_injection.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/features/auth/presentation/view/forgot_password.dart';
import 'package:ecommerce_admin_app_firebase/features/auth/presentation/view/login.dart';
import 'package:ecommerce_admin_app_firebase/features/auth/presentation/view/register.dart';
import 'package:ecommerce_admin_app_firebase/features/dashboard/home/presentation/view/dashboard_screen.dart';
import 'package:ecommerce_admin_app_firebase/features/dashboard/home/presentation/view/edit_upload_product_form.dart';
import 'package:ecommerce_admin_app_firebase/features/dashboard/home/presentation/view/search_screen.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/view/product_details.dart';
import 'package:ecommerce_admin_app_firebase/features/profile/presentation/view/orders.dart';
import 'package:ecommerce_admin_app_firebase/features/profile/presentation/view/viewed_recently.dart';
import 'package:ecommerce_admin_app_firebase/features/profile/presentation/view/wishlist.dart';
import 'package:ecommerce_admin_app_firebase/features/main/presenration/view/root_screen.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/view/search_screen.dart';
import 'package:ecommerce_admin_app_firebase/start_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String startScreen = "/start_view";

  static const String productDetailesView = "/product_detailes_view";
  static const String routeView = "/route_view";
  static const String wishlistScreen = "/wishlist_view";
  static const String viewedRecentlyScreen = "/viewed_recently_view";
  static const String loginScreen = "/login_view";
  static const String registerView = "/register_view";
  static const String orderScreen = "/OrderScreen";
  static const String searchScreen = "/SearchScreen";
  static const String forgotPasswordScreen = "/forgot_password_screen";
  static const String dashBoardView = "/dash_board_view";
  static const String dashBoardSearchView = "/dash_board_search_view";
  static const String editOrUploadProductScreen = "/EditOrUploadProductScreen";
}

class RoutGenerator {
  static Route<dynamic> getRout(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startScreen:
        return MaterialPageRoute(
          builder: (context) => const StartScrren(),
        );
      case Routes.productDetailesView:
        return MaterialPageRoute(
          builder: (context) => const ProductDetails(),
        );
      case Routes.routeView:
        initMain();
        initSearch();

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
        initSearch();
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      case Routes.dashBoardView:
        return MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        );
      case Routes.dashBoardSearchView:
        return MaterialPageRoute(
          builder: (context) => const DashboardSearchScreen(),
        );
      case Routes.editOrUploadProductScreen:
        return MaterialPageRoute(
          builder: (context) => const EditOrUploadProductScreen(),
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
