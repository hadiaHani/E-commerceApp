import 'package:ecommerce_admin_app_firebase/core/resources/manager_assets.dart';
import 'package:ecommerce_admin_app_firebase/features/home/domain/model/categories_model.dart';

class Constant {
  static const double deviceWidth = 428;

  static const double deviceHeight = 926;
  static const int splashDeuration = 5;
  static const double elevationButton = 0;
  static const double iconSize = 20;
  static const double getStateWidgetRenderStateElevation = 3;
  static const int loginTimer = 1;
  static const double elevationAppbar = 0;
  static const int unauthenticatedSession = 2;
  static const int shimmerSeconds = 10;
  static const double d_2 = 0.2;
  static const double d_3 = 0.3;
  static const double d_6 = 0.6;
  static const int d_10 = 10;
  static const double d_35 = 0.35;
  static const double d_38 = 0.38;

  static const double d_45 = 0.45;
  static const double d_28 = 0.28;

  static const int cartBottomCheckoutHeight = 10;
  static const int titleMaxLines = 2;
  static const double d_22 = 0.22;
  static const double d_24 = 0.24;

  static List<String> bannersImages = [
    ManagerAssets.banner1,
    ManagerAssets.banner2,
  ];
  static const int titleFlexible = 5;
  static const int buttonFlexible = 2;

  static const int priceFlexible = 3;
  static const int gridViewCrossAxisCount = 2;
  static const int categoryCrossAxisCount = 4;

  static const String homeScreen = 'Home';
  static const String searchScreen = 'Search';
  static const String cartScreen = 'Cart';
  static const String profileScreen = 'Profile';
  static List<CategoryModel> categoriesList = [
    CategoryModel(
      id: "Phones",
      image: ManagerAssets.mobiles,
      name: "Phones",
    ),
    CategoryModel(
      id: "Laptops",
      image: ManagerAssets.pc,
      name: "Laptops",
    ),
    CategoryModel(
      id: "Electronics",
      image: ManagerAssets.electronics,
      name: "Electronics",
    ),
    CategoryModel(
      id: "Watches",
      image: ManagerAssets.watch,
      name: "Watches",
    ),
    CategoryModel(
      id: "Clothes",
      image: ManagerAssets.fashion,
      name: "Clothes",
    ),
    CategoryModel(
      id: "Shoes",
      image: ManagerAssets.shoes,
      name: "Shoes",
    ),
    CategoryModel(
      id: "Books",
      image: ManagerAssets.book,
      name: "Books",
    ),
    CategoryModel(
      id: "Cosmetics",
      image: ManagerAssets.cosmetics,
      name: "Cosmetics",
    ),
  ];
}

class ConstantsPrefsKeys {
  static const themeStatusKey = "THEME_STATUS";
}
