import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFilledButtonTheme {
  static FilledButtonThemeData copyWith({Color? color, TextStyle? textStyle}) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: color,
        textStyle: textStyle,
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      ),
    );
  }
}

class AppTextButtonTheme {
  static TextButtonThemeData copyWith({Color? color, TextStyle? textStyle}) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: color, textStyle: textStyle),
    );
  }
}

class AppIconButtonTheme {
  static IconButtonThemeData copyWith({Color? backColor, Color? iconColor}) {
    return IconButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: backColor,
        foregroundColor: iconColor,
        iconColor: iconColor,
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
      ),
    );
  }
}
