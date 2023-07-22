import 'package:flutter/material.dart';

class ForgotPassProvider extends ChangeNotifier {
  ForgotPassProvider() {
    initState();
  }
  late final TextEditingController emailController;
  late final formKey = GlobalKey<FormState>();

  void initState() {
    emailController = TextEditingController();
  }

  Future<void> forgetPassFCT(context) async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
  }
}
