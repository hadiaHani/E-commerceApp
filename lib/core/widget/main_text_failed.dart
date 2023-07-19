// import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
// import 'package:flutter/material.dart';
// import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
// import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
// import 'package:ecommerce_admin_app_firebase/core/resources/manager_styles.dart';

// import 'package:ecommerce_admin_app_firebase/core/extension/extension.dart';

// Padding baseTextFormField(
//     {TextEditingController? controller,
//     String? hintText,
//     TextInputType? keyboardType,
//     bool? obscureText,
//     validator,
//     Color? fillColor,
//     maxLines}) {
//   return Padding(
//     padding: EdgeInsets.symmetric(
//       horizontal: ManagerWidth.w30,
//     ),
//     child: TextFormField(
//       maxLines: maxLines ?? 1,
//       style: getRegularTextStyle(
//         fontSize: ManagerFontSize.s15,
//         color: ManagerColors.primaryTextColor,
//       ),
//       controller: controller,
//       keyboardType: keyboardType ?? TextInputType.text,
//       cursorColor: ManagerColors.primaryColor,
//       obscureText: obscureText.onNull(),
//       validator: validator,
//       decoration: InputDecoration(
//         filled: true,
//         contentPadding: EdgeInsets.symmetric(
//           horizontal: ManagerWidth.w16,
//           vertical: ManagerHeight.h6,
//         ),
//         fillColor: fillColor ?? ManagerColors.fillColor,
//         hintText: hintText.onNull(),
//         hintStyle: getRegularTextStyle(
//             fontSize: ManagerFontSize.s15,
//             color: ManagerColors.textFaieldColor),
//         enabledBorder: UnderlineInputBorder(
//           borderRadius: BorderRadius.circular(ManagerRadius.r5),
//           borderSide:
//               const BorderSide(color: ManagerColors.textFaieldBoarderColor),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(ManagerRadius.r5),
//           borderSide: const BorderSide(color: ManagerColors.primaryColor),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(ManagerRadius.r5),
//           borderSide: BorderSide.none,
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(ManagerRadius.r5),
//           borderSide: const BorderSide(color: ManagerColors.errorColor),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(ManagerRadius.r5),
//           borderSide: const BorderSide(color: ManagerColors.errorColor),
//         ),
//         errorStyle: const TextStyle(color: ManagerColors.errorColor),
//       ),
//     ),
//   );
// }

// Padding baseTextFormFieldIcon(
//     {void Function()? onPressed,
//     required Widget icon,
//     TextEditingController? controller,
//     String? hintText,
//     TextInputType? keyboardType,
//     bool? obscureText,
//     validator,
//     contentPadding,
//     Color? fillColor,
//     readOnly}) {
//   return Padding(
//     padding: EdgeInsets.symmetric(
//       horizontal: ManagerWidth.w30,
//     ),
//     child: TextFormField(
//       readOnly: readOnly ?? false,
//       style: getRegularTextStyle(
//         fontSize: ManagerFontSize.s15,
//         color: ManagerColors.primaryTextColor,
//       ),
//       controller: controller,
//       keyboardType: keyboardType,
//       cursorColor: ManagerColors.primaryColor,
//       obscureText: obscureText.onNull(),
//       validator: validator,
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.symmetric(
//           horizontal: contentPadding ?? ManagerWidth.w16,
//           vertical: contentPadding ??
//               ManagerHeight.h10, // زيادة حجم العمود العمودي هنا
//         ),
//         filled: true,
//         fillColor: fillColor ?? ManagerColors.fillColor,
//         hintText: hintText.onNull(),
//         hintStyle: getRegularTextStyle(
//             fontSize: ManagerFontSize.s15,
//             color: ManagerColors.textFaieldColor),
//         enabledBorder: UnderlineInputBorder(
//           borderRadius: BorderRadius.circular(ManagerRadius.r5),
//           borderSide:
//               const BorderSide(color: ManagerColors.textFaieldBoarderColor),
//         ),
//         suffixIcon: IconButton(onPressed: onPressed, icon: icon),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(ManagerRadius.r5),
//           borderSide: const BorderSide(color: ManagerColors.primaryColor),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(ManagerRadius.r5),
//           borderSide: BorderSide.none,
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(ManagerRadius.r5),
//           borderSide: const BorderSide(color: ManagerColors.errorColor),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(ManagerRadius.r5),
//           borderSide: const BorderSide(color: ManagerColors.errorColor),
//         ),
//         errorStyle: const TextStyle(color: ManagerColors.errorColor),
//       ),
//     ),
//   );
// }

// BoxShadow customShadow() {
//   return const BoxShadow(
//     color: Color(0x12b7b7b7),
//     offset: Offset(0, 20),
//     blurRadius: 30,
//   );
//   /*BoxShadow(
//     color: Colors.grey.withOpacity(0.2),
//     spreadRadius: 2,
//     blurRadius: 7,
//     blurStyle: BlurStyle.outer,
//     offset: const Offset(
//       0,
//       1,
//     ),
//   );*/
// }
