import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_theme_data.dart';
import 'package:ecommerce_admin_app_firebase/providers/theme_provider.dart';
import 'package:ecommerce_admin_app_firebase/features/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
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
          ],
          child: Consumer<ThemeProvider>(
            builder: (
              context,
              themeProvider,
              child,
            ) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Shop Smart AR',
                theme: Styles.themeData(
                    isDarkTheme: themeProvider.getIsDarkTheme,
                    context: context),
                home: const RootScreen(),
              );
            },
          ),
        );
      },
    );
  }
}
