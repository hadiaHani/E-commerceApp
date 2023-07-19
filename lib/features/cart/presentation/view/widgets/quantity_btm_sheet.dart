import 'dart:developer';

import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';

class QuantityBottomSheetWidget extends StatelessWidget {
  const QuantityBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ManagerHeight.h8, horizontal: ManagerWidth.w8),
      child: Column(
        children: [
          SizedBox(
            height: ManagerHeight.h20,
          ),
          Container(
            height: ManagerHeight.h6,
            width: ManagerWidth.w50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ManagerRadius.r12),
              color: ManagerColors.greyColor,
            ),
          ),
          SizedBox(
            height: ManagerHeight.h20,
          ),
          Expanded(
            child: ListView.builder(
              // shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: 30,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    log("index  $index");
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ManagerHeight.h3,
                        horizontal: ManagerWidth.w3),
                    child: Center(
                      child: SubtitleTextWidget(
                        label: "${index + 1}",
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
