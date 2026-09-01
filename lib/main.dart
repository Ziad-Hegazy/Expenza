import 'package:Expenza/core/utils/styles/themes/app_themes.dart';
import 'package:Expenza/core/utils/styles/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'features/auth/presentation/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await ScreenUtil.ensureScreenSize();
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: Size(402, 874),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.light,
          darkTheme: AppThemes.light,
          //TODO: implement dark theme and re-add it
          themeMode: ref.watch(themeProvider),
          home: Login(),
        );
      },
    );
  }
}
