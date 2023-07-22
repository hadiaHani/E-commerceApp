import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_assets.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/core/validator/validator.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/app_name_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/subtitle_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:ecommerce_admin_app_firebase/features/auth/presentation/controller/forgot_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final forgotPassProvider = Provider.of<ForgotPassProvider>(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppNameTextWidget(
          fontSize: ManagerFontSize.s22,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w24),
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: ManagerHeight.h10,
              ),
              Image.asset(
                ManagerAssets.forgotPassword,
                width: size.width * Constant.d_6,
                height: size.width * Constant.d_6,
              ),
              SizedBox(
                height: ManagerHeight.h10,
              ),
              TitlesTextWidget(
                label: ManagerStrings.forgetPassword,
                fontSize: ManagerFontSize.s22,
              ),
              SubtitleTextWidget(
                label: ManagerStrings.enterEmailAddress,
                fontSize: ManagerFontSize.s16,
              ),
              SizedBox(
                height: ManagerHeight.h40,
              ),
              Form(
                key: forgotPassProvider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: forgotPassProvider.emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: ManagerStrings.hintEmail,
                        prefixIcon: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: ManagerHeight.h12,
                              vertical: ManagerHeight.h12),
                          child: const Icon(IconlyLight.message),
                        ),
                        filled: true,
                      ),
                      validator: (value) {
                        return FailedValidator.emailValidator(value);
                      },
                      onFieldSubmitted: (_) {},
                    ),
                    SizedBox(
                      height: ManagerHeight.h16,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ManagerHeight.h20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: ManagerHeight.h12,
                        vertical: ManagerHeight.h12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        ManagerRadius.r10,
                      ),
                    ),
                  ),
                  icon: const Icon(IconlyBold.send),
                  label: Text(
                    ManagerStrings.requestLink,
                    style: TextStyle(
                      fontSize: ManagerFontSize.s20,
                    ),
                  ),
                  onPressed: () async {
                    forgotPassProvider.forgetPassFCT(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
