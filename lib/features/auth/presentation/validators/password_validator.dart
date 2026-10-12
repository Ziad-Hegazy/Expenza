import 'package:Expenza/core/utils/validators/mandatory_validator.dart';

class PasswordValidator {
  static String? validate(String? value) {
    final String? error;
    error = MandatoryValidator.validate('Password', value);
    if (error != null) return error;
    if ((value?.length ?? 0) < 8) {
      return "Password must have at least 8 characters";
    }
    final passRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)\S+$');
    if (!passRegex.hasMatch(value!.trim())) {
      return "Password must have at least 1 uppercase, 1 lowercase, and 1 number and no spaces";
    }
    return null;
  }

  static String? validateConfirm(String? password, String? confirm) {
    if (password != confirm) {
      return "Passwords do not match";
    }
    return null;
  }
}
