import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/subtitle_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:flutter/material.dart';

class CartBottomCheckout extends StatelessWidget {
  const CartBottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
              width: ManagerWidth.w1, color: ManagerColors.greyColor),
        ),
      ),
      child: SizedBox(
        height: kBottomNavigationBarHeight + ManagerHeight.h14,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w18, vertical: ManagerHeight.h10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    FittedBox(
                      child:
                          TitlesTextWidget(label: "Total (6 products/6 Items)"),
                    ),
                    SubtitleTextWidget(
                      label: "16.99\$",
                      color: ManagerColors.blueColor,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(ManagerStrings.checkout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
