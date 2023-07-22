import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/core/validator/validator.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/app_name_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:ecommerce_admin_app_firebase/features/auth/presentation/controller/register_provider.dart';
import 'package:ecommerce_admin_app_firebase/features/auth/presentation/view/widgets/pick_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerProvier = Provider.of<RegisterProvider>(context);
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w8, vertical: ManagerHeight.h8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: ManagerHeight.h60,
                ),
                AppNameTextWidget(
                  fontSize: ManagerFontSize.s30,
                ),
                SizedBox(height: ManagerHeight.h16),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitlesTextWidget(label: ManagerStrings.welcome),
                    ],
                  ),
                ),
                SizedBox(height: ManagerHeight.h16),
                SizedBox(
                  height: size.width * Constant.d_3,
                  width: size.width * Constant.d_3,
                  child: PickImageWidget(
                    pickedImage: registerProvier.pickedImage,
                    function: () async {
                      await registerProvier.localImagePicker(context);
                    },
                  ),
                ),
                SizedBox(height: ManagerHeight.h16),
                Form(
                  key: registerProvier.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: registerProvier.nameController,
                        focusNode: registerProvier.nameFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          hintText: ManagerStrings.fullName,
                          prefixIcon: Icon(
                            IconlyLight.message,
                          ),
                        ),
                        validator: (value) {
                          return FailedValidator.displayNamevalidator(value);
                        },
                        onFieldSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(registerProvier.emailFocusNode);
                        },
                      ),
                      SizedBox(height: ManagerHeight.h16),
                      TextFormField(
                        controller: registerProvier.emailController,
                        focusNode: registerProvier.emailFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: ManagerStrings.emailAddress,
                          prefixIcon: Icon(
                            IconlyLight.message,
                          ),
                        ),
                        validator: (value) {
                          return FailedValidator.emailValidator(value);
                        },
                        onFieldSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(registerProvier.passwordFocusNode);
                        },
                      ),
                      SizedBox(height: ManagerHeight.h16),
                      TextFormField(
                        controller: registerProvier.passwordController,
                        focusNode: registerProvier.passwordFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: registerProvier.obscureText,
                        decoration: InputDecoration(
                          hintText: ManagerStrings.hintPass,
                          prefixIcon: const Icon(
                            IconlyLight.lock,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              registerProvier.isobscureText();
                            },
                            icon: Icon(
                              registerProvier.obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        validator: (value) {
                          return FailedValidator.passwordValidator(value);
                        },
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(
                              registerProvier.confirmPasswordFocusNode);
                        },
                      ),
                      SizedBox(height: ManagerHeight.h16),
                      TextFormField(
                        controller: registerProvier.confirmPasswordController,
                        focusNode: registerProvier.confirmPasswordFocusNode,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: registerProvier.obscureTextConfirmPass,
                        decoration: InputDecoration(
                          hintText: ManagerStrings.hintPass,
                          prefixIcon: const Icon(
                            IconlyLight.lock,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              registerProvier.isobscureConfirmPassText();
                            },
                            icon: Icon(
                              registerProvier.obscureTextConfirmPass
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        validator: (value) {
                          return FailedValidator.repeatPasswordValidator(
                              value: value,
                              password:
                                  registerProvier.passwordController.text);
                        },
                        onFieldSubmitted: (value) {
                          registerProvier.registerFct(context);
                        },
                      ),
                      SizedBox(height: ManagerHeight.h24),
                      SizedBox(
                        height: kBottomNavigationBarHeight - 10,
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 218, 226, 226),
                            padding: EdgeInsets.symmetric(
                                horizontal: ManagerWidth.w12,
                                vertical: ManagerHeight
                                    .h12), // backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                ManagerRadius.r10,
                              ),
                            ),
                          ),
                          icon: const Icon(
                            IconlyLight.addUser,
                            color: ManagerColors.blackColor,
                          ),
                          label: Text(
                            ManagerStrings.signUp,
                            style: TextStyle(
                                fontSize: ManagerFontSize.s20,
                                color: ManagerColors.blackColor),
                          ),
                          onPressed: () async {
                            registerProvier.registerFct(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
