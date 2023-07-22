import 'package:ecommerce_admin_app_firebase/core/resources/manager_assets.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/app_name_text.dart';
import 'package:ecommerce_admin_app_firebase/features/profile/presentation/view/widgets/custom_list_tile.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/subtitle_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:ecommerce_admin_app_firebase/providers/theme_provider.dart';
import 'package:ecommerce_admin_app_firebase/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: AppNameTextWidget(fontSize: ManagerFontSize.s20),
          leading: Padding(
            padding: EdgeInsets.symmetric(
                vertical: ManagerHeight.h8, horizontal: ManagerWidth.w8),
            child: Image.asset(ManagerAssets.shoppingCart),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: false,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ManagerHeight.h20, horizontal: ManagerWidth.w20),
                child:
                    const TitlesTextWidget(label: ManagerStrings.pleaseLogin),
              ),
            ),
            SizedBox(
              height: ManagerHeight.h20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w10,
              ),
              child: Row(
                children: [
                  Container(
                    height: ManagerHeight.h60,
                    width: ManagerWidth.w60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.background,
                          width: ManagerWidth.w3),
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ManagerWidth.w7,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitlesTextWidget(
                        label: "Hadia Hani",
                        color: ManagerColors.transparent,
                      ),
                      SubtitleTextWidget(label: "coding.with.hadi@gmail.com"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w12,
                vertical: ManagerHeight.h24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitlesTextWidget(
                    label: ManagerStrings.general,
                  ),
                  CustomListTile(
                    imagePath: ManagerAssets.orderSvg,
                    text: ManagerStrings.allOrders,
                    function: () {
                      Navigator.pushNamed(context, Routes.orderScreen);
                    },
                  ),
                  CustomListTile(
                    imagePath: ManagerAssets.wishlistSvg,
                    text: ManagerStrings.wishlist,
                    function: () {
                      Navigator.pushNamed(context, Routes.wishlistScreen);
                    },
                  ),
                  CustomListTile(
                    imagePath: ManagerAssets.recent,
                    text: ManagerStrings.viewedRecently,
                    function: () {
                      Navigator.pushNamed(context, Routes.viewedRecentlyScreen);
                    },
                  ),
                  CustomListTile(
                    imagePath: ManagerAssets.address,
                    text: ManagerStrings.address,
                    function: () {},
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const TitlesTextWidget(label: ManagerStrings.settings),
                  SizedBox(
                    height: ManagerHeight.h7,
                  ),
                  SwitchListTile(
                    secondary: Image.asset(
                      ManagerAssets.theme,
                      height: 30,
                    ),
                    title: Text(
                      themeProvider.getIsDarkTheme
                          ? ManagerStrings.darkMode
                          : ManagerStrings.lightMode,
                    ),
                    value: themeProvider.getIsDarkTheme,
                    onChanged: (value) {
                      themeProvider.setDarkTheme(themeValue: value);
                    },
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ManagerColors.redColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      ManagerRadius.r30,
                    ),
                  ),
                ),
                onPressed: () async {
                  Navigator.pushNamed(context, Routes.loginScreen);

                  /*    showErrorORWarningDialog(
                      context: context,
                      subtitle: ManagerStrings.sure,
                      fct: () {},
                      isError: false);*/
                },
                icon: const Icon(Icons.login),
                label: const Text(
                  ManagerStrings.logout,
                ),
              ),
            ),
          ],
        ));
  }
}
