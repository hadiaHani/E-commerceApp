import 'package:ecommerce_admin_app_firebase/core/cache/cache.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/subtitle_text.dart';
import 'package:ecommerce_admin_app_firebase/routes/routes.dart';
import 'package:flutter/material.dart';

class CategoryRoundedWidget extends StatelessWidget {
  const CategoryRoundedWidget({
    super.key,
    required this.image,
    required this.name,
  });

  final String image, name;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CacheData().setName(name);
        Navigator.pushNamed(
          context,
          Routes.searchScreen,
        );
      },
      child: Column(
        children: [
          Image.asset(
            image,
            height: ManagerHeight.h54,
            width: ManagerWidth.w56,
          ),
          SizedBox(
            height: ManagerHeight.h15,
          ),
          SubtitleTextWidget(
            label: name,
            fontSize: ManagerFontSize.s18,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
