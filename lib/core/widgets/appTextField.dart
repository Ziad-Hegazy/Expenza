import 'dart:async';

import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.enabled,
    this.textInputAction,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
  });

  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final bool? enabled;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      keyboardType: keyboardType,
      obscureText: obscureText,
      controller: controller,
      textInputAction: textInputAction,
      enabled: enabled,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
