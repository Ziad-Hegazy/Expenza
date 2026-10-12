class MandatoryValidator {
  static String? validate(String name, String? value) {
    return (value == null || value.trim().isEmpty) ? '$name is required' : null;
  }
}
