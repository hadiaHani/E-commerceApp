import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/config/dependency_injection.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_theme_data.dart';
import 'package:ecommerce_admin_app_firebase/features/auth/presentation/controller/forgot_password_provider.dart';
import 'package:ecommerce_admin_app_firebase/features/auth/presentation/controller/login_provider.dart';
import 'package:ecommerce_admin_app_firebase/features/auth/presentation/controller/register_provider.dart';
import 'package:ecommerce_admin_app_firebase/features/cart/presentation/controller/cart_provider.dart';
import 'package:ecommerce_admin_app_firebase/features/profile/presentation/controller/viewed_prod_provider.dart';
import 'package:ecommerce_admin_app_firebase/features/profile/presentation/controller/wishlist_provider.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/controller/product_provider.dart';
import 'package:ecommerce_admin_app_firebase/providers/theme_provider.dart';
import 'package:ecommerce_admin_app_firebase/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

void main() async {
  await initModule();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(
        Constant.deviceWidth,
        Constant.deviceHeight,
      ),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => ThemeProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => LoginProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => RegisterProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => ForgotPassProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => ProductProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => CartProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => WishlistProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => ViewedProdProvider(),
            ),
          ],
          child: Consumer<ThemeProvider>(
            builder: (
              context,
              themeProvider,
              child,
            ) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Shop Smart AR',
                theme: Styles.themeData(
                    isDarkTheme: themeProvider.getIsDarkTheme,
                    context: context),
                onGenerateRoute: RoutGenerator.getRout,
                initialRoute: Routes.startScreen,
              );
            },
          ),
        );
      },
    );
  }
}
