import 'package:Expenza/core/base_screen.dart';
import 'package:Expenza/core/utils/styles/themes/app_themes.dart';
import 'package:Expenza/core/utils/styles/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'features/auth/presentation/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await ScreenUtil.ensureScreenSize();
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
