import 'package:ecommerce_admin_app_firebase/core/resources/manager_assets.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:flutter/material.dart';

import '../widgets/subtitle_text.dart';

Future<void> showErrorORWarningDialog({
  required BuildContext context,
  required String subtitle,
  required Function fct,
  bool isError = true,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ManagerRadius.r12),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              ManagerAssets.warning,
              height: ManagerHeight.h60,
              width: ManagerWidth.w60,
            ),
            SizedBox(
              height: ManagerHeight.h16,
            ),
            SubtitleTextWidget(
              label: subtitle,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: ManagerHeight.h16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: !isError,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const SubtitleTextWidget(
                        label: ManagerStrings.cancellation,
                        color: ManagerColors.greenColor),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    fct();
                    Navigator.pop(context);
                  },
                  child: const SubtitleTextWidget(
                      label: ManagerStrings.ok, color: ManagerColors.redColor),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Future<void> imagePickerDialog({
  required BuildContext context,
  required Function cameraFCT,
  required Function galleryFCT,
  required Function removeFCT,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(
          child: TitlesTextWidget(
            label: ManagerStrings.chooseOption,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              TextButton.icon(
                onPressed: () {
                  cameraFCT();
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.camera),
                label: const Text(
                  ManagerStrings.camera,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  galleryFCT();
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.image),
                label: const Text(
                  ManagerStrings.gallery,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  removeFCT();
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.remove),
                label: const Text(
                  ManagerStrings.remove,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
