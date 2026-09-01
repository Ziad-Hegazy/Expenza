import 'package:Expenza/core/utils/styles/app_colors.dart';
import 'package:Expenza/core/utils/styles/themes/widget_themes/buttons.dart';
import 'package:Expenza/core/utils/styles/themes/widget_themes/input_decoration.dart';
import 'package:Expenza/core/utils/styles/themes/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.grey,
    cardColor: AppColors.white,
    primaryColor: AppColors.black,
    secondaryHeaderColor: AppColors.blue,
    textTheme: AppTextTheme.copyWith(color: AppColors.black),
    filledButtonTheme: AppFilledButtonTheme.copyWith(
      color: AppColors.blue,
      textStyle: AppTextTheme.values.displayMedium,
    ),
    textButtonTheme: AppTextButtonTheme.copyWith(
      color: AppColors.black,
      textStyle: AppTextTheme.values.headlineSmall,
    ),
    iconButtonTheme: AppIconButtonTheme.copyWith(
      backColor: AppColors.white,
      iconColor: AppColors.black,
    ),
    inputDecorationTheme: AppInputDecorationTheme.copyWith(
      fillColor: AppColors.white,
      hintStyle: AppTextTheme.values.bodyMedium!.copyWith(
        color: AppColors.black.withAlpha(76),
      ),
      iconColor: AppColors.black,
    ),
  );
  static final ThemeData dark = ThemeData.dark().copyWith();
}
