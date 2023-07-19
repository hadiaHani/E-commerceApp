import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';

class FailedValidator {
  String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return ManagerStrings.requiredField;
    }

    if (!RegExp(r"\S+@\S+\.\S+").hasMatch(email)) {
      return ManagerStrings.invalidEmail;
    }

    return null;
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return ManagerStrings.invalidEmptyPassword;
    }

    if (password.length < 8) {
      return ManagerStrings.invalidPassword;
    }

    return null;
  }

  String? validateInput(String? input) {
    if (input!.isEmpty) {
      return ManagerStrings.requiredField;
    }

    return null;
  }

  String? validateNumber(String? input) {
    if (input!.isEmpty) {
      return ManagerStrings.requiredField;
    }

    return null;
  }

  String? validatePhone(String? phone) {
    if (phone!.isEmpty) {
      return ManagerStrings.requiredPhone;
    }

    return null;
  }
}
