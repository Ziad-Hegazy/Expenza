import 'package:expenza/core/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme {
  static TextTheme values = TextTheme(
    titleLarge: TextStyle(
      fontSize: 40.sp,
      fontVariations: [FontVariation('wght', 800)],
    ),
    titleMedium: TextStyle(
      fontSize: 24.sp,
      fontVariations: [FontVariation('wght', 500)],
    ),
    bodyLarge: TextStyle(
      fontSize: 18.sp,
      fontVariations: [FontVariation('wght', 500)],
    ),
    bodyMedium: TextStyle(
      fontSize: 18.sp,
      fontVariations: [FontVariation('wght', 500)],
    ),
    headlineMedium: TextStyle(
      fontSize: 18.sp,
      fontVariations: [FontVariation('wght', 700)],
    ),
    headlineSmall: TextStyle(
      fontSize: 16.sp,
      fontVariations: [FontVariation('wght', 700)],
    ),
    displayMedium: TextStyle(
      fontSize: 24.sp,
      fontVariations: [FontVariation('wght', 800)],
    ),
  ).apply(fontFamily: googleSansFlex);

  static TextTheme copyWith({Color? color}) {
    return values.apply(fontFamily: googleSansFlex, bodyColor: color);
  }
}
