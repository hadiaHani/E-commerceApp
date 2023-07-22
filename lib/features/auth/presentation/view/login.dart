import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/core/validator/validator.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/app_name_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/subtitle_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:ecommerce_admin_app_firebase/features/auth/presentation/controller/login_provider.dart';
import 'package:ecommerce_admin_app_firebase/features/auth/presentation/view/widgets/google_btn.dart';
import 'package:ecommerce_admin_app_firebase/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

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
                  child: TitlesTextWidget(label: ManagerStrings.welcomeBack),
                ),
                SizedBox(height: ManagerHeight.h16),
                Form(
                  key: loginProvider.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: loginProvider.emailController,
                        focusNode: loginProvider.emailFocusNode,
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
                              .requestFocus(loginProvider.passwordFocusNode);
                        },
                      ),
                      SizedBox(height: ManagerHeight.h16),
                      TextFormField(
                        controller: loginProvider.passwordController,
                        focusNode: loginProvider.passwordFocusNode,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: loginProvider.obscureText,
                        decoration: InputDecoration(
                          hintText: ManagerStrings.hintPass,
                          prefixIcon: const Icon(
                            IconlyLight.lock,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              loginProvider.isobscureText();
                            },
                            icon: Icon(
                              loginProvider.obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        validator: (value) {
                          return FailedValidator.passwordValidator(value);
                        },
                        onFieldSubmitted: (value) {
                          loginProvider.loginFct(context);
                        },
                      ),
                      SizedBox(height: ManagerHeight.h16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.forgotPasswordScreen);
                          },
                          child: const SubtitleTextWidget(
                            label: ManagerStrings.forgetPass,
                            textDecoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      SizedBox(height: ManagerHeight.h16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: ManagerWidth.w12,
                                vertical: ManagerHeight.h12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                ManagerRadius.r10,
                              ),
                            ),
                          ),
                          icon: const Icon(Icons.login),
                          label: Text(
                            ManagerStrings.login,
                            style: TextStyle(
                              fontSize: ManagerFontSize.s20,
                            ),
                          ),
                          onPressed: () async {
                            loginProvider.loginFct(context);
                          },
                        ),
                      ),
                      SizedBox(
                        height: ManagerHeight.h16,
                      ),
                      SubtitleTextWidget(
                        label: ManagerStrings.connectUsing.toUpperCase(),
                      ),
                      SizedBox(
                        height: ManagerHeight.h16,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ManagerWidth.w8,
                            vertical: ManagerHeight.h8),
                        child: SizedBox(
                          height: kBottomNavigationBarHeight +
                              Constant.cartBottomCheckoutHeight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Expanded(
                                flex: Constant.buttonFlexible,
                                child: SizedBox(
                                  height: kBottomNavigationBarHeight,
                                  child: FittedBox(
                                    child: GoogleButton(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: ManagerWidth.w8,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: kBottomNavigationBarHeight - 15,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          vertical: ManagerHeight.h12,
                                          horizontal: ManagerWidth.w12),
                                      backgroundColor: ManagerColors.blueColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          ManagerRadius.r10,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      ManagerStrings.guest,
                                      style: TextStyle(
                                        color: ManagerColors.whiteColor,
                                        fontSize: ManagerFontSize.s20,
                                      ),
                                    ),
                                    onPressed: () async {
                                      loginProvider.loginFct(context);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ManagerHeight.h16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SubtitleTextWidget(
                              label: ManagerStrings.dontHaveAccount),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.registerView);
                            },
                            child: const SubtitleTextWidget(
                              label: ManagerStrings.signUp,
                              textDecoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
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
