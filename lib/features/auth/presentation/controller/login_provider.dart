import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider() {
    initState();
  }

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late final formKey = GlobalKey<FormState>();
  bool obscureText = true;

  void isobscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> loginFct(context) async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
  }
}
