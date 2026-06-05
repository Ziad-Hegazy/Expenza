import 'package:expenza/core/utils/styles/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme copyWith({
    TextStyle? hintStyle,
    Color? fillColor,
    Color? iconColor,
  }) {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      filled: true,
      fillColor: fillColor,
      suffixIconColor: iconColor,
      hintStyle: hintStyle,
      suffixIconConstraints: BoxConstraints.loose(Size(55.w, 50.h)),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.red, width: 3.0.w),
        borderRadius: BorderRadius.circular(15.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.blue, width: 3.0.w),
        borderRadius: BorderRadius.circular(15.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.blue, width: 3.0.w),
        borderRadius: BorderRadius.circular(15.r),
      ),
    );
  }
}
