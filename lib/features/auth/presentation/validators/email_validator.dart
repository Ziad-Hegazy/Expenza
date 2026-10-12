import 'package:Expenza/core/utils/validators/mandatory_validator.dart';

class EmailValidator extends MandatoryValidator {
  static String? validate(String? value) {
    final String? error;
    error = MandatoryValidator.validate('Email', value);
    if (error != null) return error;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value!.trim())) {
      return "Email format is incorrect";
    }
    return null;
  }
}
