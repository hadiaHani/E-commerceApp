import 'dart:io';

import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key, this.pickedImage, required this.function});
  final XFile? pickedImage;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w8, vertical: ManagerHeight.h8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(ManagerRadius.r8),
            child: pickedImage == null
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ManagerRadius.r8),
                      border: Border.all(color: ManagerColors.greyColor),
                    ),
                  )
                : Image.file(
                    File(
                      pickedImage!.path,
                    ),
                    fit: BoxFit.fill,
                  ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Material(
            borderRadius: BorderRadius.circular(ManagerRadius.r16),
            color: ManagerColors.lightBlueColor,
            child: InkWell(
              splashColor: ManagerColors.redColor,
              borderRadius: BorderRadius.circular(ManagerRadius.r16),
              onTap: () {
                function();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ManagerWidth.w8, vertical: ManagerHeight.h8),
                child: Icon(
                  Icons.add_shopping_cart_rounded,
                  size: ManagerIconSize.s20,
                  color: ManagerColors.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
