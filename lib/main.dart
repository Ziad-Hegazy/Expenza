import 'package:expenza/core/base_screen.dart';
import 'package:expenza/core/utils/styles/themes/app_themes.dart';
import 'package:expenza/core/utils/styles/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'features/auth/presentation/screens/login.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeManager())],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(402, 874),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.light,
          darkTheme: AppThemes.light, //TODO: implement dark theme and re-add it
          themeMode: Provider.of<ThemeManager>(context).themeMode,
          home:Login()
        );
      },
    );
  }
}
