import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/providers/theme_provider.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SubtitleTextWidget(
            label: "Hi again!",
            fontSize: 60,
            color: Colors.red,
          ),
          TitlesTextWidget(
            color: ManagerColors.lightCardColor,
            label: "This is a title" * 10,
            fontSize: 50,
            maxLines: 2,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Hello world"),
          ),
          SwitchListTile(
            title:
                Text(themeProvider.getIsDarkTheme ? "Dark mode" : "Light mode"),
            value: themeProvider.getIsDarkTheme,
            onChanged: (value) {
              themeProvider.setDarkTheme(themeValue: value);
            },
          ),
        ],
      ),
    );
  }
}
