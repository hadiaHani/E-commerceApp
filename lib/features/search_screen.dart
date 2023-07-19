import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TitlesTextWidget(
          label: "SearchScreen",
          color: ManagerColors.lightCardColor,
        ),
      ),
    );
  }
}
