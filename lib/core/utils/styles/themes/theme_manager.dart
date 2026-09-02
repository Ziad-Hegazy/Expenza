import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeManagerProvider = NotifierProvider<ThemeManager, ThemeMode>(
  ThemeManager.new,
);

class ThemeManager extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ThemeMode.system;

  void setCurrent(ThemeMode newTheme) {
    state = newTheme;
  }
}
