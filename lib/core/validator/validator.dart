import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';

class FailedValidator {
  static String? displayNamevalidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return ManagerStrings.nameValidator;
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return ManagerStrings.nameLengthValidator;
    }

    return null;
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return ManagerStrings.enterEmail;
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return ManagerStrings.emailValidator;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return ManagerStrings.enterPassword;
    }
    if (value.length < 6) {
      return ManagerStrings.passwordLengthValidator;
    }
    return null;
  }

  static String? repeatPasswordValidator({String? value, String? password}) {
    if (value != password) {
      return ManagerStrings.passwordsMatch;
    }
    return null;
  }
}
