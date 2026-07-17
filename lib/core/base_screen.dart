import 'package:Expenza/core/utils/constants/nav_items.dart';
import 'package:Expenza/core/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      bottomNavigationBar: NavBar(
        navItems: navItems,
        backColor: theme.cardColor,
        iconColor: theme.primaryColor,
        scaffoldColor: theme.scaffoldBackgroundColor,
      ),
    );
  }
}
